defmodule LocacaoApi.CadastrosTest do
  use LocacaoApi.DataCase

  alias LocacaoApi.Cadastros

  describe "estado" do
    alias LocacaoApi.Cadastros.Estado

    import LocacaoApi.CadastrosFixtures

    @invalid_attrs %{nome: nil, sigla: nil}

    test "list_estado/0 returns all estado" do
      estado = estado_fixture()
      assert Cadastros.list_estado() == [estado]
    end

    test "get_estado!/1 returns the estado with given id" do
      estado = estado_fixture()
      assert Cadastros.get_estado!(estado.id) == estado
    end

    test "create_estado/1 with valid data creates a estado" do
      valid_attrs = %{nome: "some nome", sigla: "some sigla"}

      assert {:ok, %Estado{} = estado} = Cadastros.create_estado(valid_attrs)
      assert estado.nome == "some nome"
      assert estado.sigla == "some sigla"
    end

    test "create_estado/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cadastros.create_estado(@invalid_attrs)
    end

    test "update_estado/2 with valid data updates the estado" do
      estado = estado_fixture()
      update_attrs = %{nome: "some updated nome", sigla: "some updated sigla"}

      assert {:ok, %Estado{} = estado} = Cadastros.update_estado(estado, update_attrs)
      assert estado.nome == "some updated nome"
      assert estado.sigla == "some updated sigla"
    end

    test "update_estado/2 with invalid data returns error changeset" do
      estado = estado_fixture()
      assert {:error, %Ecto.Changeset{}} = Cadastros.update_estado(estado, @invalid_attrs)
      assert estado == Cadastros.get_estado!(estado.id)
    end

    test "delete_estado/1 deletes the estado" do
      estado = estado_fixture()
      assert {:ok, %Estado{}} = Cadastros.delete_estado(estado)
      assert_raise Ecto.NoResultsError, fn -> Cadastros.get_estado!(estado.id) end
    end

    test "change_estado/1 returns a estado changeset" do
      estado = estado_fixture()
      assert %Ecto.Changeset{} = Cadastros.change_estado(estado)
    end
  end

  describe "cidade" do
    alias LocacaoApi.Cadastros.Cidade

    import LocacaoApi.CadastrosFixtures

    @invalid_attrs %{nome: nil}

    test "list_cidade/0 returns all cidade" do
      cidade = cidade_fixture()
      assert Cadastros.list_cidade() == [cidade]
    end

    test "get_cidade!/1 returns the cidade with given id" do
      cidade = cidade_fixture()
      assert Cadastros.get_cidade!(cidade.id) == cidade
    end

    test "create_cidade/1 with valid data creates a cidade" do
      valid_attrs = %{nome: "some nome"}

      assert {:ok, %Cidade{} = cidade} = Cadastros.create_cidade(valid_attrs)
      assert cidade.nome == "some nome"
    end

    test "create_cidade/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cadastros.create_cidade(@invalid_attrs)
    end

    test "update_cidade/2 with valid data updates the cidade" do
      cidade = cidade_fixture()
      update_attrs = %{nome: "some updated nome"}

      assert {:ok, %Cidade{} = cidade} = Cadastros.update_cidade(cidade, update_attrs)
      assert cidade.nome == "some updated nome"
    end

    test "update_cidade/2 with invalid data returns error changeset" do
      cidade = cidade_fixture()
      assert {:error, %Ecto.Changeset{}} = Cadastros.update_cidade(cidade, @invalid_attrs)
      assert cidade == Cadastros.get_cidade!(cidade.id)
    end

    test "delete_cidade/1 deletes the cidade" do
      cidade = cidade_fixture()
      assert {:ok, %Cidade{}} = Cadastros.delete_cidade(cidade)
      assert_raise Ecto.NoResultsError, fn -> Cadastros.get_cidade!(cidade.id) end
    end

    test "change_cidade/1 returns a cidade changeset" do
      cidade = cidade_fixture()
      assert %Ecto.Changeset{} = Cadastros.change_cidade(cidade)
    end
  end

  describe "cliente" do
    alias LocacaoApi.Cadastros.Cliente

    import LocacaoApi.CadastrosFixtures

    @invalid_attrs %{nome: nil, sobrenome: nil, data_nascimento: nil, cpf: nil, email: nil, logradouro: nil, numero: nil, bairro: nil, cep: nil}

    test "list_cliente/0 returns all cliente" do
      cliente = cliente_fixture()
      assert Cadastros.list_cliente() == [cliente]
    end

    test "get_cliente!/1 returns the cliente with given id" do
      cliente = cliente_fixture()
      assert Cadastros.get_cliente!(cliente.id) == cliente
    end

    test "create_cliente/1 with valid data creates a cliente" do
      valid_attrs = %{nome: "some nome", sobrenome: "some sobrenome", data_nascimento: ~D[2025-11-16], cpf: "some cpf", email: "some email", logradouro: "some logradouro", numero: "some numero", bairro: "some bairro", cep: "some cep"}

      assert {:ok, %Cliente{} = cliente} = Cadastros.create_cliente(valid_attrs)
      assert cliente.nome == "some nome"
      assert cliente.sobrenome == "some sobrenome"
      assert cliente.data_nascimento == ~D[2025-11-16]
      assert cliente.cpf == "some cpf"
      assert cliente.email == "some email"
      assert cliente.logradouro == "some logradouro"
      assert cliente.numero == "some numero"
      assert cliente.bairro == "some bairro"
      assert cliente.cep == "some cep"
    end

    test "create_cliente/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cadastros.create_cliente(@invalid_attrs)
    end

    test "update_cliente/2 with valid data updates the cliente" do
      cliente = cliente_fixture()
      update_attrs = %{nome: "some updated nome", sobrenome: "some updated sobrenome", data_nascimento: ~D[2025-11-17], cpf: "some updated cpf", email: "some updated email", logradouro: "some updated logradouro", numero: "some updated numero", bairro: "some updated bairro", cep: "some updated cep"}

      assert {:ok, %Cliente{} = cliente} = Cadastros.update_cliente(cliente, update_attrs)
      assert cliente.nome == "some updated nome"
      assert cliente.sobrenome == "some updated sobrenome"
      assert cliente.data_nascimento == ~D[2025-11-17]
      assert cliente.cpf == "some updated cpf"
      assert cliente.email == "some updated email"
      assert cliente.logradouro == "some updated logradouro"
      assert cliente.numero == "some updated numero"
      assert cliente.bairro == "some updated bairro"
      assert cliente.cep == "some updated cep"
    end

    test "update_cliente/2 with invalid data returns error changeset" do
      cliente = cliente_fixture()
      assert {:error, %Ecto.Changeset{}} = Cadastros.update_cliente(cliente, @invalid_attrs)
      assert cliente == Cadastros.get_cliente!(cliente.id)
    end

    test "delete_cliente/1 deletes the cliente" do
      cliente = cliente_fixture()
      assert {:ok, %Cliente{}} = Cadastros.delete_cliente(cliente)
      assert_raise Ecto.NoResultsError, fn -> Cadastros.get_cliente!(cliente.id) end
    end

    test "change_cliente/1 returns a cliente changeset" do
      cliente = cliente_fixture()
      assert %Ecto.Changeset{} = Cadastros.change_cliente(cliente)
    end
  end
end
