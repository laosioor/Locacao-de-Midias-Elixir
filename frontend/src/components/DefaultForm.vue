<script setup>
import { ref, onMounted, reactive } from "vue";
import axios from "axios";
import { useRouter } from "vue-router";
const router = useRouter();

const props = defineProps({
	endpoint: { type: String, required: true },
	id: { type: [String, Number], required: false },
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
		formData[field.name] = field.type === 'checkbox' ? false : "";
	});
};

const getOptId = (opt) => {
	return opt.id || opt.Código_Interno;
};

const getOptLabel = (option, fieldConfig) => {
	if (typeof fieldConfig.display === 'function') {
		return fieldConfig.display(option);
	}

	const keys = Array.isArray(fieldConfig.display) ? fieldConfig.display : [fieldConfig.display];

	return keys.map(key => {
		return key.split('.').reduce((obj, k) => (obj && obj[k] !== undefined) ? obj[k] : '', option);
	})
		.filter(v => v !== '')
		.join(fieldConfig.separator || " ");
};

const getFilteredOptions = (field) => {
	const options = selectOpts[field.name];
	if (!options) return [];

	if (!field.filter) return options;

	return options.filter(opt => {
		const optId = getOptId(opt);
		const isSelected = formData[field.name] == optId;
		return field.filter(opt) || isSelected;
	});
};

const handleSelectChange = (event, field) => {
	if (field.onChange && selectOpts[field.name]) {
		const selectedVal = formData[field.name];
		const selectedOption = selectOpts[field.name].find(opt => getOptId(opt) == selectedVal);

		if (selectedOption) {
			field.onChange(selectedOption, formData);
		}
	}
};

onMounted(async () => {
	initForm();
	loading.value = true;
	try {
		for (const field of props.fields) {
			if (field.type === "select" && field.endpoint) {
				const res = await axios.get(API_URL + field.endpoint);
				selectOpts[field.name] = res.data.data;
			}
		}

		if (props.id) {
			const url = `${API_URL}${props.endpoint}/${props.id}`;
			const response = await axios.get(url);
			Object.assign(formData, response.data.data || response.data);
		}
	} catch (e) {
		eMessage.value = "Erro: " + (e.response?.data?.message || e.message);
		console.error(e);
	} finally {
		loading.value = false;
	}
});

const salvar = async () => {
	try {
		const payload = { ...formData };
		if (props.id) {
			await axios.put(`${API_URL}${props.endpoint}/${props.id}`, payload);
			alert("Atualizado com sucesso!");
		} else {
			await axios.post(`${API_URL}${props.endpoint}`, payload);
			alert("Criado com sucesso!");
		}
		router.back();
	} catch (e) {
		eMessage.value = "Erro ao salvar: " + (e.response?.data?.message || e.message);
	}
};
</script>

<template>
	<div class="content-form">
		<h1>{{ props.id ? "Editar" : "Nova" }} {{ titulo }}</h1>

		<div v-if="loading">Carregando...</div>
		<div v-if="eMessage" class="alerta-erro">{{ eMessage }}</div>

		<form v-else @submit.prevent="salvar" class="form-cadastro">
			<div v-for="field in props.fields" :key="field.name" class="form-group">
				<label :for="field.name">{{ field.label }}:</label>

				<input v-if="['text', 'number', 'date'].includes(field.type)" :type="field.type" :id="field.name"
					v-model="formData[field.name]" :required="field.required" step="any" />

				<div v-if="field.type === 'checkbox'" class="checkbox-group">
					<input type="checkbox" :id="field.name" v-model="formData[field.name]" />
					<span>Sim</span>
				</div>

				<select v-if="field.type === 'select'" :id="field.name" v-model="formData[field.name]"
					:required="field.required" @change="handleSelectChange($event, field)">
					<option value="" disabled>Selecione...</option>
					<template v-if="selectOpts[field.name]">
						<option v-for="opt in getFilteredOptions(field)" :key="getOptId(opt)" :value="getOptId(opt)">
							{{ getOptLabel(opt, field) }}
						</option>
					</template>
				</select>
			</div>

			<div class="botoes-form">
				<button type="button" class="btn-voltar" @click="router.back()">Voltar</button>
				<button class="btn-salvar" type="submit">Salvar</button>
			</div>
		</form>
	</div>
</template>

<style scoped>
.checkbox-group {
	display: flex;
	align-items: center;
	gap: 10px;
}

.checkbox-group input {
	width: auto;
}

.content-form {
	background-color: var(--rp-surface);
	padding: 40px;
	border-radius: 8px;
	max-width: 600px;
	margin: 0 auto;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	display: block;
	margin-bottom: 8px;
	font-weight: bold;
}

input,
select {
	width: 100%;
	padding: 12px;
	border: 1px solid var(--rp-muted);
	border-radius: 4px;
	background-color: var(--rp-overlay);
	color: var(--rp-text);
}

.botoes-form {
	display: flex;
	justify-content: space-between;
	margin-top: 30px;
}

.alerta-erro {
	color: red;
	font-weight: bold;
	margin-bottom: 15px;
}

.btn-salvar {
	background-color: var(--rp-foam);
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-weight: bold;
}

.btn-voltar {
	background: transparent;
	border: 1px solid var(--rp-muted);
	color: var(--rp-muted);
	padding: 10px 20px;
	border-radius: 5px;
	cursor: pointer;
}
</style>