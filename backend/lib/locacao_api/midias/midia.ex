defmodule LocacaoApi.Midias.Midia do
  use Ecto.Schema
  import Ecto.Changeset

  alias LocacaoApi.Midias.Ator
  alias LocacaoApi.Midias.Genero
  alias LocacaoApi.Midias.Tipo
  alias LocacaoApi.Midias.ClassificacaoEtaria
  alias LocacaoApi.Midias.ClassificacaoInterna
  alias LocacaoApi.Midias.Exemplar

  schema "midia" do
    field :titulo, :string
    field :ano_lancamento, :integer
    field :codigo_barras, :string
    field :duracao_em_minutos, :integer

    belongs_to :ator_principal, Ator,  foreign_key: :ator_principal_id
    belongs_to :ator_coadjuvante, Ator, foreign_key: :ator_coadjuvante_id
    belongs_to :genero, Genero, foreign_key: :genero_id
    belongs_to :classificacao_etaria, ClassificacaoEtaria, foreign_key: :classificacao_etaria_id
    belongs_to :tipo, Tipo, foreign_key: :tipo_id
    belongs_to :classificacao_interna, ClassificacaoInterna, foreign_key: :classificacao_interna_id

    has_many :exemplares, Exemplar
  end

  @doc false
  def changeset(midia, attrs) do
    midia
    |> cast(attrs, [:titulo, :ano_lancamento, :codigo_barras, :duracao_em_minutos, :ator_principal_id, :ator_coadjuvante_id, :genero_id, :classificacao_etaria_id, :tipo_id, :classificacao_interna_id])
    |> validate_required([:titulo, :ano_lancamento, :codigo_barras, :duracao_em_minutos, :ator_principal_id, :ator_coadjuvante_id, :genero_id, :classificacao_etaria_id, :tipo_id, :classificacao_interna_id])
    |> unique_constraint(:codigo_barras)
    |> assoc_constraint(:ator_principal)
    |> assoc_constraint(:ator_coadjuvante)
    |> assoc_constraint(:genero)
    |> assoc_constraint(:classificacao_etaria)
    |> assoc_constraint(:tipo)
    |> assoc_constraint(:classificacao_interna)
  end
end
