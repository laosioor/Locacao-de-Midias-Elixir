defmodule LocacaoApi.Cadastros.Estado do
  use Ecto.Schema
  import Ecto.Changeset

  alias LocacaoApi.Cadastros.Cidade

  schema "estado" do
    field :nome, :string
    field :sigla, :string

    has_many :cidades, Cidade

  end

  @doc false
  def changeset(estado, attrs) do
    estado
    |> cast(attrs, [:nome, :sigla])
    |> validate_required([:nome, :sigla])
    |> unique_constraint(:sigla)
  end
end
