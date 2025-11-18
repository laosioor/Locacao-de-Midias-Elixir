defmodule LocacaoApiWeb.TipoController do
  use LocacaoApiWeb, :controller

  alias LocacaoApi.Midias
  alias LocacaoApi.Midias.Tipo

  action_fallback LocacaoApiWeb.FallbackController

  def index(conn, _params) do
    tipo = Midias.list_tipo()
    render(conn, :index, tipo: tipo)
  end

  def create(conn, %{"tipo" => tipo_params}) do
    with {:ok, %Tipo{} = tipo} <- Midias.create_tipo(tipo_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/tipo/#{tipo}")
      |> render(:show, tipo: tipo)
    end
  end

  def show(conn, %{"id" => id}) do
    tipo = Midias.get_tipo!(id)
    render(conn, :show, tipo: tipo)
  end

  def update(conn, %{"id" => id, "tipo" => tipo_params}) do
    tipo = Midias.get_tipo!(id)

    with {:ok, %Tipo{} = tipo} <- Midias.update_tipo(tipo, tipo_params) do
      render(conn, :show, tipo: tipo)
    end
  end

  def delete(conn, %{"id" => id}) do
    tipo = Midias.get_tipo!(id)

    with {:ok, %Tipo{}} <- Midias.delete_tipo(tipo) do
      send_resp(conn, :no_content, "")
    end
  end
end
