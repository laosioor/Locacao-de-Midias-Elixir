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
      Data_de_Início: locacao.data_inicio,
      Data_de_Fim: locacao.data_fim,
      Cancelada: locacao.cancelada,
      Cliente_id: locacao.cliente_id
    }
  end
end
