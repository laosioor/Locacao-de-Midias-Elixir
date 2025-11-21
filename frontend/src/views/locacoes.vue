<script setup>
import ContentTable from "@/components/ContentTable.vue";
</script>
<template>
	<main>
		<div class="content">
			<h1>Listagem Locações</h1>
			<ContentTable
				endpoint="locacoes"
				baseRoute="locacoes"
				:relations="{
					Cliente_id: {
						endpoint: 'cliente',
						field: 'Cliente',
					},
				}"
			/>
		</div>
	</main>
</template>
