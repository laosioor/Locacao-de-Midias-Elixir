<script setup>
import ContentTable from "@/components/ContentTable.vue";
</script>
<template>
	<main>
		<div class="content">
			<h1>Listagem Cidades</h1>
			<ContentTable
				endpoint="cidades"
				baseRoute="cidades"
				:relations="{
					Estado_id: { endpoint: 'estados', field: 'Nome' },
				}"
			/>
		</div>
	</main>
</template>
