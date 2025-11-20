defmodule LocacaoApiWeb.MidiaJSON do
  alias LocacaoApi.Midias.Midia

  @doc """
  Renders a list of midia.
  """
  def index(%{midia: midia}) do
    %{data: for(midia <- midia, do: data(midia))}
  end

  @doc """
  Renders a single midia.
  """
  def show(%{midia: midia}) do
    %{data: data(midia)}
  end

  def data(%Midia{} = midia) do
    %{
      id: midia.id,
      Título: midia.titulo,
      Ano_de_Lançamento: midia.ano_lancamento,
      Código_de_Barras: midia.codigo_barras,
      Duração_em_Minutos: midia.duracao_em_minutos,
      Ator_Principal_id: midia.ator_principal,
      Ator_Coadjuvante_id: midia.ator_coadjuvante,
      Gênero_id: midia.genero_id,
      Tipo_id: midia.tipo_id,
      Classificação_Etária_id: midia.classificacao_etaria_id,
      Classificação_Interna_id: midia.classificacao_interna_id
    }
  end
end
