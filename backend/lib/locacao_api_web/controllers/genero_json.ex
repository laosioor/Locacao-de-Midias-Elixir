defmodule LocacaoApiWeb.GeneroJSON do
  alias LocacaoApi.Midias.Genero

  @doc """
  Renders a list of genero.
  """
  def index(%{genero: genero}) do
    %{data: for(genero <- genero, do: data(genero))}
  end

  @doc """
  Renders a single genero.
  """
  def show(%{genero: genero}) do
    %{data: data(genero)}
  end

  def data(%Genero{} = genero) do
    %{
      id: genero.id,
      Descrição: genero.descricao
    }
  end
end
