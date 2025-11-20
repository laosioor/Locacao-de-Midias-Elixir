defmodule LocacaoApiWeb.ItemLocacaoJSON do
  alias LocacaoApi.Locacoes.ItemLocacao

  @doc """
  Renderiza uma lista de itens.
  """
  def index(%{itens_locacao: itens_locacao}) do
    %{data: for(item <- itens_locacao, do: data(item))}
  end

  @doc """
  Renderiza um único item.
  """
  def show(%{item_locacao: item_locacao}) do
    %{data: data(item_locacao)}
  end

  def data(%ItemLocacao{} = item) do
    %{
      Valor: item.valor,
      Locacão_id: item.locacao_id,
      Exemplar_Código_Interno: item.exemplar_codigo_interno
    }
  end
end
