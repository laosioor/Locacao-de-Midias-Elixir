<script setup>
import ContentTable from "@/components/ContentTable.vue";
</script>
<template>
	<main>
		<div class="content">
			<h1>Listagem Atores</h1>
			<ContentTable endpoint="atores" baseRoute="atores" />
		</div>
	</main>
</template>
