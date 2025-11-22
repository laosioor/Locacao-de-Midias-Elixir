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
    { name: "Sigla", label: "Sigla", type: "text", required: true },
];

const tableRelations = {};
</script>

<template>
    <main>
        <div class="content">
            <div v-if="showForm">
                <DefaultForm
                    endpoint="estados"
                    titulo="Estado"
                    :id="currentId"
                    :fields="formFields"
                />
            </div>

            <div v-else>
                <h1>Listagem Estados</h1>
                <ContentTable
                    endpoint="estados"
                    baseRoute="estados"
                    :relations="tableRelations"
                />
            </div>
        </div>
    </main>
</template>