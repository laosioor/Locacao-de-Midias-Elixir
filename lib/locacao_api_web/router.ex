defmodule LocacaoApiWeb.Router do
  use LocacaoApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LocacaoApiWeb do
    pipe_through :api

    resources "/estados", EstadoController, except: [:new, :edit]
    resources "/cidades", CidadeController, except: [:new, :edit]
    resources "/clientes", ClienteController, except: [:new, :edit]
    resources "/atores", AtorController, except: [:new, :edit]
    resources "/generos", GeneroController, except: [:new, :edit]
    resources "/classificacoes_etarias", ClassificacaoEtariaController, except: [:new, :edit]
    resources "/tipos", TipoController, except: [:new, :edit]
    resources "/classificacoes_internas", ClassificacaoInternaController, except: [:new, :edit]
    resources "/midias", MidiaController, except: [:new, :edit]
    resources "/exemplares", ExemplarController, except: [:new, :edit]
    resources "/locacoes", LocacaoController, except: [:new, :edit]

    get "/itens_locacao/:locacao_id/:exemplar_codigo_interno", ItemLocacaoController, :show
    resources "/itens_locacao", ItemLocacaoController, only: [:create, :index]
  end

  # Enable Swoosh mailbox preview in development
  if Application.compile_env(:locacao_api, :dev_routes) do

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
