defmodule LocacaoApi.LocacoesTest do
  use LocacaoApi.DataCase

  alias LocacaoApi.Locacoes

  describe "locacao" do
    alias LocacaoApi.Locacoes.Locacao

    import LocacaoApi.LocacoesFixtures

    @invalid_attrs %{data_inicio: nil, data_fim: nil, cancelada: nil}

    test "list_locacao/0 returns all locacao" do
      locacao = locacao_fixture()
      assert Locacoes.list_locacao() == [locacao]
    end

    test "get_locacao!/1 returns the locacao with given id" do
      locacao = locacao_fixture()
      assert Locacoes.get_locacao!(locacao.id) == locacao
    end

    test "create_locacao/1 with valid data creates a locacao" do
      valid_attrs = %{data_inicio: ~D[2025-11-16], data_fim: ~D[2025-11-16], cancelada: true}

      assert {:ok, %Locacao{} = locacao} = Locacoes.create_locacao(valid_attrs)
      assert locacao.data_inicio == ~D[2025-11-16]
      assert locacao.data_fim == ~D[2025-11-16]
      assert locacao.cancelada == true
    end

    test "create_locacao/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Locacoes.create_locacao(@invalid_attrs)
    end

    test "update_locacao/2 with valid data updates the locacao" do
      locacao = locacao_fixture()
      update_attrs = %{data_inicio: ~D[2025-11-17], data_fim: ~D[2025-11-17], cancelada: false}

      assert {:ok, %Locacao{} = locacao} = Locacoes.update_locacao(locacao, update_attrs)
      assert locacao.data_inicio == ~D[2025-11-17]
      assert locacao.data_fim == ~D[2025-11-17]
      assert locacao.cancelada == false
    end

    test "update_locacao/2 with invalid data returns error changeset" do
      locacao = locacao_fixture()
      assert {:error, %Ecto.Changeset{}} = Locacoes.update_locacao(locacao, @invalid_attrs)
      assert locacao == Locacoes.get_locacao!(locacao.id)
    end

    test "delete_locacao/1 deletes the locacao" do
      locacao = locacao_fixture()
      assert {:ok, %Locacao{}} = Locacoes.delete_locacao(locacao)
      assert_raise Ecto.NoResultsError, fn -> Locacoes.get_locacao!(locacao.id) end
    end

    test "change_locacao/1 returns a locacao changeset" do
      locacao = locacao_fixture()
      assert %Ecto.Changeset{} = Locacoes.change_locacao(locacao)
    end
  end
end
