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
      valor: item.valor,
      locacao_id: item.locacao_id,
      exemplar_codigo_interno: item.exemplar_codigo_interno
    }
  end
end
