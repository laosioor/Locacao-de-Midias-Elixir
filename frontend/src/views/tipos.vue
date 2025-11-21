<script setup>
import ContentTable from "@/components/ContentTable.vue";
</script>
<template>
	<main>
		<div class="content">
			<h1>Listagem Tipos de Mídias</h1>
			<ContentTable endpoint="tipos" baseRoute="tipos" />
		</div>
	</main>
</template>
