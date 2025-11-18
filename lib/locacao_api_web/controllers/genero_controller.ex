defmodule LocacaoApiWeb.GeneroController do
  use LocacaoApiWeb, :controller

  alias LocacaoApi.Midias
  alias LocacaoApi.Midias.Genero

  action_fallback LocacaoApiWeb.FallbackController

  def index(conn, _params) do
    genero = Midias.list_genero()
    render(conn, :index, genero: genero)
  end

  def create(conn, %{"genero" => genero_params}) do
    with {:ok, %Genero{} = genero} <- Midias.create_genero(genero_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/genero/#{genero}")
      |> render(:show, genero: genero)
    end
  end

  def show(conn, %{"id" => id}) do
    genero = Midias.get_genero!(id)
    render(conn, :show, genero: genero)
  end

  def update(conn, %{"id" => id, "genero" => genero_params}) do
    genero = Midias.get_genero!(id)

    with {:ok, %Genero{} = genero} <- Midias.update_genero(genero, genero_params) do
      render(conn, :show, genero: genero)
    end
  end

  def delete(conn, %{"id" => id}) do
    genero = Midias.get_genero!(id)

    with {:ok, %Genero{}} <- Midias.delete_genero(genero) do
      send_resp(conn, :no_content, "")
    end
  end
end
