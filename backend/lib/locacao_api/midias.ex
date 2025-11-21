defmodule LocacaoApi.Midias do
  @moduledoc """
  The Midias context.
  """

  import Ecto.Query, warn: false
  alias LocacaoApi.Repo

  alias LocacaoApi.Midias.Ator

  @doc """
  Returns the list of ator.

  ## Examples

      iex> list_ator()
      [%Ator{}, ...]

  """
  def list_ator do
    Repo.all(Ator)
  end

  @doc """
  Gets a single ator.

  Raises `Ecto.NoResultsError` if the Ator does not exist.

  ## Examples

      iex> get_ator!(123)
      %Ator{}

      iex> get_ator!(456)
      ** (Ecto.NoResultsError)

  """
  def get_ator!(id), do: Repo.get!(Ator, id)

  @doc """
  Creates a ator.

  ## Examples

      iex> create_ator(%{field: value})
      {:ok, %Ator{}}

      iex> create_ator(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_ator(attrs) do
    %Ator{}
    |> Ator.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a ator.

  ## Examples

      iex> update_ator(ator, %{field: new_value})
      {:ok, %Ator{}}

      iex> update_ator(ator, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_ator(%Ator{} = ator, attrs) do
    ator
    |> Ator.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ator.

  ## Examples

      iex> delete_ator(ator)
      {:ok, %Ator{}}

      iex> delete_ator(ator)
      {:error, %Ecto.Changeset{}}

  """
  def delete_ator(%Ator{} = ator) do
    Repo.delete(ator)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking ator changes.

  ## Examples

      iex> change_ator(ator)
      %Ecto.Changeset{data: %Ator{}}

  """
  def change_ator(%Ator{} = ator, attrs \\ %{}) do
    Ator.changeset(ator, attrs)
  end

  alias LocacaoApi.Midias.Genero

  @doc """
  Returns the list of genero.

  ## Examples

      iex> list_genero()
      [%Genero{}, ...]

  """
  def list_genero do
    Repo.all(Genero)
  end

  @doc """
  Gets a single genero.

  Raises `Ecto.NoResultsError` if the Genero does not exist.

  ## Examples

      iex> get_genero!(123)
      %Genero{}

      iex> get_genero!(456)
      ** (Ecto.NoResultsError)

  """
  def get_genero!(id), do: Repo.get!(Genero, id)

  @doc """
  Creates a genero.

  ## Examples

      iex> create_genero(%{field: value})
      {:ok, %Genero{}}

      iex> create_genero(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_genero(attrs) do
    %Genero{}
    |> Genero.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a genero.

  ## Examples

      iex> update_genero(genero, %{field: new_value})
      {:ok, %Genero{}}

      iex> update_genero(genero, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_genero(%Genero{} = genero, attrs) do
    genero
    |> Genero.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a genero.

  ## Examples

      iex> delete_genero(genero)
      {:ok, %Genero{}}

      iex> delete_genero(genero)
      {:error, %Ecto.Changeset{}}

  """
  def delete_genero(%Genero{} = genero) do
    Repo.delete(genero)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking genero changes.

  ## Examples

      iex> change_genero(genero)
      %Ecto.Changeset{data: %Genero{}}

  """
  def change_genero(%Genero{} = genero, attrs \\ %{}) do
    Genero.changeset(genero, attrs)
  end

  alias LocacaoApi.Midias.ClassificacaoEtaria

  @doc """
  Returns the list of classificacao_etaria.

  ## Examples

      iex> list_classificacao_etaria()
      [%ClassificacaoEtaria{}, ...]

  """
  def list_classificacao_etaria do
    Repo.all(ClassificacaoEtaria)
  end

  @doc """
  Gets a single classificacao_etaria.

  Raises `Ecto.NoResultsError` if the Classificacao etaria does not exist.

  ## Examples

      iex> get_classificacao_etaria!(123)
      %ClassificacaoEtaria{}

      iex> get_classificacao_etaria!(456)
      ** (Ecto.NoResultsError)

  """
  def get_classificacao_etaria!(id), do: Repo.get!(ClassificacaoEtaria, id)

  @doc """
  Creates a classificacao_etaria.

  ## Examples

      iex> create_classificacao_etaria(%{field: value})
      {:ok, %ClassificacaoEtaria{}}

      iex> create_classificacao_etaria(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_classificacao_etaria(attrs) do
    %ClassificacaoEtaria{}
    |> ClassificacaoEtaria.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a classificacao_etaria.

  ## Examples

      iex> update_classificacao_etaria(classificacao_etaria, %{field: new_value})
      {:ok, %ClassificacaoEtaria{}}

      iex> update_classificacao_etaria(classificacao_etaria, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_classificacao_etaria(%ClassificacaoEtaria{} = classificacao_etaria, attrs) do
    classificacao_etaria
    |> ClassificacaoEtaria.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a classificacao_etaria.

  ## Examples

      iex> delete_classificacao_etaria(classificacao_etaria)
      {:ok, %ClassificacaoEtaria{}}

      iex> delete_classificacao_etaria(classificacao_etaria)
      {:error, %Ecto.Changeset{}}

  """
  def delete_classificacao_etaria(%ClassificacaoEtaria{} = classificacao_etaria) do
    Repo.delete(classificacao_etaria)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking classificacao_etaria changes.

  ## Examples

      iex> change_classificacao_etaria(classificacao_etaria)
      %Ecto.Changeset{data: %ClassificacaoEtaria{}}

  """
  def change_classificacao_etaria(%ClassificacaoEtaria{} = classificacao_etaria, attrs \\ %{}) do
    ClassificacaoEtaria.changeset(classificacao_etaria, attrs)
  end

  alias LocacaoApi.Midias.Tipo

  @doc """
  Returns the list of tipo.

  ## Examples

      iex> list_tipo()
      [%Tipo{}, ...]

  """
  def list_tipo do
    Repo.all(Tipo)
  end

  @doc """
  Gets a single tipo.

  Raises `Ecto.NoResultsError` if the Tipo does not exist.

  ## Examples

      iex> get_tipo!(123)
      %Tipo{}

      iex> get_tipo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tipo!(id), do: Repo.get!(Tipo, id)

  @doc """
  Creates a tipo.

  ## Examples

      iex> create_tipo(%{field: value})
      {:ok, %Tipo{}}

      iex> create_tipo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tipo(attrs) do
    %Tipo{}
    |> Tipo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tipo.

  ## Examples

      iex> update_tipo(tipo, %{field: new_value})
      {:ok, %Tipo{}}

      iex> update_tipo(tipo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tipo(%Tipo{} = tipo, attrs) do
    tipo
    |> Tipo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tipo.

  ## Examples

      iex> delete_tipo(tipo)
      {:ok, %Tipo{}}

      iex> delete_tipo(tipo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tipo(%Tipo{} = tipo) do
    Repo.delete(tipo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tipo changes.

  ## Examples

      iex> change_tipo(tipo)
      %Ecto.Changeset{data: %Tipo{}}

  """
  def change_tipo(%Tipo{} = tipo, attrs \\ %{}) do
    Tipo.changeset(tipo, attrs)
  end

  alias LocacaoApi.Midias.ClassificacaoInterna

  @doc """
  Returns the list of classificacao_interna.

  ## Examples

      iex> list_classificacao_interna()
      [%ClassificacaoInterna{}, ...]

  """
  def list_classificacao_interna do
    Repo.all(ClassificacaoInterna)
  end

  @doc """
  Gets a single classificacao_interna.

  Raises `Ecto.NoResultsError` if the Classificacao interna does not exist.

  ## Examples

      iex> get_classificacao_interna!(123)
      %ClassificacaoInterna{}

      iex> get_classificacao_interna!(456)
      ** (Ecto.NoResultsError)

  """
  def get_classificacao_interna!(id), do: Repo.get!(ClassificacaoInterna, id)

  @doc """
  Creates a classificacao_interna.

  ## Examples

      iex> create_classificacao_interna(%{field: value})
      {:ok, %ClassificacaoInterna{}}

      iex> create_classificacao_interna(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_classificacao_interna(attrs) do
    %ClassificacaoInterna{}
    |> ClassificacaoInterna.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a classificacao_interna.

  ## Examples

      iex> update_classificacao_interna(classificacao_interna, %{field: new_value})
      {:ok, %ClassificacaoInterna{}}

      iex> update_classificacao_interna(classificacao_interna, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_classificacao_interna(%ClassificacaoInterna{} = classificacao_interna, attrs) do
    classificacao_interna
    |> ClassificacaoInterna.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a classificacao_interna.

  ## Examples

      iex> delete_classificacao_interna(classificacao_interna)
      {:ok, %ClassificacaoInterna{}}

      iex> delete_classificacao_interna(classificacao_interna)
      {:error, %Ecto.Changeset{}}

  """
  def delete_classificacao_interna(%ClassificacaoInterna{} = classificacao_interna) do
    Repo.delete(classificacao_interna)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking classificacao_interna changes.

  ## Examples

      iex> change_classificacao_interna(classificacao_interna)
      %Ecto.Changeset{data: %ClassificacaoInterna{}}

  """
  def change_classificacao_interna(%ClassificacaoInterna{} = classificacao_interna, attrs \\ %{}) do
    ClassificacaoInterna.changeset(classificacao_interna, attrs)
  end

  alias LocacaoApi.Midias.Midia

  @doc """
  Returns the list of midia.

  ## Examples

      iex> list_midia()
      [%Midia{}, ...]

  """
  def list_midia do
    Repo.all(Midia)
  end

  @doc """
  Gets a single midia.

  Raises `Ecto.NoResultsError` if the Midia does not exist.

  ## Examples

      iex> get_midia!(123)
      %Midia{}

      iex> get_midia!(456)
      ** (Ecto.NoResultsError)

  """
  def get_midia!(id) do
    Repo.get!(Midia, id)
  end

  @doc """
  Creates a midia.

  ## Examples

      iex> create_midia(%{field: value})
      {:ok, %Midia{}}

      iex> create_midia(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_midia(attrs) do
    %Midia{}
    |> Midia.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a midia.

  ## Examples

      iex> update_midia(midia, %{field: new_value})
      {:ok, %Midia{}}

      iex> update_midia(midia, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_midia(%Midia{} = midia, attrs) do
    midia
    |> Midia.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a midia.

  ## Examples

      iex> delete_midia(midia)
      {:ok, %Midia{}}

      iex> delete_midia(midia)
      {:error, %Ecto.Changeset{}}

  """
  def delete_midia(%Midia{} = midia) do
    Repo.delete(midia)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking midia changes.

  ## Examples

      iex> change_midia(midia)
      %Ecto.Changeset{data: %Midia{}}

  """
  def change_midia(%Midia{} = midia, attrs \\ %{}) do
    Midia.changeset(midia, attrs)
  end

  alias LocacaoApi.Midias.Exemplar

  @doc """
  Returns the list of exemplar.

  ## Examples

      iex> list_exemplar()
      [%Exemplar{}, ...]

  """
  def list_exemplar do
    Exemplar
    |> Repo.all()
    |> Repo.preload(midia: :classificacao_interna)
  end

  @doc """
  Gets a single exemplar.

  Raises `Ecto.NoResultsError` if the Exemplar does not exist.

  ## Examples

      iex> get_exemplar!(123)
      %Exemplar{}

      iex> get_exemplar!(456)
      ** (Ecto.NoResultsError)

  """
  def get_exemplar!(id) do
    Repo.get!(Exemplar, id)
  end

  @doc """
  Creates a exemplar.

  ## Examples

      iex> create_exemplar(%{field: value})
      {:ok, %Exemplar{}}

      iex> create_exemplar(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_exemplar(attrs) do
    %Exemplar{}
    |> Exemplar.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a exemplar.

  ## Examples

      iex> update_exemplar(exemplar, %{field: new_value})
      {:ok, %Exemplar{}}

      iex> update_exemplar(exemplar, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_exemplar(%Exemplar{} = exemplar, attrs) do
    exemplar
    |> Exemplar.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a exemplar.

  ## Examples

      iex> delete_exemplar(exemplar)
      {:ok, %Exemplar{}}

      iex> delete_exemplar(exemplar)
      {:error, %Ecto.Changeset{}}

  """
  def delete_exemplar(%Exemplar{} = exemplar) do
    Repo.delete(exemplar)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking exemplar changes.

  ## Examples

      iex> change_exemplar(exemplar)
      %Ecto.Changeset{data: %Exemplar{}}

  """
  def change_exemplar(%Exemplar{} = exemplar, attrs \\ %{}) do
    Exemplar.changeset(exemplar, attrs)
  end
end
