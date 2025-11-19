<script setup>
import { RouterLink, useRoute } from "vue-router";
const view = useRoute()
console.log(view.name)
</script>
<template>
	<aside>
		<h1 v-if="view.name !== 'index'"><RouterLink to="/">Criterion Collection </RouterLink></h1>
		<hr v-if="view.name !== 'index'">
		<h2>Gerenciar</h2>
		<ul>
			<li class="item-sidebar">
				<RouterLink to="/midias">
					<img src="@/assets/dvd.png" /> Midias
				</RouterLink>
			</li>
			<li class="item-sidebar">
				<RouterLink to="/atores">
					<img src="@/assets/ator.png" /> Atores
				</RouterLink>
			</li>
			<li class="item-sidebar">
				<RouterLink to="/generos">
					<img src="@/assets/genero.png" /> Gêneros
				</RouterLink>
			</li>
			<li class="item-sidebar">
				<RouterLink to="/classificacacoes">
					<img src="@/assets/classificacao.png" /> Classificações Etárias
				</RouterLink>
			</li>
		</ul>
	</aside>
</template>
