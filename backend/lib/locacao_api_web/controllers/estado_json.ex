defmodule LocacaoApiWeb.EstadoJSON do
  alias LocacaoApi.Cadastros.Estado

  @doc """
  Renders a list of estado.
  """
  def index(%{estado: estado}) do
    %{data: for(estado <- estado, do: data(estado))}
  end

  @doc """
  Renders a single estado.
  """
  def show(%{estado: estado}) do
    %{data: data(estado)}
  end

  def data(%Estado{} = estado) do
    %{
      id: estado.id,
      Nome: estado.nome,
      Sigla: estado.sigla
    }
  end
end
