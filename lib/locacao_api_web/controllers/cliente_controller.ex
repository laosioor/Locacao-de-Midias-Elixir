defmodule LocacaoApiWeb.ClienteController do
  use LocacaoApiWeb, :controller

  alias LocacaoApi.Cadastros
  alias LocacaoApi.Cadastros.Cliente

  action_fallback LocacaoApiWeb.FallbackController

  def index(conn, _params) do
    cliente = Cadastros.list_cliente()
    render(conn, :index, cliente: cliente)
  end

  def create(conn, %{"cliente" => cliente_params}) do
    with {:ok, %Cliente{} = cliente} <- Cadastros.create_cliente(cliente_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/cliente/#{cliente}")
      |> render(:show, cliente: cliente)
    end
  end

  @spec show(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def show(conn, %{"id" => id}) do
    cliente = Cadastros.get_cliente!(id)
    render(conn, :show, cliente: cliente)
  end

  def update(conn, %{"id" => id, "cliente" => cliente_params}) do
    cliente = Cadastros.get_cliente!(id)

    with {:ok, %Cliente{} = cliente} <- Cadastros.update_cliente(cliente, cliente_params) do
      render(conn, :show, cliente: cliente)
    end
  end

  def delete(conn, %{"id" => id}) do
    cliente = Cadastros.get_cliente!(id)

    with {:ok, %Cliente{}} <- Cadastros.delete_cliente(cliente) do
      send_resp(conn, :no_content, "")
    end
  end
end
