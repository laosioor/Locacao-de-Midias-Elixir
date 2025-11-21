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
	{ name: "Data_de_Início", label: "Data Início", type: "date", required: true },
	{ name: "Data_de_Fim", label: "Data Devolução", type: "date", required: true },
	{
		name: "Cliente_id",
		label: "Cliente",
		type: "select",
		endpoint: "clientes",
		display: ["Nome", "Sobrenome"],
		required: true,
	},
	{
		name: "Exemplar_Código_Interno",
		label: "Filme (Exemplar)",
		type: "select",
		endpoint: "exemplares",
		display: ["midia.Título", "Código_Interno"],
		separator: " - ",
		required: true,
		filter: (opt) => opt.Disponível === true,
		onChange: (option, form) => {
            const valor = option?.midia?.Classificação_Interna?.Valor;
            
            if (valor) {
                form.Valor = valor;
            }
        }
	},
	{
		name: "Valor",
		label: "Valor Total (R$)",
		type: "number",
		required: true,
	},
];

const tableRelations = {
};

</script>

<template>
	<main>
		<div class="content">
			<div v-if="showForm">
				<DefaultForm endpoint="locacoes" titulo="Locação" :id="currentId" :fields="formFields" />
			</div>

			<div v-else>
				<h1>Listagem Locações</h1>
				<ContentTable endpoint="locacoes" baseRoute="locacoes" :relations="tableRelations" deleteLabel="Cancelar" :excludeColumns="['Cliente_id', 'Exemplar_Código_Interno']"/>
			</div>
		</div>
	</main>
</template>