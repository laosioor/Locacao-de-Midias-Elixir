defmodule LocacaoApiWeb.MidiaController do
  use LocacaoApiWeb, :controller

  alias LocacaoApi.Midias
  alias LocacaoApi.Midias.Midia

  action_fallback LocacaoApiWeb.FallbackController

  def index(conn, _params) do
    midia = Midias.list_midia()
    render(conn, :index, midia: midia)
  end

  def create(conn, %{"midia" => midia_params}) do
    with {:ok, %Midia{} = midia} <- Midias.create_midia(midia_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/midia/#{midia}")
      |> render(:show, midia: midia)
    end
  end

  def show(conn, %{"id" => id}) do
    midia = Midias.get_midia!(id)
    render(conn, :show, midia: midia)
  end

  def update(conn, %{"id" => id, "midia" => midia_params}) do
    midia = Midias.get_midia!(id)

    with {:ok, %Midia{} = midia} <- Midias.update_midia(midia, midia_params) do
      render(conn, :show, midia: midia)
    end
  end

  def delete(conn, %{"id" => id}) do
    midia = Midias.get_midia!(id)

    with {:ok, %Midia{}} <- Midias.delete_midia(midia) do
      send_resp(conn, :no_content, "")
    end
  end
end
