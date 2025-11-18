defmodule LocacaoApiWeb.TipoControllerTest do
  use LocacaoApiWeb.ConnCase

  import LocacaoApi.MidiasFixtures
  alias LocacaoApi.Midias.Tipo

  @create_attrs %{
    descricao: "some descricao"
  }
  @update_attrs %{
    descricao: "some updated descricao"
  }
  @invalid_attrs %{descricao: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all tipo", %{conn: conn} do
      conn = get(conn, ~p"/api/tipo")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create tipo" do
    test "renders tipo when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/tipo", tipo: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/tipo/#{id}")

      assert %{
               "id" => ^id,
               "descricao" => "some descricao"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/tipo", tipo: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update tipo" do
    setup [:create_tipo]

    test "renders tipo when data is valid", %{conn: conn, tipo: %Tipo{id: id} = tipo} do
      conn = put(conn, ~p"/api/tipo/#{tipo}", tipo: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/tipo/#{id}")

      assert %{
               "id" => ^id,
               "descricao" => "some updated descricao"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, tipo: tipo} do
      conn = put(conn, ~p"/api/tipo/#{tipo}", tipo: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete tipo" do
    setup [:create_tipo]

    test "deletes chosen tipo", %{conn: conn, tipo: tipo} do
      conn = delete(conn, ~p"/api/tipo/#{tipo}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/tipo/#{tipo}")
      end
    end
  end

  defp create_tipo(_) do
    tipo = tipo_fixture()

    %{tipo: tipo}
  end
end
