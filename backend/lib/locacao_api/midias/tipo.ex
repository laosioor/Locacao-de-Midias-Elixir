defmodule LocacaoApi.Midias.Tipo do
  use Ecto.Schema
  import Ecto.Changeset

  alias LocacaoApi.Midias.Midia

  schema "tipo" do
    field :descricao, :string

    has_many :midias, Midia
  end

  @doc false
  def changeset(tipo, attrs) do
    tipo
    |> cast(attrs, [:descricao])
    |> validate_required([:descricao])
  end
end
