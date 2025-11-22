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
    { name: "Descrição", label: "Descrição", type: "text", required: true },
    { name: "Valor_de_Aluguel", label: "Valor de Aluguel", type: "number", required: true },
];

const tableRelations = {};
</script>

<template>
    <main>
        <div class="content">
            <div v-if="showForm">
                <DefaultForm
                    endpoint="classificacoes_internas"
                    titulo="Classificação Interna"
                    :id="currentId"
                    :fields="formFields"
                />
            </div>

            <div v-else>
                <h1>Listagem Classificações Internas</h1>
                <ContentTable
                    endpoint="classificacoes_internas"
                    baseRoute="classificacoes_internas"
                    :relations="tableRelations"
                />
            </div>
        </div>
    </main>
</template>