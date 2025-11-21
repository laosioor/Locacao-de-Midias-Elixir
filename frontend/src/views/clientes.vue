<script setup>
import ContentTable from "@/components/ContentTable.vue";
</script>
<template>
	<main>
		<div class="content">
			<h1>Listagem Clientes</h1>
			<ContentTable
				endpoint="clientes"
				baseRoute="clientes"
				:relations="{
					Cidade_id: { endpoint: 'cidades', field: 'Nome' },
				}"
			/>
		</div>
	</main>
</template>
