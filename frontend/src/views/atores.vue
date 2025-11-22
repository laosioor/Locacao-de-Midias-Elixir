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
    { name: "Nome", label: "Nome", type: "text", required: true },
    { name: "Sobrenome", label: "Sobrenome", type: "text", required: true },
    { name: "Data_de_Estreia", label: "Data de Estreia", type: "date", required: true },
];

const tableRelations = {};
</script>

<template>
    <main>
        <div class="content">
            <div v-if="showForm">
                <DefaultForm
                    endpoint="atores"
                    titulo="Ator"
                    :id="currentId"
                    :fields="formFields"
                />
            </div>

            <div v-else>
                <h1>Listagem Atores</h1>
                <ContentTable
                    endpoint="atores"
                    baseRoute="atores"
                    :relations="tableRelations"
                />
            </div>
        </div>
    </main>
</template>