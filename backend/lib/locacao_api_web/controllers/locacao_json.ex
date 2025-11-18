defmodule LocacaoApiWeb.LocacaoJSON do

  alias LocacaoApi.Locacoes.Locacao

  @doc """
  Renders a list of locacao.
  """
  def index(%{locacao: locacao}) do
    %{data: for(locacao <- locacao, do: data(locacao))}
  end

  @doc """
  Renders a single locacao.
  """
  def show(%{locacao: locacao}) do
    %{data: data(locacao)}
  end

  def data(%Locacao{} = locacao) do
    %{
      id: locacao.id,
      data_inicio: locacao.data_inicio,
      data_fim: locacao.data_fim,
      cancelada: locacao.cancelada,
      cliente_id: locacao.cliente_id
    }
  end
end
