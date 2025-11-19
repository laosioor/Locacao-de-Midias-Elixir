<script setup>
import ContentTable from "@/components/ContentTable.vue";

</script>
<template>
    <main>
        <div class="content">
            <h1>Listagem Midias</h1>
            <ContentTable endpoint="midias" baseRoute="midias"/>

        </div>
    </main>
</template>