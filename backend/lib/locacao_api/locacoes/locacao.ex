defmodule LocacaoApi.Locacoes.Locacao do
  use Ecto.Schema
  import Ecto.Changeset

  alias LocacaoApi.Cadastros.Cliente
  alias LocacaoApi.Locacoes.ItemLocacao

  schema "locacao" do
    field :data_inicio, :date
    field :data_fim, :date
    field :cancelada, :boolean, default: false

    belongs_to :cliente, Cliente, foreign_key: :cliente_id

    has_many :itens_locacao, ItemLocacao, on_replace: :delete
  end

  @doc false
  def changeset(locacao, attrs) do
    locacao
    |> cast(attrs, [:data_inicio, :data_fim, :cancelada, :cliente_id])
    |> validate_required([:data_inicio, :data_fim, :cancelada, :cliente_id])
    |> assoc_constraint(:cliente)
    |> cast_assoc(:itens_locacao, with: &ItemLocacao.changeset/2, required: true)
  end
end
