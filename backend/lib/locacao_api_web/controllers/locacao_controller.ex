defmodule LocacaoApiWeb.LocacaoController do
  use LocacaoApiWeb, :controller

  alias LocacaoApi.Locacoes
  alias LocacaoApi.Locacoes.Locacao

  action_fallback(LocacaoApiWeb.FallbackController)

  def index(conn, _params) do
    locacao = Locacoes.list_locacao()
    render(conn, :index, locacao: locacao)
  end

  def create(conn, %{"locacao" => locacao_params}) do
    atributos_limpos = normalizar_params(locacao_params)

    with {:ok, %Locacao{} = locacao} <- Locacoes.create_locacao(atributos_limpos) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/locacao/#{locacao}")
      |> render(:show, locacao: locacao)
    end
  end

  def show(conn, %{"id" => id}) do
    locacao = Locacoes.get_locacao!(id)
    render(conn, :show, locacao: locacao)
  end

  def update(conn, %{"id" => id} = locacao_params) do
    locacao = Locacoes.get_locacao!(id)
    atributos_limpos = normalizar_params(locacao_params)

    with {:ok, %Locacao{} = locacao} <- Locacoes.update_locacao(locacao, atributos_limpos) do
      render(conn, :show, locacao: locacao)
    end
  end

  def delete(conn, %{"id" => id}) do
    locacao = Locacoes.get_locacao!(id)

    with {:ok, %Locacao{}} <- Locacoes.delete_locacao(locacao) do
      send_resp(conn, :no_content, "")
    end
  end

  defp normalizar_params(params) do
    %{
      "data_inicio" => params["Data_de_Início"],
      "data_fim" => params["Data_de_Fim"],
      "cancelada" => params["Cancelada"],
      "cliente_id" => params["Cliente_id"]
    }
    |> Enum.reject(fn {_, v} -> is_nil(v) end)
    |> Map.new()
  end
end
