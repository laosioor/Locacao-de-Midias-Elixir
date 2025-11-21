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
    { name: "Cancelada", label: "Cancelada?", type: "checkbox", required: false },
    {
        name: "Cliente_id",
        label: "Cliente",
        type: "select",
        endpoint: "clientes", 
        display: ["nome", "sobrenome"], 
        required: true,
    },
    {
        name: "Exemplar_Código_Interno",
        label: "Filme (Exemplar)",
        type: "select",
        endpoint: "exemplares", 
        
        relation_endpoint: "midias",
        
        relation_key: "Mídia_id", 
        
        relation_aux_name: "midia_full",
        
        display: ["midia_full.Título", "Código_Interno"], 
        
        required: true,
    },,
    {
        name: "Valor",
        label: "Valor Total (R$)",
        type: "number",
        required: true,
    },
];

const tableRelations = {
    cliente_id: { endpoint: "clientes", field: ["nome", "sobrenome"] },
};
</script>

<template>
    <main>
        <div class="content">
            <div v-if="showForm">
                <DefaultForm
                    endpoint="locacoes"
                    titulo="Locação"
                    :id="currentId"
                    :fields="formFields"
                />
            </div>

            <div v-else>
                <h1>Listagem Locações</h1>
                <ContentTable
                    endpoint="locacoes"
                    baseRoute="locacoes"
                    :relations="tableRelations"
                />
            </div>
        </div>
    </main>
</template>