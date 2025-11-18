defmodule LocacaoApi.Midias.Genero do
  use Ecto.Schema
  import Ecto.Changeset

  alias LocacaoApi.Midias.Midia

  schema "genero" do
    field :descricao, :string

    has_many :midias, Midia
  end

  @doc false
  def changeset(genero, attrs) do
    genero
    |> cast(attrs, [:descricao])
    |> validate_required([:descricao])
  end
end
