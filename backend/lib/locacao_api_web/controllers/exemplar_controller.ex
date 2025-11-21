defmodule LocacaoApiWeb.ExemplarController do
  use LocacaoApiWeb, :controller

  alias LocacaoApi.Midias
  alias LocacaoApi.Midias.Exemplar

  action_fallback(LocacaoApiWeb.FallbackController)

  def index(conn, _params) do
    exemplar = Midias.list_exemplar()
    render(conn, :index, exemplar: exemplar)
  end

  def create(conn, exemplar_params) do
    atributos_limpos = normalizar_params(exemplar_params)
    with {:ok, %Exemplar{} = exemplar} <- Midias.create_exemplar(atributos_limpos) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/exemplar/#{exemplar}")
      |> render(:show, exemplar: exemplar)
    end
  end

  def show(conn, %{"id" => id}) do
    exemplar = Midias.get_exemplar!(id)
    render(conn, :show, exemplar: exemplar)
  end

  def update(conn, %{"id" => id} = exemplar_params) do
    exemplar = Midias.get_exemplar!(id)
    atributos_limpos = normalizar_params(exemplar_params)
    with {:ok, %Exemplar{} = exemplar} <- Midias.update_exemplar(exemplar, atributos_limpos) do
      render(conn, :show, exemplar: exemplar)
    end
  end

  def delete(conn, %{"id" => id}) do
    exemplar = Midias.get_exemplar!(id)

    with {:ok, %Exemplar{}} <- Midias.delete_exemplar(exemplar) do
      send_resp(conn, :no_content, "")
    end
  end

  defp normalizar_params(params) do
    %{
      "disponivel" => params["Disponível"],
      "midia_id" => params["Mídia_id"]
    }
    |> Enum.reject(fn {_, v} -> is_nil(v) end)
    |> Map.new()
  end
end
