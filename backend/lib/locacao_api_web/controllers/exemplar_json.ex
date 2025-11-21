defmodule LocacaoApiWeb.ExemplarJSON do
  alias LocacaoApi.Midias.Exemplar

  def index(%{exemplar: exemplar}) do
    %{data: for(exemplar <- exemplar, do: data(exemplar))}
  end

  def show(%{exemplar: exemplar}) do
    %{data: data(exemplar)}
  end

  def data(%Exemplar{} = exemplar) do
    %{
      Código_Interno: exemplar.codigo_interno,
      Disponível: exemplar.disponivel,
      Mídia_id: exemplar.midia_id,
      midia: if(Ecto.assoc_loaded?(exemplar.midia), do: dados_midia(exemplar.midia), else: nil)
    }
  end

  defp dados_midia(midia) do
    %{
      id: midia.id,
      Título: midia.titulo,

      Classificação_Interna: if(Ecto.assoc_loaded?(midia.classificacao_interna),
        do: dados_classificacao(midia.classificacao_interna),
        else: nil)
    }
  end

  defp dados_classificacao(ci) do
    %{
      Descricao: ci.descricao,
      Valor: ci.valor_aluguel
    }
  end
end
