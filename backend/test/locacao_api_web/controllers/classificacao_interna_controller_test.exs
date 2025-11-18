defmodule LocacaoApiWeb.ClassificacaoInternaControllerTest do
  use LocacaoApiWeb.ConnCase

  import LocacaoApi.MidiasFixtures
  alias LocacaoApi.Midias.ClassificacaoInterna

  @create_attrs %{
    descricao: "some descricao",
    valor_aluguel: "120.5"
  }
  @update_attrs %{
    descricao: "some updated descricao",
    valor_aluguel: "456.7"
  }
  @invalid_attrs %{descricao: nil, valor_aluguel: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all classificacao_interna", %{conn: conn} do
      conn = get(conn, ~p"/api/classificacao_interna")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create classificacao_interna" do
    test "renders classificacao_interna when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/classificacao_interna", classificacao_interna: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/classificacao_interna/#{id}")

      assert %{
               "id" => ^id,
               "descricao" => "some descricao",
               "valor_aluguel" => "120.5"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/classificacao_interna", classificacao_interna: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update classificacao_interna" do
    setup [:create_classificacao_interna]

    test "renders classificacao_interna when data is valid", %{conn: conn, classificacao_interna: %ClassificacaoInterna{id: id} = classificacao_interna} do
      conn = put(conn, ~p"/api/classificacao_interna/#{classificacao_interna}", classificacao_interna: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/classificacao_interna/#{id}")

      assert %{
               "id" => ^id,
               "descricao" => "some updated descricao",
               "valor_aluguel" => "456.7"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, classificacao_interna: classificacao_interna} do
      conn = put(conn, ~p"/api/classificacao_interna/#{classificacao_interna}", classificacao_interna: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete classificacao_interna" do
    setup [:create_classificacao_interna]

    test "deletes chosen classificacao_interna", %{conn: conn, classificacao_interna: classificacao_interna} do
      conn = delete(conn, ~p"/api/classificacao_interna/#{classificacao_interna}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/classificacao_interna/#{classificacao_interna}")
      end
    end
  end

  defp create_classificacao_interna(_) do
    classificacao_interna = classificacao_interna_fixture()

    %{classificacao_interna: classificacao_interna}
  end
end
