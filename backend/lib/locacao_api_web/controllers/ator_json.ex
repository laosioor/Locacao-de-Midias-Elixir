defmodule LocacaoApiWeb.AtorJSON do
  alias LocacaoApi.Midias.Ator

  @doc """
  Renders a list of ator.
  """
  def index(%{ator: ator}) do
    %{data: for(ator <- ator, do: data(ator))}
  end

  @doc """
  Renders a single ator.
  """
  def show(%{ator: ator}) do
    %{data: data(ator)}
  end

  def data(%Ator{} = ator) do
    %{
      id: ator.id,
      nome: ator.nome,
      sobrenome: ator.sobrenome,
      data_estreia: ator.data_estreia
    }
  end
end
