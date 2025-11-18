defmodule LocacaoApi.Cadastros.Cidade do
  use Ecto.Schema
  import Ecto.Changeset

  alias LocacaoApi.Cadastros.Estado
  alias LocacaoApi.Cadastros.Cliente

  schema "cidade" do
    field :nome, :string
    belongs_to :estado, Estado, foreign_key: :estado_id

    has_many :clientes, Cliente

  end

  @doc false
  def changeset(cidade, attrs) do
    cidade
    |> cast(attrs, [:nome, :estado_id])
    |> validate_required([:nome, :estado_id])
    |> assoc_constraint(:estado)
  end
end
