defmodule LocacaoApiWeb.ClassificacaoInternaJSON do
  alias LocacaoApi.Midias.ClassificacaoInterna

  @doc """
  Renders a list of classificacao_interna.
  """
  def index(%{classificacao_interna: classificacao_interna}) do
    %{data: for(classificacao_interna <- classificacao_interna, do: data(classificacao_interna))}
  end

  @doc """
  Renders a single classificacao_interna.
  """
  def show(%{classificacao_interna: classificacao_interna}) do
    %{data: data(classificacao_interna)}
  end

  def data(%ClassificacaoInterna{} = classificacao_interna) do
    %{
      id: classificacao_interna.id,
      descricao: classificacao_interna.descricao,
      valor_aluguel: classificacao_interna.valor_aluguel
    }
  end
end
