defmodule LocacaoApiWeb.ClienteControllerTest do
  use LocacaoApiWeb.ConnCase

  import LocacaoApi.CadastrosFixtures
  alias LocacaoApi.Cadastros.Cliente

  @create_attrs %{
    nome: "some nome",
    sobrenome: "some sobrenome",
    data_nascimento: ~D[2025-11-16],
    cpf: "some cpf",
    email: "some email",
    logradouro: "some logradouro",
    numero: "some numero",
    bairro: "some bairro",
    cep: "some cep"
  }
  @update_attrs %{
    nome: "some updated nome",
    sobrenome: "some updated sobrenome",
    data_nascimento: ~D[2025-11-17],
    cpf: "some updated cpf",
    email: "some updated email",
    logradouro: "some updated logradouro",
    numero: "some updated numero",
    bairro: "some updated bairro",
    cep: "some updated cep"
  }
  @invalid_attrs %{nome: nil, sobrenome: nil, data_nascimento: nil, cpf: nil, email: nil, logradouro: nil, numero: nil, bairro: nil, cep: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all cliente", %{conn: conn} do
      conn = get(conn, ~p"/api/cliente")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create cliente" do
    test "renders cliente when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/cliente", cliente: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/cliente/#{id}")

      assert %{
               "id" => ^id,
               "bairro" => "some bairro",
               "cep" => "some cep",
               "cpf" => "some cpf",
               "data_nascimento" => "2025-11-16",
               "email" => "some email",
               "logradouro" => "some logradouro",
               "nome" => "some nome",
               "numero" => "some numero",
               "sobrenome" => "some sobrenome"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/cliente", cliente: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update cliente" do
    setup [:create_cliente]

    test "renders cliente when data is valid", %{conn: conn, cliente: %Cliente{id: id} = cliente} do
      conn = put(conn, ~p"/api/cliente/#{cliente}", cliente: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/cliente/#{id}")

      assert %{
               "id" => ^id,
               "bairro" => "some updated bairro",
               "cep" => "some updated cep",
               "cpf" => "some updated cpf",
               "data_nascimento" => "2025-11-17",
               "email" => "some updated email",
               "logradouro" => "some updated logradouro",
               "nome" => "some updated nome",
               "numero" => "some updated numero",
               "sobrenome" => "some updated sobrenome"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, cliente: cliente} do
      conn = put(conn, ~p"/api/cliente/#{cliente}", cliente: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete cliente" do
    setup [:create_cliente]

    test "deletes chosen cliente", %{conn: conn, cliente: cliente} do
      conn = delete(conn, ~p"/api/cliente/#{cliente}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/cliente/#{cliente}")
      end
    end
  end

  defp create_cliente(_) do
    cliente = cliente_fixture()

    %{cliente: cliente}
  end
end
