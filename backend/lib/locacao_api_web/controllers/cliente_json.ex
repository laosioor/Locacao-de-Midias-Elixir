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
      nome: cliente.nome,
      sobrenome: cliente.sobrenome,
      data_nascimento: cliente.data_nascimento,
      cpf: cliente.cpf,
      email: cliente.email,
      logradouro: cliente.logradouro,
      numero: cliente.numero,
      bairro: cliente.bairro,
      cep: cliente.cep,
      cidade_id: cliente.cidade_id
    }
  end
end
