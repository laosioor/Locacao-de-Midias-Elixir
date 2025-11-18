defmodule LocacaoApi.Locacoes do
  @moduledoc """
  The Locacoes context.
  """

  import Ecto.Query, warn: false
  alias LocacaoApi.Repo

  alias LocacaoApi.Locacoes.Locacao

  @doc """
  Returns the list of locacao.

  ## Examples

      iex> list_locacao()
      [%Locacao{}, ...]

  """
  def list_locacao do
    Repo.all(Locacao)
  end

  @doc """
  Gets a single locacao.

  Raises `Ecto.NoResultsError` if the Locacao does not exist.

  ## Examples

      iex> get_locacao!(123)
      %Locacao{}

      iex> get_locacao!(456)
      ** (Ecto.NoResultsError)

  """
  def get_locacao!(id) do
    Repo.get!(Locacao, id)
  end

  @doc """
  Creates a locacao.

  ## Examples

      iex> create_locacao(%{field: value})
      {:ok, %Locacao{}}

      iex> create_locacao(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_locacao(attrs) do
    %Locacao{}
    |> Locacao.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a locacao.

  ## Examples

      iex> update_locacao(locacao, %{field: new_value})
      {:ok, %Locacao{}}

      iex> update_locacao(locacao, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_locacao(%Locacao{} = locacao, attrs) do
    locacao
    |> Locacao.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a locacao.

  ## Examples

      iex> delete_locacao(locacao)
      {:ok, %Locacao{}}

      iex> delete_locacao(locacao)
      {:error, %Ecto.Changeset{}}

  """
  def delete_locacao(%Locacao{} = locacao) do
    Repo.delete(locacao)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking locacao changes.

  ## Examples

      iex> change_locacao(locacao)
      %Ecto.Changeset{data: %Locacao{}}

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

  # ... (update e delete se precisar)
end
