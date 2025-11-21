defmodule LocacaoApiWeb.LocacaoJSON do
  alias LocacaoApi.Locacoes.Locacao

  def index(%{locacao: locacao}) do
    %{data: for(loc <- locacao, do: data(loc))}
  end

  def show(%{locacao: locacao}) do
    %{data: data(locacao)}
  end

  def data(%Locacao{} = locacao) do
    raw_item = Map.get(locacao, :itens_locacao) || Map.get(locacao, :item_locacao)

    item = cond do
      !Ecto.assoc_loaded?(raw_item) -> nil

      is_list(raw_item) -> List.first(raw_item)

      true -> nil
    end

    exemplar = if item && Ecto.assoc_loaded?(item.exemplar), do: item.exemplar, else: nil
    midia = if exemplar && Ecto.assoc_loaded?(exemplar.midia), do: exemplar.midia, else: nil
    cliente = if Ecto.assoc_loaded?(locacao.cliente), do: locacao.cliente, else: nil

    %{
      id: locacao.id,
      Data_de_Início: locacao.data_inicio,
      Data_de_Fim: locacao.data_fim,
      Cancelada: locacao.cancelada,

      Cliente_id: locacao.cliente_id,
      Exemplar_Código_Interno: if(item, do: item.exemplar_codigo_interno, else: nil),
      Valor: if(item, do: item.valor, else: nil),

      Cliente: if(cliente, do: "#{cliente.nome} #{cliente.sobrenome}", else: "Carregando..."),
      Filme: if(midia, do: "#{midia.titulo} (Cód: #{exemplar.codigo_interno})", else: "N/A")
    }
  end
end
