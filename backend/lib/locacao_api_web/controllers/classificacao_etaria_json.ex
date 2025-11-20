defmodule LocacaoApiWeb.ClassificacaoEtariaJSON do
  alias LocacaoApi.Midias.ClassificacaoEtaria

  @doc """
  Renders a list of classificacao_etaria.
  """
  def index(%{classificacao_etaria: classificacao_etaria}) do
    %{data: for(classificacao_etaria <- classificacao_etaria, do: data(classificacao_etaria))}
  end

  @doc """
  Renders a single classificacao_etaria.
  """
  def show(%{classificacao_etaria: classificacao_etaria}) do
    %{data: data(classificacao_etaria)}
  end

  def data(%ClassificacaoEtaria{} = classificacao_etaria) do
    %{
      id: classificacao_etaria.id,
      Descrição: classificacao_etaria.descricao
    }
  end
end
