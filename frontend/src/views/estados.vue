<script setup>
import ContentTable from "@/components/ContentTable.vue";
</script>
<template>
	<main>
		<div class="content">
			<h1>Listagem Estados</h1>
			<ContentTable endpoint="estados" baseRoute="estados" />
		</div>
	</main>
</template>
