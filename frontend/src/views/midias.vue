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
	{ name: "Título", label: "Título", type: "text", required: true },
	{ name: "Ano_de_Lançamento", label: "Ano", type: "number", required: true },
	{
		name: "Duração_em_Minutos",
		label: "Duração (min)",
		type: "number",
		required: true,
	},
	{
		name: "Código_de_Barras",
		label: "Cód. Barras",
		type: "text",
		required: true,
	},
	{
		name: "Gênero_id",
		label: "Gênero",
		type: "select",
		endpoint: "generos",
		display: "Descrição",
		required: true,
	},
	{
		name: "Classificação_Etária_id",
		label: "Class. Etária",
		type: "select",
		endpoint: "classificacoes_etarias",
		display: "Descrição",
		required: true,
	},
	{
		name: "Tipo_id",
		label: "Tipo",
		type: "select",
		endpoint: "tipos",
		display: "Descrição",
		required: true,
	},
	{
		name: "Classificação_Interna_id",
		label: "Class. Interna",
		type: "select",
		endpoint: "classificacoes_internas",
		display: "Descrição",
		required: true,
	},
	{
		name: "Ator_Principal_id",
		label: "Ator Principal",
		type: "select",
		endpoint: "atores",
		display: ["Nome", "Sobrenome"],
		required: true,
	},
	{
		name: "Ator_Coadjuvante_id",
		label: "Ator Coadjuvante",
		type: "select",
		endpoint: "atores",
		display: ["Nome", "Sobrenome"],
		required: true,
	},
];

const tableRelations = {
	Gênero_id: { endpoint: "generos", field: "Descrição" },
	Classificação_Etária_id: {
		endpoint: "classificacoes_etarias",
		field: "Descrição",
	},
	Tipo_id: { endpoint: "tipos", field: "Descrição" },
	Classificação_Interna_id: {
		endpoint: "classificacoes_internas",
		field: "Descrição",
	},
	Ator_Principal_id: { endpoint: "atores", field: ["Nome", "Sobrenome"] },
	Ator_Coadjuvante_id: { endpoint: "atores", field: ["Nome", "Sobrenome"] },
};
</script>

<template>
	<main>
		<div class="content">
			<div v-if="showForm">
				<DefaultForm
					endpoint="midias"
					titulo="Mídia"
					:id="currentId"
					:fields="formFields"
				/>
			</div>

			<div v-else>
				<h1>Listagem Mídias</h1>
				<ContentTable
					endpoint="midias"
					baseRoute="midias"
					:relations="tableRelations"
				/>
			</div>
		</div>
	</main>
</template>
