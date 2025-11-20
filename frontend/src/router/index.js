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
			name: "atores",
			component: () => import("../views/atores.vue"),
		},
		{
			path: "/classificacoesEtarias",
			name: "classificacoesEtarias",
			component: () => import("../views/classificacoesEtarias.vue"),
		},
		{
			path: "/midias",
			name: "midias",
			component: () => import("../views/midias.vue"),
		},
		{
			path: "/generos",
			name: "generos",
			component: () => import("../views/generos.vue"),
		},
	],
});

export default router;
