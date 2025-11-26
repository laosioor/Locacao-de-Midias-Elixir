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
        name: "Itens",
        label: "Filmes Alugados",
        type: "list",
        required: true,
        subFields: [
            {
                name: "Exemplar_Código_Interno",
                label: "Filme",
                type: "select",
                endpoint: "exemplares",
                display: (opt) => `${opt.midia?.Título} - (Cód: ${opt.Código_Interno})`,
                
                filter: (opt) => opt.Disponível === true || opt.disponivel === true,
                
                onChange: (option, rowItem) => {
                     const valor = option?.midia?.Classificação_Interna?.Valor;
                     if (valor) rowItem.Valor = valor;
                }
            },
            {
                name: "Valor",
                label: "Preço (R$)",
                type: "number",
				required: true,
				disabled: true
            }
        ]
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
                <ContentTable
                    endpoint="locacoes"
                    baseRoute="locacoes"
                    :relations="tableRelations"
                    deleteLabel="Cancelar"
                    :excludeColumns="['Cliente_id', 'Itens', 'Cancelada']"
                />
            </div>
		</div>
	</main>
</template>