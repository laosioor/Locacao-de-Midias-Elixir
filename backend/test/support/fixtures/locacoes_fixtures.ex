defmodule LocacaoApi.LocacoesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LocacaoApi.Locacoes` context.
  """

  @doc """
  Generate a locacao.
  """
  def locacao_fixture(attrs \\ %{}) do
    {:ok, locacao} =
      attrs
      |> Enum.into(%{
        cancelada: true,
        data_fim: ~D[2025-11-16],
        data_inicio: ~D[2025-11-16]
      })
      |> LocacaoApi.Locacoes.create_locacao()

    locacao
  end
end
