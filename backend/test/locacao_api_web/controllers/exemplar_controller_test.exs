defmodule LocacaoApiWeb.ExemplarControllerTest do
  use LocacaoApiWeb.ConnCase

  import LocacaoApi.MidiasFixtures
  alias LocacaoApi.Midias.Exemplar

  @create_attrs %{
    disponivel: true
  }
  @update_attrs %{
    disponivel: false
  }
  @invalid_attrs %{disponivel: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all exemplar", %{conn: conn} do
      conn = get(conn, ~p"/api/exemplar")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create exemplar" do
    test "renders exemplar when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/exemplar", exemplar: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/exemplar/#{id}")

      assert %{
               "id" => ^id,
               "disponivel" => true
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/exemplar", exemplar: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update exemplar" do
    setup [:create_exemplar]

    test "renders exemplar when data is valid", %{conn: conn, exemplar: %Exemplar{id: id} = exemplar} do
      conn = put(conn, ~p"/api/exemplar/#{exemplar}", exemplar: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/exemplar/#{id}")

      assert %{
               "id" => ^id,
               "disponivel" => false
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, exemplar: exemplar} do
      conn = put(conn, ~p"/api/exemplar/#{exemplar}", exemplar: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete exemplar" do
    setup [:create_exemplar]

    test "deletes chosen exemplar", %{conn: conn, exemplar: exemplar} do
      conn = delete(conn, ~p"/api/exemplar/#{exemplar}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/exemplar/#{exemplar}")
      end
    end
  end

  defp create_exemplar(_) do
    exemplar = exemplar_fixture()

    %{exemplar: exemplar}
  end
end
