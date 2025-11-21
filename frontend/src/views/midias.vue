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
	{ name: "titulo", label: "Título", type: "text", required: true },
	{ name: "ano_lancamento", label: "Ano", type: "number", required: true },
	{
		name: "duracao_em_minutos",
		label: "Duração (min)",
		type: "number",
		required: true,
	},
	{ name: "codigo_barras", label: "Cód. Barras", type: "text", required: true },
	{
		name: "genero_id",
		label: "Gênero",
		type: "select",
		endpoint: "generos",
		display: "descricao",
		required: true,
	},
	{
		name: "classificacao_etaria_id",
		label: "Class. Etária",
		type: "select",
		endpoint: "classificacoes_etarias",
		display: "descricao",
		required: true,
	},
	{
		name: "tipo_id",
		label: "Tipo",
		type: "select",
		endpoint: "tipos",
		display: "descricao",
		required: true,
	},
	{
		name: "classificacao_interna_id",
		label: "Class. Interna",
		type: "select",
		endpoint: "classificacoes_internas",
		display: "descricao",
		required: true,
	},
	{
		name: "ator_principal_id",
		label: "Ator Principal",
		type: "select",
		endpoint: "atores",
		display: ["nome", "sobrenome"],
		required: true,
	},
	{
		name: "ator_coadjuvante_id",
		label: "Ator Coadjuvante",
		type: "select",
		endpoint: "atores",
		display: ["nome", "sobrenome"],
		required: true,
	},
];

const tableRelations = {
	genero_id: { endpoint: "generos", field: "descricao" },
	classificacao_etaria_id: {
		endpoint: "classificacoes_etarias",
		field: "descricao",
	},
	tipo_id: { endpoint: "tipos", field: "descricao" },
	classificacao_interna_id: {
		endpoint: "classificacoes_internas",
		field: "descricao",
	},
	ator_principal_id: { endpoint: "atores", field: ["nome", "sobrenome"] },
	ator_coadjuvante_id: { endpoint: "atores", field: ["nome", "sobrenome"] },
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
