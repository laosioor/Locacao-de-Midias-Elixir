<script setup>
import ContentTable from "@/components/ContentTable.vue";
</script>
<template>
	<main>
		<div class="content">
			<h1>Listagem Classificações Etárias</h1>
			<ContentTable
				endpoint="classificacoes_etarias"
				baseRoute="classificacoes_etarias"
			/>
		</div>
	</main>
</template>
