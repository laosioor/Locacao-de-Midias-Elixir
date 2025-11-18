defmodule LocacaoApi.MidiasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LocacaoApi.Midias` context.
  """

  @doc """
  Generate a ator.
  """
  def ator_fixture(attrs \\ %{}) do
    {:ok, ator} =
      attrs
      |> Enum.into(%{
        data_estreia: ~D[2025-11-16],
        nome: "some nome",
        sobrenome: "some sobrenome"
      })
      |> LocacaoApi.Midias.create_ator()

    ator
  end

  @doc """
  Generate a genero.
  """
  def genero_fixture(attrs \\ %{}) do
    {:ok, genero} =
      attrs
      |> Enum.into(%{
        descricao: "some descricao"
      })
      |> LocacaoApi.Midias.create_genero()

    genero
  end

  @doc """
  Generate a classificacao_etaria.
  """
  def classificacao_etaria_fixture(attrs \\ %{}) do
    {:ok, classificacao_etaria} =
      attrs
      |> Enum.into(%{
        descricao: "some descricao"
      })
      |> LocacaoApi.Midias.create_classificacao_etaria()

    classificacao_etaria
  end

  @doc """
  Generate a tipo.
  """
  def tipo_fixture(attrs \\ %{}) do
    {:ok, tipo} =
      attrs
      |> Enum.into(%{
        descricao: "some descricao"
      })
      |> LocacaoApi.Midias.create_tipo()

    tipo
  end

  @doc """
  Generate a classificacao_interna.
  """
  def classificacao_interna_fixture(attrs \\ %{}) do
    {:ok, classificacao_interna} =
      attrs
      |> Enum.into(%{
        descricao: "some descricao",
        valor_aluguel: "120.5"
      })
      |> LocacaoApi.Midias.create_classificacao_interna()

    classificacao_interna
  end

  @doc """
  Generate a unique midia codigo_barras.
  """
  def unique_midia_codigo_barras, do: "some codigo_barras#{System.unique_integer([:positive])}"

  @doc """
  Generate a midia.
  """
  def midia_fixture(attrs \\ %{}) do
    {:ok, midia} =
      attrs
      |> Enum.into(%{
        ano_lancamento: 42,
        codigo_barras: unique_midia_codigo_barras(),
        duracao_em_minutos: 42,
        titulo: "some titulo"
      })
      |> LocacaoApi.Midias.create_midia()

    midia
  end

  @doc """
  Generate a exemplar.
  """
  def exemplar_fixture(attrs \\ %{}) do
    {:ok, exemplar} =
      attrs
      |> Enum.into(%{
        disponivel: true
      })
      |> LocacaoApi.Midias.create_exemplar()

    exemplar
  end
end
