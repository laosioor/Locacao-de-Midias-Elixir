<script setup>
import ContentTable from "@/components/ContentTable.vue";
</script>
<template>
	<main>
		<div class="content">
			<h1>Listagem Exemplares</h1>
			<ContentTable
				endpoint="exemplares"
				baseRoute="exemplares"
				:relations="{
					Mídia_id: { endpoint: 'midias', field: 'Título' },
				}"
                :excludeColumns="['midia']"
			/>
		</div>
	</main>
</template>