<script setup>
import { ref, onMounted, watch } from "vue";
import axios from "axios";

const props = defineProps({
	id: { required: true },
	endpoint: { type: String, required: true },
	field: { type: [String, Array], default: "descricao" },
});

const text = ref("Carregando...");
const API_URL = "http://localhost:4000/api/";

const fetchFkData = async () => {
	try {
		const url = API_URL + props.endpoint + "/" + props.id;
		const response = await axios.get(url);
		const data = response.data.data;

		if (Array.isArray(props.field)) {
			text.value = props.field.map((f) => data[f]).join(" ");
		} else {
			text.value = data[props.field];
		}
	} catch (err) {
		console.error("FK not found", err);
		text.value = err;
	}
};
onMounted(fetchFkData);
watch(() => props.id, fetchFkData);
</script>

<template>
	<span>{{ text }}</span>
</template>
