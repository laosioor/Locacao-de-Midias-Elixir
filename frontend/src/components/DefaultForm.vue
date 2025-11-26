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
        if (field.type === 'checkbox') formData[field.name] = false;
        else if (field.type === 'list') formData[field.name] = [];
        else formData[field.name] = "";
    });
};

const getOptId = (opt) => {
    return opt.id || opt.Código_Interno || opt.codigo_interno;
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
        if (selectedOption) field.onChange(selectedOption, formData);
    }
};

const addListItem = (fieldName, subFields) => {
    const newItem = {};
    subFields.forEach(sf => newItem[sf.name] = "");
    formData[fieldName].push(newItem);
}

const removeListItem = (fieldName, index) => {
    formData[fieldName].splice(index, 1);
}

const getFilteredOptionsList = (fieldName, subField, currentVal) => {
    const options = selectOpts[subField.endpoint];
    if (!options) return [];
    if (!subField.filter) return options;
    return options.filter(opt => {
        const optId = getOptId(opt);        
        return subField.filter(opt) || (currentVal == optId);
    });
};

const handleListSelectChange = (item, subField) => {
    if (subField.onChange && selectOpts[subField.endpoint]) {
        const selectedVal = item[subField.name];
        const selectedOption = selectOpts[subField.endpoint].find(opt => getOptId(opt) == selectedVal);
        if (selectedOption) subField.onChange(selectedOption, item);
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
            if (field.type === "list") {
                for (const sub of field.subFields) {
                    if (sub.type === "select" && sub.endpoint) {
                         const res = await axios.get(API_URL + sub.endpoint);
                         selectOpts[sub.endpoint] = res.data.data;
                    }
                }
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
        const hasEmptyList = props.fields.some(f => f.type === 'list' && f.required && formData[f.name].length === 0);
        if(hasEmptyList) { alert("Adicione pelo menos um item!"); return; }

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

                <input 
                    v-if="['text', 'number', 'date'].includes(field.type)" 
                    :type="field.type" 
                    :id="field.name"
                    v-model="formData[field.name]" 
                    :required="field.required" 
                    :disabled="field.disabled"
                    step="any" 
                />

                <div v-if="field.type === 'checkbox'" class="checkbox-group">
                    <input 
                        type="checkbox" 
                        :id="field.name" 
                        v-model="formData[field.name]"
                        :disabled="field.disabled" 
                    />
                    <span>Sim</span>
                </div>

                <select 
                    v-if="field.type === 'select'" 
                    :id="field.name" 
                    v-model="formData[field.name]"
                    :required="field.required" 
                    :disabled="field.disabled"
                    @change="handleSelectChange($event, field)"
                >
                    <option value="" disabled>Selecione...</option>
                    <template v-if="selectOpts[field.name]">
                        <option v-for="opt in getFilteredOptions(field)" :key="getOptId(opt)" :value="getOptId(opt)">
                            {{ getOptLabel(opt, field) }}
                        </option>
                    </template>
                </select>

                <div v-if="field.type === 'list'" class="list-container">
                    <div v-for="(item, index) in formData[field.name]" :key="index" class="list-item">
                        <div v-for="sub in field.subFields" :key="sub.name" class="sub-field">
                            <label>{{ sub.label }}</label>
                            
                            <select 
                                v-if="sub.type === 'select'" 
                                v-model="item[sub.name]" 
                                required
                                :disabled="sub.disabled"
                                @change="handleListSelectChange(item, sub)"
                            >
                                <option value="" disabled>Selecione...</option>
                                <template v-if="selectOpts[sub.endpoint]">
                                    <option 
                                        v-for="opt in getFilteredOptionsList(field.name, sub, item[sub.name])" 
                                        :key="getOptId(opt)" 
                                        :value="getOptId(opt)"
                                    >
                                        {{ getOptLabel(opt, sub) }}
                                    </option>
                                </template>
                            </select>

                            <input 
                                v-if="sub.type === 'number'" 
                                type="number" 
                                step="any" 
                                v-model="item[sub.name]" 
                                required
                                :disabled="sub.disabled"
                            >
                        </div>
                        <button type="button" class="btn-remove" @click="removeListItem(field.name, index)">X</button>
                    </div>
                    <button type="button" class="btn-add" @click="addListItem(field.name, field.subFields)">+ Adicionar Item</button>
                </div>
            </div>

            <div class="botoes-form">
                <button type="button" class="btn-voltar" @click="router.back()">Voltar</button>
                <button class="btn-salvar" type="submit">Salvar</button>
            </div>
        </form>
    </div>
</template>

<style scoped>
input:disabled, select:disabled { background-color: rgba(0,0,0,0.1); opacity: 0.7; cursor: not-allowed; border-color: var(--rp-muted);}
.list-container { border: 1px dashed var(--rp-muted); padding: 10px; border-radius: 4px; }
.list-item { display: flex; gap: 10px; align-items: flex-end; margin-bottom: 10px; background: var(--rp-overlay); padding: 10px; border-radius: 4px;}
.sub-field { flex: 1; }
.sub-field label { font-size: 0.8em; margin-bottom: 2px;}
.btn-add { background: var(--rp-foam); color: white; border: none; padding: 5px 10px; border-radius: 4px; cursor: pointer; margin-top: 5px;}
.btn-remove { background: var(--rp-love); color: white; border: none; padding: 5px 10px; border-radius: 4px; cursor: pointer; height: 40px;}
.checkbox-group { display: flex; align-items: center; gap: 10px; }
.checkbox-group input { width: auto; }
.content-form { background-color: var(--rp-surface); padding: 40px; border-radius: 8px; max-width: 800px; margin: 0 auto; }
.form-group { margin-bottom: 20px; }
.form-group label { display: block; margin-bottom: 8px; font-weight: bold; }
input, select { width: 100%; padding: 12px; border: 1px solid var(--rp-muted); border-radius: 4px; background-color: var(--rp-overlay); color: var(--rp-text); }
.botoes-form { display: flex; justify-content: space-between; margin-top: 30px; }
.alerta-erro { color: red; font-weight: bold; margin-bottom: 15px; }
.btn-salvar { background-color: var(--rp-foam); color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer; font-weight: bold; }
.btn-voltar { background: transparent; border: 1px solid var(--rp-muted); color: var(--rp-muted); padding: 10px 20px; border-radius: 5px; cursor: pointer; }
</style>