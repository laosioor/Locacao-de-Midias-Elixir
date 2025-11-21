defmodule LocacaoApiWeb.ClienteController do
  use LocacaoApiWeb, :controller

  alias LocacaoApi.Cadastros
  alias LocacaoApi.Cadastros.Cliente

  action_fallback LocacaoApiWeb.FallbackController

  def index(conn, _params) do
    cliente = Cadastros.list_cliente()
    render(conn, :index, cliente: cliente)
  end

  def create(conn, cliente_params) do
    atributos_limpos = normalizar_params(cliente_params)
    with {:ok, %Cliente{} = cliente} <- Cadastros.create_cliente(atributos_limpos) do
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

  def update(conn, %{"id" => id} = cliente_params) do
    cliente = Cadastros.get_cliente!(id)
    atributos_limpos = normalizar_params(cliente_params)
    with {:ok, %Cliente{} = cliente} <- Cadastros.update_cliente(cliente, atributos_limpos) do
      render(conn, :show, cliente: cliente)
    end
  end

  def delete(conn, %{"id" => id}) do
    cliente = Cadastros.get_cliente!(id)

    with {:ok, %Cliente{}} <- Cadastros.delete_cliente(cliente) do
      send_resp(conn, :no_content, "")
    end
  end

  defp normalizar_params(params) do
    %{
      "nome" => params["Nome"],
      "sobrenome" => params["Sobrenome"],
      "data_nascimento" => params["Data_de_Nascimento"],
      "cpf" => params["CPF"],
      "email" => params["Email"],
      "logradouro" => params["Logradouro"],
      "numero" => params["Número"],
      "bairro" => params["Bairro"],
      "cep" => params["CEP"],
      "cidade_id" => params["Cidade_id"]
    }
    |> Enum.reject(fn {_, v} -> is_nil(v) end)
    |> Map.new()
  end
end
