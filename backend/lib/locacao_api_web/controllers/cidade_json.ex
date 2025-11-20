defmodule LocacaoApiWeb.CidadeJSON do
  alias LocacaoApi.Cadastros.Cidade

  @doc """
  Renders a list of cidade.
  """
  def index(%{cidade: cidade}) do
    %{data: for(cidade <- cidade, do: data(cidade))}
  end

  @doc """
  Renders a single cidade.
  """
  def show(%{cidade: cidade}) do
    %{data: data(cidade)}
  end

  def data(%Cidade{} = cidade) do
    %{
      id: cidade.id,
      Nome: cidade.nome,
      Estado_id: cidade.estado_id
    }
  end
end
