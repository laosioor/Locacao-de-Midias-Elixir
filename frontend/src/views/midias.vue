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
					genero_id: { endpoint: 'generos', field: 'descricao' },
					classificacao_etaria_id: {
						endpoint: 'classificacoes_etarias',
						field: 'descricao',
					},
					tipo_id: { endpoint: 'tipos', field: 'descricao' },
					classificacao_interna_id: {
						endpoint: 'classificacoes_internas',
						field: 'descricao',
					},
					ator_principal_id: {
						endpoint: 'atores',
						field: ['nome', 'sobrenome'],
					},
					ator_coadjuvante_id: {
						endpoint: 'atores',
						field: ['nome', 'sobrenome'],
					},
				}"
			/>
		</div>
	</main>
</template>
