defmodule LocacaoApi.Cadastros.Cliente do
  use Ecto.Schema
  import Ecto.Changeset

  alias LocacaoApi.Cadastros.Cidade
  alias LocacaoApi.Locacoes.Locacao

  schema "cliente" do
    field :nome, :string
    field :sobrenome, :string
    field :data_nascimento, :date
    field :cpf, :string
    field :email, :string
    field :logradouro, :string
    field :numero, :string
    field :bairro, :string
    field :cep, :string

    belongs_to :cidade, Cidade, foreign_key: :cidade_id

    has_many :locacoes, Locacao
  end

  @doc false
  def changeset(cliente, attrs) do
    cliente
    |> cast(attrs, [:nome, :sobrenome, :data_nascimento, :cpf, :email, :logradouro, :numero, :bairro, :cep, :cidade_id])
    |> validate_required([:nome, :sobrenome, :data_nascimento, :cpf, :email, :logradouro, :numero, :bairro, :cep, :cidade_id])
    |> unique_constraint(:cpf)
    |> assoc_constraint(:cidade)
  end
end
