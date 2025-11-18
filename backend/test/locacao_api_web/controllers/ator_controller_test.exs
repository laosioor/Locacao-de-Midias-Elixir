defmodule LocacaoApiWeb.AtorControllerTest do
  use LocacaoApiWeb.ConnCase

  import LocacaoApi.MidiasFixtures
  alias LocacaoApi.Midias.Ator

  @create_attrs %{
    nome: "some nome",
    sobrenome: "some sobrenome",
    data_estreia: ~D[2025-11-16]
  }
  @update_attrs %{
    nome: "some updated nome",
    sobrenome: "some updated sobrenome",
    data_estreia: ~D[2025-11-17]
  }
  @invalid_attrs %{nome: nil, sobrenome: nil, data_estreia: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all ator", %{conn: conn} do
      conn = get(conn, ~p"/api/ator")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create ator" do
    test "renders ator when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/ator", ator: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/ator/#{id}")

      assert %{
               "id" => ^id,
               "data_estreia" => "2025-11-16",
               "nome" => "some nome",
               "sobrenome" => "some sobrenome"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/ator", ator: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update ator" do
    setup [:create_ator]

    test "renders ator when data is valid", %{conn: conn, ator: %Ator{id: id} = ator} do
      conn = put(conn, ~p"/api/ator/#{ator}", ator: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/ator/#{id}")

      assert %{
               "id" => ^id,
               "data_estreia" => "2025-11-17",
               "nome" => "some updated nome",
               "sobrenome" => "some updated sobrenome"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, ator: ator} do
      conn = put(conn, ~p"/api/ator/#{ator}", ator: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete ator" do
    setup [:create_ator]

    test "deletes chosen ator", %{conn: conn, ator: ator} do
      conn = delete(conn, ~p"/api/ator/#{ator}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/ator/#{ator}")
      end
    end
  end

  defp create_ator(_) do
    ator = ator_fixture()

    %{ator: ator}
  end
end
