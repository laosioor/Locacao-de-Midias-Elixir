<script setup>
import { computed } from "vue";
import { useRoute } from "vue-router";
import ContentTable from "@/components/ContentTable.vue";
import DefaultForm from "@/components/DefaultForm.vue";

const route = useRoute();

const showForm = computed(() => {
	return route.path.includes("/novo") || route.path.includes("/alterar");
});

const currentId = computed(() => route.params.id);

const formFields = [
	{
		name: "Mídia_id",
		label: "Mídia",
		type: "select",
		endpoint: "midias",
		display: "Título",
		required: true,
	},
	{
		name: "Disponível",
		label: "Disponível",
		type: "checkbox",
		required: false,
	},
];

const tableRelations = {
	Mídia_id: { endpoint: "midias", field: "Título" },
};
</script>

<template>
	<main>
		<div class="content">
			<div v-if="showForm">
				<DefaultForm
					endpoint="exemplares"
					titulo="Exemplar"
					:id="currentId"
					:fields="formFields"
				/>
			</div>

			<div v-else>
				<h1>Listagem Exemplares</h1>
				<ContentTable
					endpoint="exemplares"
					baseRoute="exemplares"
					:relations="tableRelations"
					:excludeColumns="['midia']"
				/>
			</div>
		</div>
	</main>
</template>
