defmodule LocacaoApi.Midias.ClassificacaoEtaria do
  use Ecto.Schema
  import Ecto.Changeset

  alias LocacaoApi.Midias.Midia

  schema "classificacao_etaria" do
    field :descricao, :string

    has_many :midias, Midia
  end

  @doc false
  def changeset(classificacao_etaria, attrs) do
    classificacao_etaria
    |> cast(attrs, [:descricao])
    |> validate_required([:descricao])
  end
end
