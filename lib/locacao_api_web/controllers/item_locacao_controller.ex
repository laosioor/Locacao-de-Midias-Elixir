defmodule LocacaoApiWeb.ItemLocacaoController do
  use LocacaoApiWeb, :controller

  alias LocacaoApi.Locacoes
  alias LocacaoApi.Locacoes.ItemLocacao

  action_fallback LocacaoApiWeb.FallbackController

  def index(conn, _params) do
    itens_locacao = Locacoes.list_itens_locacao()
    render(conn, :index, itens_locacao: itens_locacao)
  end

  def create(conn, %{"item_locacao" => item_locacao_params}) do
    with {:ok, %ItemLocacao{} = item_locacao} <- Locacoes.create_item_locacao(item_locacao_params) do
      conn
      |> put_status(:created)
      # |> put_resp_header("location", ~p"/api/itens_locacao/#{item_locacao}")
      |> render(:show, item_locacao: item_locacao)
    end
  end

  def show(conn, %{"locacao_id" => loc_id, "exemplar_codigo_interno" => ex_cod}) do
    item_locacao = Locacoes.get_item_locacao!(loc_id, ex_cod)
    render(conn, :show, item_locacao: item_locacao)
  end
end
