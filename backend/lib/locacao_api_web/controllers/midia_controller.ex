defmodule LocacaoApiWeb.MidiaController do
  use LocacaoApiWeb, :controller

  alias LocacaoApi.Midias
  alias LocacaoApi.Midias.Midia

  action_fallback LocacaoApiWeb.FallbackController

  def index(conn, _params) do
    midia = Midias.list_midia()
    render(conn, :index, midia: midia)
  end

  def create(conn, %{"midia" => midia_params}) do
    atributos_limpos = normalizar_params(midia_params)
    with {:ok, %Midia{} = midia} <- Midias.create_midia(atributos_limpos) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/midia/#{midia}")
      |> render(:show, midia: midia)
    end
  end

  def show(conn, %{"id" => id}) do
    midia = Midias.get_midia!(id)
    render(conn, :show, midia: midia)
  end

  def update(conn, %{"id" => id, "midia" => midia_params}) do
    midia = Midias.get_midia!(id)

    atributos_limpos = normalizar_params(midia_params)

    with {:ok, %Midia{} = midia} <- Midias.update_midia(midia, atributos_limpos) do
      render(conn, :show, midia: midia)
    end
  end

  def delete(conn, %{"id" => id}) do
    midia = Midias.get_midia!(id)

    with {:ok, %Midia{}} <- Midias.delete_midia(midia) do
      send_resp(conn, :no_content, "")
    end
  end

  defp normalizar_params(params) do
    %{
      "titulo" => params["Título"],
      "ano_lancamento" => params["Ano_de_Lançamento"],
      "codigo_barras" => params["Código_de_Barras"],
      "duracao_em_minutos" => params["Duração_em_Minutos"],
      "ator_principal" => params["Ator_Principal_id"],
      "ator_coadjuvante" => params["Ator_Coadjuvante_id"],
      "genero_id" => params["Gênero_id"],
      "tipo_id" => params["Tipo_id"],
      "classificacao_etaria_id" => params["Classificação_Etária_id"],
      "classificacao_interna_id" => params["Classificação_Interna_id"]
    }
    |> Enum.reject(fn {_, v} -> is_nil(v) end)
    |> Map.new()
  end
end
