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
    {
        name: "Estado_id",
        label: "Estado",
        type: "select",
        endpoint: "estados",
        display: "Nome",
        required: true,
    },
];

const tableRelations = {
    Estado_id: { endpoint: "estados", field: "Nome" },
};
</script>

<template>
    <main>
        <div class="content">
            <div v-if="showForm">
                <DefaultForm
                    endpoint="cidades"
                    titulo="Cidade"
                    :id="currentId"
                    :fields="formFields"
                />
            </div>

            <div v-else>
                <h1>Listagem Cidades</h1>
                <ContentTable
                    endpoint="cidades"
                    baseRoute="cidades"
                    :relations="tableRelations"
                />
            </div>
        </div>
    </main>
</template>