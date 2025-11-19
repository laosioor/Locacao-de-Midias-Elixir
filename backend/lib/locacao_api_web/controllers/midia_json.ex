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
      titulo: midia.titulo,
      ano_lancamento: midia.ano_lancamento,
      codigo_barras: midia.codigo_barras,
      duracao_em_minutos: midia.duracao_em_minutos,
      ator_principal_id: midia.ator_principal,
      ator_coadjuvante_id: midia.ator_coadjuvante,
      genero_id: midia.genero_id,
      tipo_id: midia.tipo_id,
      classificacao_etaria_id: midia.classificacao_etaria_id,
      classificacao_interna_id: midia.classificacao_interna_id
    }
  end
end
