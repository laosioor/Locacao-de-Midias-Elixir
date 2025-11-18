defmodule LocacaoApiWeb.AtorController do
  use LocacaoApiWeb, :controller

  alias LocacaoApi.Midias
  alias LocacaoApi.Midias.Ator

  action_fallback LocacaoApiWeb.FallbackController

  def index(conn, _params) do
    ator = Midias.list_ator()
    render(conn, :index, ator: ator)
  end

  def create(conn, %{"ator" => ator_params}) do
    with {:ok, %Ator{} = ator} <- Midias.create_ator(ator_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/ator/#{ator}")
      |> render(:show, ator: ator)
    end
  end

  def show(conn, %{"id" => id}) do
    ator = Midias.get_ator!(id)
    render(conn, :show, ator: ator)
  end

  def update(conn, %{"id" => id, "ator" => ator_params}) do
    ator = Midias.get_ator!(id)

    with {:ok, %Ator{} = ator} <- Midias.update_ator(ator, ator_params) do
      render(conn, :show, ator: ator)
    end
  end

  def delete(conn, %{"id" => id}) do
    ator = Midias.get_ator!(id)

    with {:ok, %Ator{}} <- Midias.delete_ator(ator) do
      send_resp(conn, :no_content, "")
    end
  end
end
