<script setup>
import { RouterLink, useRoute } from "vue-router";
import { ref } from "vue";

const view = useRoute();
console.log(view.name);

const mostrarAcervo = ref(false);
const mostrarClientes = ref(false);

const isTipoHovered = ref(false);
</script>

<template>
    <aside>
        <h1 v-if="view.name !== 'index'">
            <RouterLink to="/">Criterion Collection</RouterLink>
        </h1>
        <hr v-if="view.name !== 'index'" />

        <h2 @click="mostrarAcervo = !mostrarAcervo" class="titulo-clicavel">
            Gerenciar Acervo
            <span class="seta" :class="{ 'aberto': mostrarAcervo }">▼</span>
        </h2>
        
        <ul v-show="mostrarAcervo" class="menu-lista">
            <li class="item-sidebar">
                <RouterLink to="/midias">
                    <img src="@/assets/midia.png" alt="Mídias" /> Mídias
                </RouterLink>
            </li>
            <li class="item-sidebar">
                <RouterLink to="/exemplares">
                    <img src="@/assets/exemplar.png" alt="Exemplares" /> Exemplares
                </RouterLink>
            </li>
            <li class="item-sidebar">
                <RouterLink to="/atores">
                    <img src="@/assets/ator.png" alt="Atores" /> Atores
                </RouterLink>
            </li>
            <li class="item-sidebar">
                <RouterLink to="/generos">
                    <img src="@/assets/genero.png" alt="Gêneros" /> Gêneros
                </RouterLink>
            </li>
            <li class="item-sidebar">
                <RouterLink to="/classificacoesEtarias">
                    <img src="@/assets/classificacao_etaria.png" alt="Class. Etária" /> Class.
                    Etárias
                </RouterLink>
            </li>
            <li class="item-sidebar">
                <RouterLink to="/classificacoesInternas">
                    <img src="@/assets/classificacao_interna.png" alt="Class. Interna" /> Class.
                    Internas
                </RouterLink>
            </li>
            <li class="item-sidebar">
                <RouterLink 
                    to="/tipos"
                    @mouseenter="isTipoHovered = !isTipoHovered"
                >
                    <img v-if="!isTipoHovered" src="@/assets/tipo1.png" alt="Tipos" />
                    <img v-else src="@/assets/tipo2.png" alt="Tipos" />
                    Tipos de Mídia
                </RouterLink>
            </li>
        </ul>

        <hr />

        <h2 @click="mostrarClientes = !mostrarClientes" class="titulo-clicavel">
            Gerenciar Clientes
            <span class="seta" :class="{ 'aberto': mostrarClientes }">▼</span>
        </h2>
        
        <ul v-show="mostrarClientes" class="menu-lista">
            <li class="item-sidebar">
                <RouterLink to="/locacoes">
                    <img src="@/assets/locacao.png" alt="Locações" /> Locações
                </RouterLink>
            </li>
            <li class="item-sidebar">
                <RouterLink to="/clientes">
                    <img src="@/assets/cliente.png" alt="Clientes" /> Clientes
                </RouterLink>
            </li>
            <li class="item-sidebar">
                <RouterLink to="/cidades">
                    <img src="@/assets/cidade.png" alt="Cidades" /> Cidades
                </RouterLink>
            </li>
            <li class="item-sidebar">
                <RouterLink to="/estados">
                    <img src="@/assets/estado.png" alt="Estados" /> Estados
                </RouterLink>
            </li>
        </ul>
    </aside>
</template>

<style scoped>
.titulo-clicavel {
    cursor: pointer;
    user-select: none;
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 10px;
    transition: color 0.2s;
}

.titulo-clicavel:hover {
    color: var(--rp-iris);
}

.seta {
    font-size: 0.8rem;
    transition: transform 0.3s ease;
    opacity: 0.7;
}

.seta.aberto {
    transform: rotate(180deg);
}

.menu-lista {
    animation: fadeIn 0.3s ease-in-out;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(-5px); }
    to { opacity: 1; transform: translateY(0); }
}

aside {
    background-color: var(--rp-surface);
    width: 280px;
    flex-shrink: 0;
    padding: 20px;
    font-weight: bold;
    display: flex;
    flex-direction: column;
    height: 100%;
}
</style>