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
      codigo_interno: exemplar.codigo_interno,
      disponivel: exemplar.disponivel,
      midia_id: exemplar.midia_id
    }
  end
end
