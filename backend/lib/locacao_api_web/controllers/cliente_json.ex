defmodule LocacaoApiWeb.ClienteJSON do
  alias LocacaoApi.Cadastros.Cliente

  @doc """
  Renders a list of cliente.
  """
  def index(%{cliente: cliente}) do
    %{data: for(cliente <- cliente, do: data(cliente))}
  end

  @doc """
  Renders a single cliente.
  """
  def show(%{cliente: cliente}) do
    %{data: data(cliente)}
  end

  def data(%Cliente{} = cliente) do
    %{
      id: cliente.id,
      Nome: cliente.nome,
      Sobrenome: cliente.sobrenome,
      Data_de_Nascimento: cliente.data_nascimento,
      CPF: cliente.cpf,
      Email: cliente.email,
      Logradouro: cliente.logradouro,
      Número: cliente.numero,
      Bairro: cliente.bairro,
      CEP: cliente.cep,
      Cidade_id: cliente.cidade_id
    }
  end
end
