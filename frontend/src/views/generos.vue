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
                    endpoint="generos"
                    titulo="Gênero"
                    :id="currentId"
                    :fields="formFields"
                />
            </div>

            <div v-else>
                <h1>Listagem Gêneros</h1>
                <ContentTable
                    endpoint="generos"
                    baseRoute="generos"
                    :relations="tableRelations"
                />
            </div>
        </div>
    </main>
</template>