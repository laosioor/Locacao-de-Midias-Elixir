defmodule LocacaoApiWeb.MidiaControllerTest do
  use LocacaoApiWeb.ConnCase

  import LocacaoApi.MidiasFixtures
  alias LocacaoApi.Midias.Midia

  @create_attrs %{
    titulo: "some titulo",
    ano_lancamento: 42,
    codigo_barras: "some codigo_barras",
    duracao_em_minutos: 42
  }
  @update_attrs %{
    titulo: "some updated titulo",
    ano_lancamento: 43,
    codigo_barras: "some updated codigo_barras",
    duracao_em_minutos: 43
  }
  @invalid_attrs %{titulo: nil, ano_lancamento: nil, codigo_barras: nil, duracao_em_minutos: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all midia", %{conn: conn} do
      conn = get(conn, ~p"/api/midia")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create midia" do
    test "renders midia when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/midia", midia: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/midia/#{id}")

      assert %{
               "id" => ^id,
               "ano_lancamento" => 42,
               "codigo_barras" => "some codigo_barras",
               "duracao_em_minutos" => 42,
               "titulo" => "some titulo"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/midia", midia: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update midia" do
    setup [:create_midia]

    test "renders midia when data is valid", %{conn: conn, midia: %Midia{id: id} = midia} do
      conn = put(conn, ~p"/api/midia/#{midia}", midia: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/midia/#{id}")

      assert %{
               "id" => ^id,
               "ano_lancamento" => 43,
               "codigo_barras" => "some updated codigo_barras",
               "duracao_em_minutos" => 43,
               "titulo" => "some updated titulo"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, midia: midia} do
      conn = put(conn, ~p"/api/midia/#{midia}", midia: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete midia" do
    setup [:create_midia]

    test "deletes chosen midia", %{conn: conn, midia: midia} do
      conn = delete(conn, ~p"/api/midia/#{midia}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/midia/#{midia}")
      end
    end
  end

  defp create_midia(_) do
    midia = midia_fixture()

    %{midia: midia}
  end
end
