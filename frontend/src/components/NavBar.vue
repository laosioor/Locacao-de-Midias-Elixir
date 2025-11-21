<script setup>
import { RouterLink, useRoute } from "vue-router";
const view = useRoute();
console.log(view.name);
</script>
<template>
	<aside>
		<h1 v-if="view.name !== 'index'">
			<RouterLink to="/">Criterion Collection </RouterLink>
		</h1>
		<hr v-if="view.name !== 'index'" />

		<h2>Gerenciar Acervo</h2>
		<ul>
			<li class="item-sidebar">
				<RouterLink to="/midias">
					<img src="@/assets/dvd.png" alt="Mídias" /> Mídias
				</RouterLink>
			</li>
			<li class="item-sidebar">
				<RouterLink to="/exemplares">
					<img src="@/assets/dvd.png" alt="Exemplares" /> Exemplares
				</RouterLink>
			</li>
			<li class="item-sidebar">
				<RouterLink to="/atores">
					<img src="@/assets/ator.png" alt="Atores" /> Atores
				</RouterLink>
			</li>
			<li class="item-sidebar">
				<RouterLink to="/generos">
					<img src="@/assets/genero.png" alt="Gêneros" /> Gêneros
				</RouterLink>
			</li>
			<li class="item-sidebar">
				<RouterLink to="/classificacoesEtarias">
					<img src="@/assets/classificacao.png" alt="Class. Etária" /> Class.
					Etárias
				</RouterLink>
			</li>
			<li class="item-sidebar">
				<RouterLink to="/classificacoesInternas">
					<img src="@/assets/classificacao.png" alt="Class. Interna" /> Class.
					Internas
				</RouterLink>
			</li>
			<li class="item-sidebar">
				<RouterLink to="/tipos">
					<img src="@/assets/dvd.png" alt="Tipos" /> Tipos de Mídia
				</RouterLink>
			</li>
		</ul>

		<hr />

		<h2>Gerenciar Clientes</h2>
		<ul>
			<li class="item-sidebar">
				<RouterLink to="/locacoes">
					<img src="@/assets/dvd.png" alt="Locações" /> Locações
				</RouterLink>
			</li>
			<li class="item-sidebar">
				<RouterLink to="/clientes">
					<img src="@/assets/ator.png" alt="Clientes" /> Clientes
				</RouterLink>
			</li>
			<li class="item-sidebar">
				<RouterLink to="/cidades">
					<img src="@/assets/genero.png" alt="Cidades" /> Cidades
				</RouterLink>
			</li>
			<li class="item-sidebar">
				<RouterLink to="/estados">
					<img src="@/assets/genero.png" alt="Estados" /> Estados
				</RouterLink>
			</li>
		</ul>
	</aside>
</template>
