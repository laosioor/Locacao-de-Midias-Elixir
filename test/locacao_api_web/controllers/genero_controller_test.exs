defmodule LocacaoApiWeb.GeneroControllerTest do
  use LocacaoApiWeb.ConnCase

  import LocacaoApi.MidiasFixtures
  alias LocacaoApi.Midias.Genero

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
    test "lists all genero", %{conn: conn} do
      conn = get(conn, ~p"/api/genero")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create genero" do
    test "renders genero when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/genero", genero: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/genero/#{id}")

      assert %{
               "id" => ^id,
               "descricao" => "some descricao"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/genero", genero: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update genero" do
    setup [:create_genero]

    test "renders genero when data is valid", %{conn: conn, genero: %Genero{id: id} = genero} do
      conn = put(conn, ~p"/api/genero/#{genero}", genero: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/genero/#{id}")

      assert %{
               "id" => ^id,
               "descricao" => "some updated descricao"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, genero: genero} do
      conn = put(conn, ~p"/api/genero/#{genero}", genero: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete genero" do
    setup [:create_genero]

    test "deletes chosen genero", %{conn: conn, genero: genero} do
      conn = delete(conn, ~p"/api/genero/#{genero}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/genero/#{genero}")
      end
    end
  end

  defp create_genero(_) do
    genero = genero_fixture()

    %{genero: genero}
  end
end
