<script setup>
import { RouterLink, RouterView } from "vue-router";
import NavBar from "@/components/NavBar.vue";
</script>

<template>
	<main>
		<NavBar />

		<div class="content">
			<RouterView />
		</div>
	</main>
</template>

<style></style>
