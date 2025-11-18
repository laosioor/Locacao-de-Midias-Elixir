defmodule LocacaoApi.Midias.ClassificacaoInterna do
  use Ecto.Schema
  import Ecto.Changeset

  alias LocacaoApi.Midias.Midia

  schema "classificacao_interna" do
    field :descricao, :string
    field :valor_aluguel, :decimal

    has_many :midias, Midia
  end

  @doc false
  def changeset(classificacao_interna, attrs) do
    classificacao_interna
    |> cast(attrs, [:descricao, :valor_aluguel])
    |> validate_required([:descricao, :valor_aluguel])
  end
end
