defmodule LocacaoApiWeb.EstadoController do
  use LocacaoApiWeb, :controller

  alias LocacaoApi.Cadastros
  alias LocacaoApi.Cadastros.Estado

  action_fallback LocacaoApiWeb.FallbackController

  def index(conn, _params) do
    estado = Cadastros.list_estado()
    render(conn, :index, estado: estado)
  end

  def create(conn, estado_params) do
    atributos_limpos = normalizar_params(estado_params)
    with {:ok, %Estado{} = estado} <- Cadastros.create_estado(atributos_limpos) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/estado/#{estado}")
      |> render(:show, estado: estado)
    end
  end

  def show(conn, %{"id" => id}) do
    estado = Cadastros.get_estado!(id)
    render(conn, :show, estado: estado)
  end

  def update(conn, %{"id" => id} = estado_params) do
    estado = Cadastros.get_estado!(id)
    atributos_limpos = normalizar_params(estado_params)
    with {:ok, %Estado{} = estado} <- Cadastros.update_estado(estado, atributos_limpos) do
      render(conn, :show, estado: estado)
    end
  end

  def delete(conn, %{"id" => id}) do
    estado = Cadastros.get_estado!(id)

    with {:ok, %Estado{}} <- Cadastros.delete_estado(estado) do
      send_resp(conn, :no_content, "")
    end
  end

    defp normalizar_params(params) do
    %{
      "nome" => params["Nome"],
      "sigla" => params["Sigla"]
    }
    |> Enum.reject(fn {_, v} -> is_nil(v) end)
    |> Map.new()
  end
end
