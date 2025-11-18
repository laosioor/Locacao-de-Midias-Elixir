defmodule LocacaoApi.MidiasTest do
  use LocacaoApi.DataCase

  alias LocacaoApi.Midias

  describe "ator" do
    alias LocacaoApi.Midias.Ator

    import LocacaoApi.MidiasFixtures

    @invalid_attrs %{nome: nil, sobrenome: nil, data_estreia: nil}

    test "list_ator/0 returns all ator" do
      ator = ator_fixture()
      assert Midias.list_ator() == [ator]
    end

    test "get_ator!/1 returns the ator with given id" do
      ator = ator_fixture()
      assert Midias.get_ator!(ator.id) == ator
    end

    test "create_ator/1 with valid data creates a ator" do
      valid_attrs = %{nome: "some nome", sobrenome: "some sobrenome", data_estreia: ~D[2025-11-16]}

      assert {:ok, %Ator{} = ator} = Midias.create_ator(valid_attrs)
      assert ator.nome == "some nome"
      assert ator.sobrenome == "some sobrenome"
      assert ator.data_estreia == ~D[2025-11-16]
    end

    test "create_ator/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Midias.create_ator(@invalid_attrs)
    end

    test "update_ator/2 with valid data updates the ator" do
      ator = ator_fixture()
      update_attrs = %{nome: "some updated nome", sobrenome: "some updated sobrenome", data_estreia: ~D[2025-11-17]}

      assert {:ok, %Ator{} = ator} = Midias.update_ator(ator, update_attrs)
      assert ator.nome == "some updated nome"
      assert ator.sobrenome == "some updated sobrenome"
      assert ator.data_estreia == ~D[2025-11-17]
    end

    test "update_ator/2 with invalid data returns error changeset" do
      ator = ator_fixture()
      assert {:error, %Ecto.Changeset{}} = Midias.update_ator(ator, @invalid_attrs)
      assert ator == Midias.get_ator!(ator.id)
    end

    test "delete_ator/1 deletes the ator" do
      ator = ator_fixture()
      assert {:ok, %Ator{}} = Midias.delete_ator(ator)
      assert_raise Ecto.NoResultsError, fn -> Midias.get_ator!(ator.id) end
    end

    test "change_ator/1 returns a ator changeset" do
      ator = ator_fixture()
      assert %Ecto.Changeset{} = Midias.change_ator(ator)
    end
  end

  describe "genero" do
    alias LocacaoApi.Midias.Genero

    import LocacaoApi.MidiasFixtures

    @invalid_attrs %{descricao: nil}

    test "list_genero/0 returns all genero" do
      genero = genero_fixture()
      assert Midias.list_genero() == [genero]
    end

    test "get_genero!/1 returns the genero with given id" do
      genero = genero_fixture()
      assert Midias.get_genero!(genero.id) == genero
    end

    test "create_genero/1 with valid data creates a genero" do
      valid_attrs = %{descricao: "some descricao"}

      assert {:ok, %Genero{} = genero} = Midias.create_genero(valid_attrs)
      assert genero.descricao == "some descricao"
    end

    test "create_genero/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Midias.create_genero(@invalid_attrs)
    end

    test "update_genero/2 with valid data updates the genero" do
      genero = genero_fixture()
      update_attrs = %{descricao: "some updated descricao"}

      assert {:ok, %Genero{} = genero} = Midias.update_genero(genero, update_attrs)
      assert genero.descricao == "some updated descricao"
    end

    test "update_genero/2 with invalid data returns error changeset" do
      genero = genero_fixture()
      assert {:error, %Ecto.Changeset{}} = Midias.update_genero(genero, @invalid_attrs)
      assert genero == Midias.get_genero!(genero.id)
    end

    test "delete_genero/1 deletes the genero" do
      genero = genero_fixture()
      assert {:ok, %Genero{}} = Midias.delete_genero(genero)
      assert_raise Ecto.NoResultsError, fn -> Midias.get_genero!(genero.id) end
    end

    test "change_genero/1 returns a genero changeset" do
      genero = genero_fixture()
      assert %Ecto.Changeset{} = Midias.change_genero(genero)
    end
  end

  describe "classificacao_etaria" do
    alias LocacaoApi.Midias.ClassificacaoEtaria

    import LocacaoApi.MidiasFixtures

    @invalid_attrs %{descricao: nil}

    test "list_classificacao_etaria/0 returns all classificacao_etaria" do
      classificacao_etaria = classificacao_etaria_fixture()
      assert Midias.list_classificacao_etaria() == [classificacao_etaria]
    end

    test "get_classificacao_etaria!/1 returns the classificacao_etaria with given id" do
      classificacao_etaria = classificacao_etaria_fixture()
      assert Midias.get_classificacao_etaria!(classificacao_etaria.id) == classificacao_etaria
    end

    test "create_classificacao_etaria/1 with valid data creates a classificacao_etaria" do
      valid_attrs = %{descricao: "some descricao"}

      assert {:ok, %ClassificacaoEtaria{} = classificacao_etaria} = Midias.create_classificacao_etaria(valid_attrs)
      assert classificacao_etaria.descricao == "some descricao"
    end

    test "create_classificacao_etaria/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Midias.create_classificacao_etaria(@invalid_attrs)
    end

    test "update_classificacao_etaria/2 with valid data updates the classificacao_etaria" do
      classificacao_etaria = classificacao_etaria_fixture()
      update_attrs = %{descricao: "some updated descricao"}

      assert {:ok, %ClassificacaoEtaria{} = classificacao_etaria} = Midias.update_classificacao_etaria(classificacao_etaria, update_attrs)
      assert classificacao_etaria.descricao == "some updated descricao"
    end

    test "update_classificacao_etaria/2 with invalid data returns error changeset" do
      classificacao_etaria = classificacao_etaria_fixture()
      assert {:error, %Ecto.Changeset{}} = Midias.update_classificacao_etaria(classificacao_etaria, @invalid_attrs)
      assert classificacao_etaria == Midias.get_classificacao_etaria!(classificacao_etaria.id)
    end

    test "delete_classificacao_etaria/1 deletes the classificacao_etaria" do
      classificacao_etaria = classificacao_etaria_fixture()
      assert {:ok, %ClassificacaoEtaria{}} = Midias.delete_classificacao_etaria(classificacao_etaria)
      assert_raise Ecto.NoResultsError, fn -> Midias.get_classificacao_etaria!(classificacao_etaria.id) end
    end

    test "change_classificacao_etaria/1 returns a classificacao_etaria changeset" do
      classificacao_etaria = classificacao_etaria_fixture()
      assert %Ecto.Changeset{} = Midias.change_classificacao_etaria(classificacao_etaria)
    end
  end

  describe "tipo" do
    alias LocacaoApi.Midias.Tipo

    import LocacaoApi.MidiasFixtures

    @invalid_attrs %{descricao: nil}

    test "list_tipo/0 returns all tipo" do
      tipo = tipo_fixture()
      assert Midias.list_tipo() == [tipo]
    end

    test "get_tipo!/1 returns the tipo with given id" do
      tipo = tipo_fixture()
      assert Midias.get_tipo!(tipo.id) == tipo
    end

    test "create_tipo/1 with valid data creates a tipo" do
      valid_attrs = %{descricao: "some descricao"}

      assert {:ok, %Tipo{} = tipo} = Midias.create_tipo(valid_attrs)
      assert tipo.descricao == "some descricao"
    end

    test "create_tipo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Midias.create_tipo(@invalid_attrs)
    end

    test "update_tipo/2 with valid data updates the tipo" do
      tipo = tipo_fixture()
      update_attrs = %{descricao: "some updated descricao"}

      assert {:ok, %Tipo{} = tipo} = Midias.update_tipo(tipo, update_attrs)
      assert tipo.descricao == "some updated descricao"
    end

    test "update_tipo/2 with invalid data returns error changeset" do
      tipo = tipo_fixture()
      assert {:error, %Ecto.Changeset{}} = Midias.update_tipo(tipo, @invalid_attrs)
      assert tipo == Midias.get_tipo!(tipo.id)
    end

    test "delete_tipo/1 deletes the tipo" do
      tipo = tipo_fixture()
      assert {:ok, %Tipo{}} = Midias.delete_tipo(tipo)
      assert_raise Ecto.NoResultsError, fn -> Midias.get_tipo!(tipo.id) end
    end

    test "change_tipo/1 returns a tipo changeset" do
      tipo = tipo_fixture()
      assert %Ecto.Changeset{} = Midias.change_tipo(tipo)
    end
  end

  describe "classificacao_interna" do
    alias LocacaoApi.Midias.ClassificacaoInterna

    import LocacaoApi.MidiasFixtures

    @invalid_attrs %{descricao: nil, valor_aluguel: nil}

    test "list_classificacao_interna/0 returns all classificacao_interna" do
      classificacao_interna = classificacao_interna_fixture()
      assert Midias.list_classificacao_interna() == [classificacao_interna]
    end

    test "get_classificacao_interna!/1 returns the classificacao_interna with given id" do
      classificacao_interna = classificacao_interna_fixture()
      assert Midias.get_classificacao_interna!(classificacao_interna.id) == classificacao_interna
    end

    test "create_classificacao_interna/1 with valid data creates a classificacao_interna" do
      valid_attrs = %{descricao: "some descricao", valor_aluguel: "120.5"}

      assert {:ok, %ClassificacaoInterna{} = classificacao_interna} = Midias.create_classificacao_interna(valid_attrs)
      assert classificacao_interna.descricao == "some descricao"
      assert classificacao_interna.valor_aluguel == Decimal.new("120.5")
    end

    test "create_classificacao_interna/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Midias.create_classificacao_interna(@invalid_attrs)
    end

    test "update_classificacao_interna/2 with valid data updates the classificacao_interna" do
      classificacao_interna = classificacao_interna_fixture()
      update_attrs = %{descricao: "some updated descricao", valor_aluguel: "456.7"}

      assert {:ok, %ClassificacaoInterna{} = classificacao_interna} = Midias.update_classificacao_interna(classificacao_interna, update_attrs)
      assert classificacao_interna.descricao == "some updated descricao"
      assert classificacao_interna.valor_aluguel == Decimal.new("456.7")
    end

    test "update_classificacao_interna/2 with invalid data returns error changeset" do
      classificacao_interna = classificacao_interna_fixture()
      assert {:error, %Ecto.Changeset{}} = Midias.update_classificacao_interna(classificacao_interna, @invalid_attrs)
      assert classificacao_interna == Midias.get_classificacao_interna!(classificacao_interna.id)
    end

    test "delete_classificacao_interna/1 deletes the classificacao_interna" do
      classificacao_interna = classificacao_interna_fixture()
      assert {:ok, %ClassificacaoInterna{}} = Midias.delete_classificacao_interna(classificacao_interna)
      assert_raise Ecto.NoResultsError, fn -> Midias.get_classificacao_interna!(classificacao_interna.id) end
    end

    test "change_classificacao_interna/1 returns a classificacao_interna changeset" do
      classificacao_interna = classificacao_interna_fixture()
      assert %Ecto.Changeset{} = Midias.change_classificacao_interna(classificacao_interna)
    end
  end

  describe "midia" do
    alias LocacaoApi.Midias.Midia

    import LocacaoApi.MidiasFixtures

    @invalid_attrs %{titulo: nil, ano_lancamento: nil, codigo_barras: nil, duracao_em_minutos: nil}

    test "list_midia/0 returns all midia" do
      midia = midia_fixture()
      assert Midias.list_midia() == [midia]
    end

    test "get_midia!/1 returns the midia with given id" do
      midia = midia_fixture()
      assert Midias.get_midia!(midia.id) == midia
    end

    test "create_midia/1 with valid data creates a midia" do
      valid_attrs = %{titulo: "some titulo", ano_lancamento: 42, codigo_barras: "some codigo_barras", duracao_em_minutos: 42}

      assert {:ok, %Midia{} = midia} = Midias.create_midia(valid_attrs)
      assert midia.titulo == "some titulo"
      assert midia.ano_lancamento == 42
      assert midia.codigo_barras == "some codigo_barras"
      assert midia.duracao_em_minutos == 42
    end

    test "create_midia/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Midias.create_midia(@invalid_attrs)
    end

    test "update_midia/2 with valid data updates the midia" do
      midia = midia_fixture()
      update_attrs = %{titulo: "some updated titulo", ano_lancamento: 43, codigo_barras: "some updated codigo_barras", duracao_em_minutos: 43}

      assert {:ok, %Midia{} = midia} = Midias.update_midia(midia, update_attrs)
      assert midia.titulo == "some updated titulo"
      assert midia.ano_lancamento == 43
      assert midia.codigo_barras == "some updated codigo_barras"
      assert midia.duracao_em_minutos == 43
    end

    test "update_midia/2 with invalid data returns error changeset" do
      midia = midia_fixture()
      assert {:error, %Ecto.Changeset{}} = Midias.update_midia(midia, @invalid_attrs)
      assert midia == Midias.get_midia!(midia.id)
    end

    test "delete_midia/1 deletes the midia" do
      midia = midia_fixture()
      assert {:ok, %Midia{}} = Midias.delete_midia(midia)
      assert_raise Ecto.NoResultsError, fn -> Midias.get_midia!(midia.id) end
    end

    test "change_midia/1 returns a midia changeset" do
      midia = midia_fixture()
      assert %Ecto.Changeset{} = Midias.change_midia(midia)
    end
  end

  describe "exemplar" do
    alias LocacaoApi.Midias.Exemplar

    import LocacaoApi.MidiasFixtures

    @invalid_attrs %{disponivel: nil}

    test "list_exemplar/0 returns all exemplar" do
      exemplar = exemplar_fixture()
      assert Midias.list_exemplar() == [exemplar]
    end

    test "get_exemplar!/1 returns the exemplar with given id" do
      exemplar = exemplar_fixture()
      assert Midias.get_exemplar!(exemplar.id) == exemplar
    end

    test "create_exemplar/1 with valid data creates a exemplar" do
      valid_attrs = %{disponivel: true}

      assert {:ok, %Exemplar{} = exemplar} = Midias.create_exemplar(valid_attrs)
      assert exemplar.disponivel == true
    end

    test "create_exemplar/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Midias.create_exemplar(@invalid_attrs)
    end

    test "update_exemplar/2 with valid data updates the exemplar" do
      exemplar = exemplar_fixture()
      update_attrs = %{disponivel: false}

      assert {:ok, %Exemplar{} = exemplar} = Midias.update_exemplar(exemplar, update_attrs)
      assert exemplar.disponivel == false
    end

    test "update_exemplar/2 with invalid data returns error changeset" do
      exemplar = exemplar_fixture()
      assert {:error, %Ecto.Changeset{}} = Midias.update_exemplar(exemplar, @invalid_attrs)
      assert exemplar == Midias.get_exemplar!(exemplar.id)
    end

    test "delete_exemplar/1 deletes the exemplar" do
      exemplar = exemplar_fixture()
      assert {:ok, %Exemplar{}} = Midias.delete_exemplar(exemplar)
      assert_raise Ecto.NoResultsError, fn -> Midias.get_exemplar!(exemplar.id) end
    end

    test "change_exemplar/1 returns a exemplar changeset" do
      exemplar = exemplar_fixture()
      assert %Ecto.Changeset{} = Midias.change_exemplar(exemplar)
    end
  end
end
