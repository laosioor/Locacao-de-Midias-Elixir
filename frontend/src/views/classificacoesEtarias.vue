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
];

const tableRelations = {};
</script>

<template>
    <main>
        <div class="content">
            <div v-if="showForm">
                <DefaultForm
                    endpoint="classificacoes_etarias"
                    titulo="Classificação Etária"
                    :id="currentId"
                    :fields="formFields"
                />
            </div>

            <div v-else>
                <h1>Listagem Classificações Etárias</h1>
                <ContentTable
                    endpoint="classificacoes_etarias"
                    baseRoute="classificacoes_etarias"
                    :relations="tableRelations"
                />
            </div>
        </div>
    </main>
</template>