defmodule LocacaoApi.Locacoes.ItemLocacao do
  use Ecto.Schema
  import Ecto.Changeset

  alias LocacaoApi.Locacoes.Locacao
  alias LocacaoApi.Midias.Exemplar

  @primary_key false
  @schema "item_locacao"
  schema @schema do
    field :valor, :decimal
    belongs_to :locacao, Locacao, foreign_key: :locacao_id, primary_key: true
    belongs_to :exemplar, Exemplar, foreign_key: :exemplar_codigo_interno, references: :codigo_interno, type: :id, primary_key: true
  end

  def changeset(item_locacao, attrs) do
    item_locacao
    |> cast(attrs, [:exemplar_codigo_interno, :valor])
    |> validate_required([:exemplar_codigo_interno, :valor])
    |> assoc_constraint(:exemplar)
  end
end
