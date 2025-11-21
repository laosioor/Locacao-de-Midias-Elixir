<script setup>
import { ref, onMounted, reactive, watch } from "vue";
import axios from "axios";
import { useRouter } from "vue-router";
const router = useRouter();

const props = defineProps({
	endpoint: { type: String, required: true },
	id: { type: [String, Number], required: true },
	fields: { type: Array, required: true },
	titulo: { type: String, required: true },
});

const API_URL = "http://localhost:4000/api/";
const formData = reactive({});
const selectOpts = reactive({});
const eMessage = ref(null);
const loading = ref(false);

const initForm = () => {
	props.fields.forEach((field) => {
		formData[field.name] = "";
	});
};

const getOptLabel = (option, fieldConfig) => {
	if (Array.isArray(fieldConfig.display)) {
		return fieldConfig.display.map((k) => option[k]).join(" ");
	}
	return option[fieldConfig.display || "descricao"];
};

onMounted(async () => {
	initForm();
	loading.value = true;
	try {
		for (const field of props.fields) {
			if (field.type === "select" && field.endpoint) {
				const res = await axios.get(API_URL + field.endpoint);
				options[field.name] = res.data.data;
			}
		}
	} catch (e) {
		eMessage.value = "Erro ao carregar formulario: " + e.message;
		console.error(e);
	} finally {
		loading.value = false;
	}
});

const salvar = async () => {
	try {
		if (props.id) {
			await axios.put(`${API_URL}${props.endpoint}/${props.id}`, formData);
			alert("Atualizado com sucesso!");
		} else {
			await axios.post(`${API_URL}${props.endpoint}`, formData);
			alert("Criado com sucesso!");
		}
		router.back();
	} catch (e) {
		eMessage("Erro ao salvar:	" + e.message);
		console.error(e);
	}
};
</script>
<template>
	<div class="content-form">
		<h1>{{ props.id ? "Editar" : "Novo" }} {{ titulo }}</h1>

		<div v-if="loading">Carregando...</div>
		<div v-if="errorMessage" class="alerta-erro">{{ errorMessage }}</div>
		<form v-else @submit.prevent="salvar" class="form-cadastro">
			<div v-for="field in props.fields" :key="field.name" class="form-group">
				<label :for="field.name">{{ field.label }}:</label>

				<input
					v-if="['text', 'number', 'date'].includes(field.type)"
					:type="field.type"
					:id="field.name"
					v-model="formData[field.name]"
					:required="field.required"
				/>

				<select
					v-if="field.type === 'select'"
					:id="field.name"
					v-model="formData[field.name]"
					:required="field.required"
				>
					<option value="" disabled>Selecione...</option>
					<option v-for="opt in opts[field.name]" :key="opt.id" :value="opt.id">
						{{ getOptLabel(opt, field) }}
					</option>
				</select>
			</div>

			<div>
				<button class="btn-voltar" @click="router.back()">Voltar</button>
				<button class="btn-salvar" type="submit">Salvar</button>
			</div>
		</form>
	</div>
</template>
