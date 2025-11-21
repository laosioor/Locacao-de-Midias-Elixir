defmodule LocacaoApiWeb.TipoController do
  use LocacaoApiWeb, :controller

  alias LocacaoApi.Midias
  alias LocacaoApi.Midias.Tipo

  action_fallback(LocacaoApiWeb.FallbackController)

  def index(conn, _params) do
    tipo = Midias.list_tipo()
    render(conn, :index, tipo: tipo)
  end

  def create(conn, tipo_params) do
    atributos_limpos = normalizar_params(tipo_params)
    with {:ok, %Tipo{} = tipo} <- Midias.create_tipo(atributos_limpos) do
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

  def update(conn, %{"id" => id} = tipo_params) do
    tipo = Midias.get_tipo!(id)
    atributos_limpos = normalizar_params(tipo_params)
    with {:ok, %Tipo{} = tipo} <- Midias.update_tipo(tipo, atributos_limpos) do
      render(conn, :show, tipo: tipo)
    end
  end

  def delete(conn, %{"id" => id}) do
    tipo = Midias.get_tipo!(id)

    with {:ok, %Tipo{}} <- Midias.delete_tipo(tipo) do
      send_resp(conn, :no_content, "")
    end
  end

  defp normalizar_params(params) do
    %{
      "descricao" => params["Descrição"]
    }
    |> Enum.reject(fn {_, v} -> is_nil(v) end)
    |> Map.new()
  end
end
