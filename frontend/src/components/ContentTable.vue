<script setup>
import { RouterLink } from 'vue-router';
import { ref, onMounted } from 'vue';
import axios from 'axios';

const props = defineProps({
    endpoint: { type: String, required: true },
    baseRoute: { type: String, required: true }
});


const API_URL = "http://localhost:4000/api/";
let itemsList = ref([]);

const fetchData = async () => {
    const URL = API_URL + props.endpoint;
    try {

    
    response = await axios.get(URL);
    itemsList.value = reponse.data;
    } catch (err) {
        error.value= "Falha ao buscar dados."
        console.error("Axios Error: ", err)
    }
}

onMounted(fetchData);
</script>

<template>
    <table class="tabela-listagem content">
        <thead>
            <tr>
                <th>Id</th>
                <th>Título</th>
                <th>Duração</th>
                <th>Ano</th>
                <th>Gênero</th>
                <th>Classificação</th>
                <th>Ator Principal</th>
                <th>Ator Coadjuvante</th>
                <th>Alterar</th>
                <th>Excluir</th>
            </tr>
        </thead>
        <tbody>

            <tr>
                <td>${dvd.id}</td>
                <td>${dvd.titulo}</td>
                <td>${dvd.duracaoMinutos} minutos</td>
                <td>${dvd.anoLancamento}</td>
                <td>${dvd.genero.descricao}</td>
                <td>${dvd.classificacaoEtaria.descricao}</td>
                <td>${dvd.atorPrincipal.nome} ${dvd.atorPrincipal.sobrenome}</td>
                <td>${dvd.atorCoadjuvante.nome} ${dvd.atorCoadjuvante.sobrenome}</td>
                <td>
                    <a href="${cp}/${prefixo}Alteracao&id=${dvd.id}" class="btn-alterar-form">Alterar</a>
                </td>
                <td>
                    <a href="${cp}/${prefixo}Exclusao&id=${dvd.id}" class="btn-excluir-form">Excluir</a>
                </td>
            </tr>
        </tbody>
    </table>

</template>