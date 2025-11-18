defmodule LocacaoApiWeb.ClassificacaoInternaController do
  use LocacaoApiWeb, :controller

  alias LocacaoApi.Midias
  alias LocacaoApi.Midias.ClassificacaoInterna

  action_fallback LocacaoApiWeb.FallbackController

  def index(conn, _params) do
    classificacao_interna = Midias.list_classificacao_interna()
    render(conn, :index, classificacao_interna: classificacao_interna)
  end

  def create(conn, %{"classificacao_interna" => classificacao_interna_params}) do
    with {:ok, %ClassificacaoInterna{} = classificacao_interna} <- Midias.create_classificacao_interna(classificacao_interna_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/classificacao_interna/#{classificacao_interna}")
      |> render(:show, classificacao_interna: classificacao_interna)
    end
  end

  def show(conn, %{"id" => id}) do
    classificacao_interna = Midias.get_classificacao_interna!(id)
    render(conn, :show, classificacao_interna: classificacao_interna)
  end

  def update(conn, %{"id" => id, "classificacao_interna" => classificacao_interna_params}) do
    classificacao_interna = Midias.get_classificacao_interna!(id)

    with {:ok, %ClassificacaoInterna{} = classificacao_interna} <- Midias.update_classificacao_interna(classificacao_interna, classificacao_interna_params) do
      render(conn, :show, classificacao_interna: classificacao_interna)
    end
  end

  def delete(conn, %{"id" => id}) do
    classificacao_interna = Midias.get_classificacao_interna!(id)

    with {:ok, %ClassificacaoInterna{}} <- Midias.delete_classificacao_interna(classificacao_interna) do
      send_resp(conn, :no_content, "")
    end
  end
end
