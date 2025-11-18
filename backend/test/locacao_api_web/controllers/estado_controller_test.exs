defmodule LocacaoApiWeb.EstadoControllerTest do
  use LocacaoApiWeb.ConnCase

  import LocacaoApi.CadastrosFixtures
  alias LocacaoApi.Cadastros.Estado

  @create_attrs %{
    nome: "some nome",
    sigla: "some sigla"
  }
  @update_attrs %{
    nome: "some updated nome",
    sigla: "some updated sigla"
  }
  @invalid_attrs %{nome: nil, sigla: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all estado", %{conn: conn} do
      conn = get(conn, ~p"/api/estado")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create estado" do
    test "renders estado when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/estado", estado: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/estado/#{id}")

      assert %{
               "id" => ^id,
               "nome" => "some nome",
               "sigla" => "some sigla"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/estado", estado: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update estado" do
    setup [:create_estado]

    test "renders estado when data is valid", %{conn: conn, estado: %Estado{id: id} = estado} do
      conn = put(conn, ~p"/api/estado/#{estado}", estado: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/estado/#{id}")

      assert %{
               "id" => ^id,
               "nome" => "some updated nome",
               "sigla" => "some updated sigla"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, estado: estado} do
      conn = put(conn, ~p"/api/estado/#{estado}", estado: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete estado" do
    setup [:create_estado]

    test "deletes chosen estado", %{conn: conn, estado: estado} do
      conn = delete(conn, ~p"/api/estado/#{estado}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/estado/#{estado}")
      end
    end
  end

  defp create_estado(_) do
    estado = estado_fixture()

    %{estado: estado}
  end
end
