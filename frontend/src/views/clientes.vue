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
    { name: "Data_de_Nascimento", label: "Data de Nascimento", type: "date", required: true },
    { name: "CPF", label: "CPF", type: "text", required: true },
    { name: "Email", label: "E-mail", type: "text", required: true },
    { name: "Logradouro", label: "Logradouro", type: "text", required: true },
    { name: "Número", label: "Número", type: "text", required: true },
    { name: "Bairro", label: "Bairro", type: "text", required: true },
    { name: "CEP", label: "CEP", type: "text", required: true },
    {
        name: "Cidade_id",
        label: "Cidade",
        type: "select",
        endpoint: "cidades",
        display: "Nome",
        required: true,
    },
];

const tableRelations = {
    Cidade_id: { endpoint: "cidades", field: "Nome" },
};
</script>

<template>
    <main>
        <div class="content">
            <div v-if="showForm">
                <DefaultForm
                    endpoint="clientes"
                    titulo="Cliente"
                    :id="currentId"
                    :fields="formFields"
                />
            </div>

            <div v-else>
                <h1>Listagem Clientes</h1>
                <ContentTable
                    endpoint="clientes"
                    baseRoute="clientes"
                    :relations="tableRelations"
                />
            </div>
        </div>
    </main>
</template>