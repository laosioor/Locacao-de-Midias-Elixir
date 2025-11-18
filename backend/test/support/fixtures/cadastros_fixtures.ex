defmodule LocacaoApi.CadastrosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LocacaoApi.Cadastros` context.
  """

  @doc """
  Generate a unique estado sigla.
  """
  def unique_estado_sigla, do: "some sigla#{System.unique_integer([:positive])}"

  @doc """
  Generate a estado.
  """
  def estado_fixture(attrs \\ %{}) do
    {:ok, estado} =
      attrs
      |> Enum.into(%{
        nome: "some nome",
        sigla: unique_estado_sigla()
      })
      |> LocacaoApi.Cadastros.create_estado()

    estado
  end

  @doc """
  Generate a cidade.
  """
  def cidade_fixture(attrs \\ %{}) do
    {:ok, cidade} =
      attrs
      |> Enum.into(%{
        nome: "some nome"
      })
      |> LocacaoApi.Cadastros.create_cidade()

    cidade
  end

  @doc """
  Generate a unique cliente cpf.
  """
  def unique_cliente_cpf, do: "some cpf#{System.unique_integer([:positive])}"

  @doc """
  Generate a cliente.
  """
  def cliente_fixture(attrs \\ %{}) do
    {:ok, cliente} =
      attrs
      |> Enum.into(%{
        bairro: "some bairro",
        cep: "some cep",
        cpf: unique_cliente_cpf(),
        data_nascimento: ~D[2025-11-16],
        email: "some email",
        logradouro: "some logradouro",
        nome: "some nome",
        numero: "some numero",
        sobrenome: "some sobrenome"
      })
      |> LocacaoApi.Cadastros.create_cliente()

    cliente
  end
end
