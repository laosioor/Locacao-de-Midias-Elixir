defmodule LocacaoApi.Midias.Ator do
  use Ecto.Schema
  import Ecto.Changeset

  alias LocacaoApi.Midias.Midia

  schema "ator" do
    field :nome, :string
    field :sobrenome, :string
    field :data_estreia, :date

    has_many :midias_como_principal, Midia, foreign_key: :ator_principal_id
    has_many :midias_como_coadjuvante, Midia, foreign_key: :ator_coadjuvante_id
  end

  @doc false
  def changeset(ator, attrs) do
    ator
    |> cast(attrs, [:nome, :sobrenome, :data_estreia])
    |> validate_required([:nome, :sobrenome, :data_estreia])
  end
end
