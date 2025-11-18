defmodule LocacaoApiWeb.ClassificacaoEtariaControllerTest do
  use LocacaoApiWeb.ConnCase

  import LocacaoApi.MidiasFixtures
  alias LocacaoApi.Midias.ClassificacaoEtaria

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
    test "lists all classificacao_etaria", %{conn: conn} do
      conn = get(conn, ~p"/api/classificacao_etaria")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create classificacao_etaria" do
    test "renders classificacao_etaria when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/classificacao_etaria", classificacao_etaria: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/classificacao_etaria/#{id}")

      assert %{
               "id" => ^id,
               "descricao" => "some descricao"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/classificacao_etaria", classificacao_etaria: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update classificacao_etaria" do
    setup [:create_classificacao_etaria]

    test "renders classificacao_etaria when data is valid", %{conn: conn, classificacao_etaria: %ClassificacaoEtaria{id: id} = classificacao_etaria} do
      conn = put(conn, ~p"/api/classificacao_etaria/#{classificacao_etaria}", classificacao_etaria: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/classificacao_etaria/#{id}")

      assert %{
               "id" => ^id,
               "descricao" => "some updated descricao"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, classificacao_etaria: classificacao_etaria} do
      conn = put(conn, ~p"/api/classificacao_etaria/#{classificacao_etaria}", classificacao_etaria: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete classificacao_etaria" do
    setup [:create_classificacao_etaria]

    test "deletes chosen classificacao_etaria", %{conn: conn, classificacao_etaria: classificacao_etaria} do
      conn = delete(conn, ~p"/api/classificacao_etaria/#{classificacao_etaria}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/classificacao_etaria/#{classificacao_etaria}")
      end
    end
  end

  defp create_classificacao_etaria(_) do
    classificacao_etaria = classificacao_etaria_fixture()

    %{classificacao_etaria: classificacao_etaria}
  end
end
