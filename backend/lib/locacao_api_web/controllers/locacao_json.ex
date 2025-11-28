defmodule LocacaoApiWeb.LocacaoJSON do
  alias LocacaoApi.Locacoes.Locacao

  def index(%{locacao: locacao}) do
    %{data: for(loc <- locacao, do: data(loc))}
  end

  def show(%{locacao: locacao}) do
    %{data: data(locacao)}
  end

  def data(%Locacao{} = locacao) do
    itens = locacao.itens_locacao || []

    nomes_filmes =
      itens
      |> Enum.map(fn item ->
        if Ecto.assoc_loaded?(item.exemplar) && Ecto.assoc_loaded?(item.exemplar.midia) do
          "#{item.exemplar.midia.titulo} (Cód: #{item.exemplar.codigo_interno})"
        else
          "erro"
        end
      end)
      |> Enum.join(", ")

    valor_total = Enum.reduce(itens, Decimal.new("0.00"), fn i, total -> Decimal.add(total, i.valor) end)

    cliente = if Ecto.assoc_loaded?(locacao.cliente), do: locacao.cliente, else: nil

    %{
      id: locacao.id,
      Data_de_Início: locacao.data_inicio,
      Data_de_Fim: locacao.data_fim,
      Cancelada: locacao.cancelada,

      Cliente_id: locacao.cliente_id,
      Filmes: nomes_filmes,
      Valor_Total: valor_total,

      Itens: Enum.map(itens, fn i ->
        %{
          Exemplar_Código_Interno: i.exemplar_codigo_interno,
          Valor: i.valor
        }
      end)
    }
  end
end
