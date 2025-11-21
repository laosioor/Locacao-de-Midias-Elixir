<script setup>
import { RouterLink } from "vue-router";
import { ref, onMounted, computed } from "vue";
import axios from "axios";
import FkCell from "./FkCell.vue";

const props = defineProps({
	endpoint: { type: String, required: true },
	baseRoute: { type: String, required: true },
	relations: { type: Object, default: () => ({}) },
});

const API_URL = "http://localhost:4000/api/";
let itemsList = ref([]);
const loading = ref(true);
const error = ref(null);

const columns = computed(() => {
	if (!itemsList.value) {
		return [];
	}

	const allKeys = Object.keys(itemsList.value[0]);

	const priorities = [
		"id",
		"titulo",
		"nome",
		"sobrenome",
		"descricao",
		"sigla",
	];

	return allKeys.sort((a, b) => {
		const indexA = priorities.indexOf(a);
		const indexB = priorities.indexOf(b);

		if (indexA !== -1 && indexB !== -1) return indexA - indexB;

		if (indexA !== -1) return -1;

		if (indexB !== -1) return 1;

		return 0;
	});
});

const formatColumns = (columnNames) => {
	return columnNames.replace("_id", "").replace(/_/g, " ");
};

const delItem = async (id) => {
	if (!confirm("Tem certeza que deseja excluir este registro?")) return;
	try {
		const URL = API_URL + props.endpoint + "/" + id;
		await axios.delete(URL);
		itemsList.value.splice(
			itemsList.value.findIndex((i) => i.id === id),
			1,
		);
	} catch (error) {
		console.error("Error deleting form row: " + error);
		alert("Erro ao excluir item.");
	}
};

const fetchData = async () => {
	loading.value = true;
	error.value = null;

	const URL = API_URL + props.endpoint;

	try {
		const response = await axios.get(URL);
		itemsList.value = response.data.data;
	} catch (err) {
		error.value = "Falha ao buscar dados.";
		console.error("Axios Error: ", err);
	} finally {
		loading.value = false;
	}
};

onMounted(fetchData);
</script>

<template>
	<div v-if="error">{{ error }}</div>
	<div v-else-if="loading">Carregando Informações...</div>
	<div v-else class="tabela-listagem">
			<RouterLink class="btn-novo" :to="`/${props.baseRoute}/novo`"
				>Inserir Novo</RouterLink
		</div>
		<table>
			<thead>
				<tr>
					<th v-for="col in columns" :key="col">
						{{ formatColumns(col) }}
					</th>
					<th>Ações</th>
				</tr>
			</thead>
			<tbody>
				<tr v-for="item in itemsList" :key="item.id">
					<td v-for="colKey in columns" :key="colKey">
						<FkCell
							v-if="props.relations[colKey]"
							:id="item[colKey]"
							:endpoint="props.relations[colKey].endpoint"
							:field="props.relations[colKey].field"
						/>
						<span v-else>
							{{ item[colKey] }}
						</span>
					</td>
					<td class="btn-cell">
						<RouterLink
							:to="`/${props.baseRoute}/alterar/${item.id}`"
							class="btn-alterar-form"
						>
							Alterar
						</RouterLink>

						<button @click="delItem(item.id)" class="btn-excluir-form">
							Excluir
						</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</template>
