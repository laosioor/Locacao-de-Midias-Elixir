defmodule LocacaoApiWeb.ClassificacaoEtariaController do
  use LocacaoApiWeb, :controller

  alias LocacaoApi.Midias
  alias LocacaoApi.Midias.ClassificacaoEtaria

  action_fallback LocacaoApiWeb.FallbackController

  def index(conn, _params) do
    classificacao_etaria = Midias.list_classificacao_etaria()
    render(conn, :index, classificacao_etaria: classificacao_etaria)
  end

  def create(conn, classificacao_etaria_params) do
    atributos_limpos = normalizar_params(classificacao_etaria_params)
    with {:ok, %ClassificacaoEtaria{} = classificacao_etaria} <- Midias.create_classificacao_etaria(atributos_limpos) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/classificacao_etaria/#{classificacao_etaria}")
      |> render(:show, classificacao_etaria: classificacao_etaria)
    end
  end

  def show(conn, %{"id" => id}) do
    classificacao_etaria = Midias.get_classificacao_etaria!(id)
    render(conn, :show, classificacao_etaria: classificacao_etaria)
  end

  def update(conn, %{"id" => id} = classificacao_etaria_params) do
    classificacao_etaria = Midias.get_classificacao_etaria!(id)
    atributos_limpos = normalizar_params(classificacao_etaria_params)
    with {:ok, %ClassificacaoEtaria{} = classificacao_etaria} <- Midias.update_classificacao_etaria(classificacao_etaria, atributos_limpos) do
      render(conn, :show, classificacao_etaria: classificacao_etaria)
    end
  end

  def delete(conn, %{"id" => id}) do
    classificacao_etaria = Midias.get_classificacao_etaria!(id)

    with {:ok, %ClassificacaoEtaria{}} <- Midias.delete_classificacao_etaria(classificacao_etaria) do
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
