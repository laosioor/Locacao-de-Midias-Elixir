defmodule LocacaoApiWeb.CidadeControllerTest do
  use LocacaoApiWeb.ConnCase

  import LocacaoApi.CadastrosFixtures
  alias LocacaoApi.Cadastros.Cidade

  @create_attrs %{
    nome: "some nome"
  }
  @update_attrs %{
    nome: "some updated nome"
  }
  @invalid_attrs %{nome: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all cidade", %{conn: conn} do
      conn = get(conn, ~p"/api/cidade")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create cidade" do
    test "renders cidade when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/cidade", cidade: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/cidade/#{id}")

      assert %{
               "id" => ^id,
               "nome" => "some nome"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/cidade", cidade: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update cidade" do
    setup [:create_cidade]

    test "renders cidade when data is valid", %{conn: conn, cidade: %Cidade{id: id} = cidade} do
      conn = put(conn, ~p"/api/cidade/#{cidade}", cidade: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/cidade/#{id}")

      assert %{
               "id" => ^id,
               "nome" => "some updated nome"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, cidade: cidade} do
      conn = put(conn, ~p"/api/cidade/#{cidade}", cidade: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete cidade" do
    setup [:create_cidade]

    test "deletes chosen cidade", %{conn: conn, cidade: cidade} do
      conn = delete(conn, ~p"/api/cidade/#{cidade}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/cidade/#{cidade}")
      end
    end
  end

  defp create_cidade(_) do
    cidade = cidade_fixture()

    %{cidade: cidade}
  end
end
