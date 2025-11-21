import { createRouter, createWebHistory } from "vue-router";

const router = createRouter({
	history: createWebHistory(import.meta.env.BASE_URL),
	routes: [
		{
			path: "/",
			name: "index",
			component: () => import("../views/index.vue"),
		},
		{
			path: "/atores",
			component: () => import("../views/atores.vue"),
		},
		{
			path: "/atores/novo",
			component: () => import("../views/atores.vue"),
		},
		{
			path: "/atores/alterar/:id",
			component: () => import("../views/atores.vue"),
		},
		{
			path: "/generos",
			component: () => import("../views/generos.vue"),
		},
		{
			path: "/generos/novo",
			component: () => import("../views/generos.vue"),
		},
		{
			path: "/generos/alterar/:id",
			component: () => import("../views/generos.vue"),
		},
		{
			path: "/midias",
			component: () => import("../views/midias.vue"),
		},
		{
			path: "/midias/novo",
			component: () => import("../views/midias.vue"),
		},
		{
			path: "/midias/alterar/:id",
			component: () => import("../views/midias.vue"),
		},
		{
			path: "/classificacoesEtarias",
			component: () => import("../views/classificacoesEtarias.vue"),
		},
		{
			path: "/classificacoesEtarias/novo",
			component: () => import("../views/classificacoesEtarias.vue"),
		},
		{
			path: "/classificacoesEtarias/alterar/:id",
			component: () => import("../views/classificacoesEtarias.vue"),
		},
		{
			path: "/estados",
			component: () => import("../views/estados.vue"),
		},
		{
			path: "/estados/novo",
			component: () => import("../views/estados.vue"),
		},
		{
			path: "/estados/alterar/:id",
			component: () => import("../views/estados.vue"),
		},
		{
			path: "/cidades",
			component: () => import("../views/cidades.vue"),
		},
		{
			path: "/cidades/novo",
			component: () => import("../views/cidades.vue"),
		},
		{
			path: "/cidades/alterar/:id",
			component: () => import("../views/cidades.vue"),
		},
		{
			path: "/clientes",
			component: () => import("../views/clientes.vue"),
		},
		{
			path: "/clientes/novo",
			component: () => import("../views/clientes.vue"),
		},
		{
			path: "/clientes/alterar/:id",
			component: () => import("../views/clientes.vue"),
		},
		{
			path: "/tipos",
			component: () => import("../views/tipos.vue"),
		},
		{
			path: "/tipos/novo",
			component: () => import("../views/tipos.vue"),
		},
		{
			path: "/tipos/alterar/:id",
			component: () => import("../views/tipos.vue"),
		},
		{
			path: "/classificacoesInternas",
			component: () => import("../views/classificacoesInternas.vue"),
		},
		{
			path: "/classificacoesInternas/novo",
			component: () => import("../views/classificacoesInternas.vue"),
		},
		{
			path: "/classificacoesInternas/alterar/:id",
			component: () => import("../views/classificacoesInternas.vue"),
		},
		{
			path: "/exemplares",
			component: () => import("../views/exemplares.vue"),
		},
		{
			path: "/exemplares/novo",
			component: () => import("../views/exemplares.vue"),
		},
		{
			path: "/exemplares/alterar/:id",
			component: () => import("../views/exemplares.vue"),
		},
		{
			path: "/locacoes",
			component: () => import("../views/locacoes.vue"),
		},
		{
			path: "/locacoes/novo",
			component: () => import("../views/locacoes.vue"),
		},
		{
			path: "/locacoes/alterar/:id",
			component: () => import("../views/locacoes.vue"),
		},
	],
});

export default router;
