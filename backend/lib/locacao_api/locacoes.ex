defmodule LocacaoApi.Locacoes do
  @moduledoc """
  The Locacoes context.
  """

  import Ecto.Query, warn: false
  alias LocacaoApi.Repo

  alias LocacaoApi.Locacoes.Locacao
  alias LocacaoApi.Midias

  @doc """
  Returns the list of locacao.
  """
  def list_locacao do
    Repo.all(Locacao)
  end

  @doc """
  Gets a single locacao.
  """
  def get_locacao!(id) do
    Repo.get!(Locacao, id)
  end

  @doc """
  Creates a locacao.
  """
  def create_locacao(attrs \\ %{}) do
    case %Locacao{}
         |> Locacao.changeset(attrs)
         |> Repo.insert() do
      {:ok, locacao} ->
        locacao = Repo.preload(locacao, :itens_locacao)
        item = List.first(locacao.itens_locacao)

        if item do
           LocacaoApi.Midias.get_exemplar!(item.exemplar_codigo_interno)
           |> LocacaoApi.Midias.update_exemplar(%{disponivel: false})
        end

        {:ok, locacao}

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  @doc """
  Updates a locacao.
  """
  def update_locacao(%Locacao{} = locacao, attrs) do
    locacao
    |> Repo.preload(:itens_locacao)
    |> Locacao.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a locacao (Cancels it).
  """
  def delete_locacao(%Locacao{} = locacao) do
    locacao = Repo.preload(locacao, :itens_locacao)

    Repo.transaction(fn ->
      locacao
      |> Locacao.changeset(%{cancelada: true})
      |> Repo.update!()

      item = List.first(locacao.itens_locacao)

      if item do
         LocacaoApi.Midias.get_exemplar!(item.exemplar_codigo_interno)
         |> LocacaoApi.Midias.update_exemplar(%{disponivel: true})
      end

      locacao
    end)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking locacao changes.
  """
  def change_locacao(%Locacao{} = locacao, attrs \\ %{}) do
    Locacao.changeset(locacao, attrs)
  end

  alias LocacaoApi.Locacoes.ItemLocacao

  def list_itens_locacao do
    Repo.all(ItemLocacao)
  end

  def get_item_locacao!(locacao_id, exemplar_codigo) do
     Repo.get_by!(
      ItemLocacao,
      locacao_id: locacao_id,
      exemplar_codigo_interno: exemplar_codigo
      ) || raise Ecto.NoResultsError, queryable: ItemLocacao
  end

  def create_item_locacao(attrs \\ %{}) do
    %ItemLocacao{}
    |> ItemLocacao.changeset(attrs)
    |> Repo.insert()
  end

  def update_item_locacao(%ItemLocacao{} = item_locacao, attrs) do
    item_locacao
    |> ItemLocacao.changeset(attrs)
    |> Repo.update()
  end

  def delete_item_locacao(%ItemLocacao{} = item_locacao) do
    Repo.delete(item_locacao)
  end
end
