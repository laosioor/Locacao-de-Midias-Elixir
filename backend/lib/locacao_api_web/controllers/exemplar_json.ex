defmodule LocacaoApiWeb.ExemplarJSON do

  alias LocacaoApi.Midias.Exemplar

  @doc """
  Renders a list of exemplar.
  """
  def index(%{exemplar: exemplar}) do
    %{data: for(exemplar <- exemplar, do: data(exemplar))}
  end

  @doc """
  Renders a single exemplar.
  """
  def show(%{exemplar: exemplar}) do
    %{data: data(exemplar)}
  end

  def data(%Exemplar{} = exemplar) do
    %{
      Código_Interno: exemplar.codigo_interno,
      Disponível: exemplar.disponivel,
      Mídia_id: exemplar.midia_id
    }
  end
end
