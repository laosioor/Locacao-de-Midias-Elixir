defmodule LocacaoApi.Midias.Exemplar do
  use Ecto.Schema
  import Ecto.Changeset

  alias LocacaoApi.Midias.Midia
  alias LocacaoApi.Locacoes.ItemLocacao

  @derive {Phoenix.Param, key: :codigo_interno}

  @primary_key {:codigo_interno, :id, autogenerate: true}
  schema "exemplar" do
    field :disponivel, :boolean, default: false

    belongs_to :midia, Midia, foreign_key: :midia_id

    has_many :itens_locacao, ItemLocacao, foreign_key: :exemplar_codigo_interno
  end

  @doc false
  def changeset(exemplar, attrs) do
    exemplar
    |> cast(attrs, [:disponivel, :midia_id])
    |> validate_required([:disponivel, :midia_id])
    |> assoc_constraint(:midia)
  end
end
