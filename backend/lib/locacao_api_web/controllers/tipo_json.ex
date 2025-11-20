defmodule LocacaoApiWeb.TipoJSON do
  alias LocacaoApi.Midias.Tipo

  @doc """
  Renders a list of tipo.
  """
  def index(%{tipo: tipo}) do
    %{data: for(tipo <- tipo, do: data(tipo))}
  end

  @doc """
  Renders a single tipo.
  """
  def show(%{tipo: tipo}) do
    %{data: data(tipo)}
  end

  def data(%Tipo{} = tipo) do
    %{
      id: tipo.id,
      Descrição: tipo.descricao
    }
  end
end
