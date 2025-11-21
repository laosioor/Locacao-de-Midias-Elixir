defmodule LocacaoApiWeb.AtorController do
  use LocacaoApiWeb, :controller

  alias LocacaoApi.Midias
  alias LocacaoApi.Midias.Ator

  action_fallback LocacaoApiWeb.FallbackController

  def index(conn, _params) do
    ator = Midias.list_ator()
    render(conn, :index, ator: ator)
  end

  def create(conn, ator_params) do
    atributos_limpos = normalizar_params(ator_params)
    with {:ok, %Ator{} = ator} <- Midias.create_ator(atributos_limpos) do
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

  def update(conn, %{"id" => id} = ator_params) do
    ator = Midias.get_ator!(id)
    atributos_limpos = normalizar_params(ator_params)
    with {:ok, %Ator{} = ator} <- Midias.update_ator(ator, atributos_limpos) do
      render(conn, :show, ator: ator)
    end
  end

  def delete(conn, %{"id" => id}) do
    ator = Midias.get_ator!(id)

    with {:ok, %Ator{}} <- Midias.delete_ator(ator) do
      send_resp(conn, :no_content, "")
    end
  end

  defp normalizar_params(params) do
    %{
      "nome" => params["Nome"],
      "sobrenome" => params["Sobrenome"],
      "data_estreia" => params["Data_de_Estreia"]
    }
    |> Enum.reject(fn {_, v} -> is_nil(v) end)
    |> Map.new()
  end
end
