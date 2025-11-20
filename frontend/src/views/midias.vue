<script setup>
import ContentTable from "@/components/ContentTable.vue";
</script>
<template>
	<main>
		<div class="content">
			<h1>Listagem Midias</h1>
			<ContentTable
				endpoint="midias"
				baseRoute="midias"
				:relations="{
					genero: { endpoint: 'generos', field: 'descricao' },
					classificacao_etaria: {
						endpoint: 'classificacoes_etarias',
						field: 'descricao',
					},
					tipo: { endpoint: 'tipos', field: 'descricao' },
					classificacao_interna: {
						endpoint: 'classificacoes_internas',
						field: 'descricao',
					},
					ator_principal: {
						endpoint: 'atores',
						field: ['nome', 'sobrenome'],
					},
					ator_coadjuvante: {
						endpoint: 'atores',
						field: ['nome', 'sobrenome'],
					},
				}"
			/>
		</div>
	</main>
</template>
