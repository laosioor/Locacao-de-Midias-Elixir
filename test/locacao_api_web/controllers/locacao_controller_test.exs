defmodule LocacaoApiWeb.LocacaoControllerTest do
  use LocacaoApiWeb.ConnCase

  import LocacaoApi.LocacoesFixtures
  alias LocacaoApi.Locacoes.Locacao

  @create_attrs %{
    data_inicio: ~D[2025-11-16],
    data_fim: ~D[2025-11-16],
    cancelada: true
  }
  @update_attrs %{
    data_inicio: ~D[2025-11-17],
    data_fim: ~D[2025-11-17],
    cancelada: false
  }
  @invalid_attrs %{data_inicio: nil, data_fim: nil, cancelada: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all locacao", %{conn: conn} do
      conn = get(conn, ~p"/api/locacao")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create locacao" do
    test "renders locacao when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/locacao", locacao: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/locacao/#{id}")

      assert %{
               "id" => ^id,
               "cancelada" => true,
               "data_fim" => "2025-11-16",
               "data_inicio" => "2025-11-16"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/locacao", locacao: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update locacao" do
    setup [:create_locacao]

    test "renders locacao when data is valid", %{conn: conn, locacao: %Locacao{id: id} = locacao} do
      conn = put(conn, ~p"/api/locacao/#{locacao}", locacao: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/locacao/#{id}")

      assert %{
               "id" => ^id,
               "cancelada" => false,
               "data_fim" => "2025-11-17",
               "data_inicio" => "2025-11-17"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, locacao: locacao} do
      conn = put(conn, ~p"/api/locacao/#{locacao}", locacao: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete locacao" do
    setup [:create_locacao]

    test "deletes chosen locacao", %{conn: conn, locacao: locacao} do
      conn = delete(conn, ~p"/api/locacao/#{locacao}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/locacao/#{locacao}")
      end
    end
  end

  defp create_locacao(_) do
    locacao = locacao_fixture()

    %{locacao: locacao}
  end
end
