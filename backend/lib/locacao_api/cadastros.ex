defmodule LocacaoApi.Cadastros do
  @moduledoc """
  The Cadastros context.
  """

  import Ecto.Query, warn: false
  alias LocacaoApi.Repo

  alias LocacaoApi.Cadastros.Estado

  @doc """
  Returns the list of estado.

  ## Examples

      iex> list_estado()
      [%Estado{}, ...]

  """
  def list_estado do
    Repo.all(Estado)
  end

  @doc """
  Gets a single estado.

  Raises `Ecto.NoResultsError` if the Estado does not exist.

  ## Examples

      iex> get_estado!(123)
      %Estado{}

      iex> get_estado!(456)
      ** (Ecto.NoResultsError)

  """
  def get_estado!(id), do: Repo.get!(Estado, id)

  @doc """
  Creates a estado.

  ## Examples

      iex> create_estado(%{field: value})
      {:ok, %Estado{}}

      iex> create_estado(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_estado(attrs) do
    %Estado{}
    |> Estado.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a estado.

  ## Examples

      iex> update_estado(estado, %{field: new_value})
      {:ok, %Estado{}}

      iex> update_estado(estado, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_estado(%Estado{} = estado, attrs) do
    estado
    |> Estado.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a estado.

  ## Examples

      iex> delete_estado(estado)
      {:ok, %Estado{}}

      iex> delete_estado(estado)
      {:error, %Ecto.Changeset{}}

  """
  def delete_estado(%Estado{} = estado) do
    Repo.delete(estado)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking estado changes.

  ## Examples

      iex> change_estado(estado)
      %Ecto.Changeset{data: %Estado{}}

  """
  def change_estado(%Estado{} = estado, attrs \\ %{}) do
    Estado.changeset(estado, attrs)
  end

  alias LocacaoApi.Cadastros.Cidade

  @doc """
  Returns the list of cidade.

  ## Examples

      iex> list_cidade()
      [%Cidade{}, ...]

  """
  def list_cidade do
    Repo.all(Cidade)
  end

  @doc """
  Gets a single cidade.

  Raises `Ecto.NoResultsError` if the Cidade does not exist.

  ## Examples

      iex> get_cidade!(123)
      %Cidade{}

      iex> get_cidade!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cidade!(id) do
    Repo.get!(Cidade, id)
  end

  @doc """
  Creates a cidade.

  ## Examples

      iex> create_cidade(%{field: value})
      {:ok, %Cidade{}}

      iex> create_cidade(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cidade(attrs) do
    %Cidade{}
    |> Cidade.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cidade.

  ## Examples

      iex> update_cidade(cidade, %{field: new_value})
      {:ok, %Cidade{}}

      iex> update_cidade(cidade, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cidade(%Cidade{} = cidade, attrs) do
    cidade
    |> Cidade.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a cidade.

  ## Examples

      iex> delete_cidade(cidade)
      {:ok, %Cidade{}}

      iex> delete_cidade(cidade)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cidade(%Cidade{} = cidade) do
    Repo.delete(cidade)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cidade changes.

  ## Examples

      iex> change_cidade(cidade)
      %Ecto.Changeset{data: %Cidade{}}

  """
  def change_cidade(%Cidade{} = cidade, attrs \\ %{}) do
    Cidade.changeset(cidade, attrs)
  end

  alias LocacaoApi.Cadastros.Cliente

  @doc """
  Returns the list of cliente.

  ## Examples

      iex> list_cliente()
      [%Cliente{}, ...]

  """
  def list_cliente do
    Repo.all(Cliente)
  end

  @doc """
  Gets a single cliente.

  Raises `Ecto.NoResultsError` if the Cliente does not exist.

  ## Examples

      iex> get_cliente!(123)
      %Cliente{}

      iex> get_cliente!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cliente!(id)
  do
    Repo.get!(Cliente, id)
  end

  @doc """
  Creates a cliente.

  ## Examples

      iex> create_cliente(%{field: value})
      {:ok, %Cliente{}}

      iex> create_cliente(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cliente(attrs) do
    %Cliente{}
    |> Cliente.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cliente.

  ## Examples

      iex> update_cliente(cliente, %{field: new_value})
      {:ok, %Cliente{}}

      iex> update_cliente(cliente, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cliente(%Cliente{} = cliente, attrs) do
    cliente
    |> Cliente.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a cliente.

  ## Examples

      iex> delete_cliente(cliente)
      {:ok, %Cliente{}}

      iex> delete_cliente(cliente)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cliente(%Cliente{} = cliente) do
    Repo.delete(cliente)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cliente changes.

  ## Examples

      iex> change_cliente(cliente)
      %Ecto.Changeset{data: %Cliente{}}

  """
  def change_cliente(%Cliente{} = cliente, attrs \\ %{}) do
    Cliente.changeset(cliente, attrs)
  end
end
