defmodule LocacaoApiWeb.ClassificacaoInternaController do
  use LocacaoApiWeb, :controller

  alias LocacaoApi.Midias
  alias LocacaoApi.Midias.ClassificacaoInterna

  action_fallback LocacaoApiWeb.FallbackController

  def index(conn, _params) do
    classificacao_interna = Midias.list_classificacao_interna()
    render(conn, :index, classificacao_interna: classificacao_interna)
  end

  def create(conn, classificacao_interna_params) do
    atributos_limpos = normalizar_params(classificacao_interna_params)
    with {:ok, %ClassificacaoInterna{} = classificacao_interna} <- Midias.create_classificacao_interna(atributos_limpos) do
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

  def update(conn, %{"id" => id} = classificacao_interna_params) do
    classificacao_interna = Midias.get_classificacao_interna!(id)
    atributos_limpos = normalizar_params(classificacao_interna_params)
    with {:ok, %ClassificacaoInterna{} = classificacao_interna} <- Midias.update_classificacao_interna(classificacao_interna, atributos_limpos) do
      render(conn, :show, classificacao_interna: classificacao_interna)
    end
  end

  def delete(conn, %{"id" => id}) do
    classificacao_interna = Midias.get_classificacao_interna!(id)

    with {:ok, %ClassificacaoInterna{}} <- Midias.delete_classificacao_interna(classificacao_interna) do
      send_resp(conn, :no_content, "")
    end
  end

  defp normalizar_params(params) do
    %{
      "descricao" => params["Descrição"],
      "valor_aluguel" => params["Valor_de_Aluguel"]
    }
    |> Enum.reject(fn {_, v} -> is_nil(v) end)
    |> Map.new()
  end
end
