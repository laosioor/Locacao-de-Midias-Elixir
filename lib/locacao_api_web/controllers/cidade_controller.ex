defmodule LocacaoApiWeb.CidadeController do
  use LocacaoApiWeb, :controller

  alias LocacaoApi.Cadastros
  alias LocacaoApi.Cadastros.Cidade

  action_fallback LocacaoApiWeb.FallbackController

  def index(conn, _params) do
    cidade = Cadastros.list_cidade()
    render(conn, :index, cidade: cidade)
  end

  def create(conn, %{"cidade" => cidade_params}) do
    with {:ok, %Cidade{} = cidade} <- Cadastros.create_cidade(cidade_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/cidade/#{cidade}")
      |> render(:show, cidade: cidade)
    end
  end

  def show(conn, %{"id" => id}) do
    cidade = Cadastros.get_cidade!(id)
    render(conn, :show, cidade: cidade)
  end

  def update(conn, %{"id" => id, "cidade" => cidade_params}) do
    cidade = Cadastros.get_cidade!(id)

    with {:ok, %Cidade{} = cidade} <- Cadastros.update_cidade(cidade, cidade_params) do
      render(conn, :show, cidade: cidade)
    end
  end

  def delete(conn, %{"id" => id}) do
    cidade = Cadastros.get_cidade!(id)

    with {:ok, %Cidade{}} <- Cadastros.delete_cidade(cidade) do
      send_resp(conn, :no_content, "")
    end
  end
end
