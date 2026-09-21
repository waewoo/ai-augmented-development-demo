<script setup lang="ts">
const layers = [
  ['05', 'Revue humaine', 'diff · critères · décision'],
  ['04', 'Tests, linter, CI', 'résultats déterministes'],
  ['03', 'Outils et permissions', 'agir dans un périmètre borné'],
  ['02', 'Rules et skills', 'attentes + méthode'],
  ['01', 'Contexte', 'code · demande · contraintes'],
]
</script>

<template>
  <div class="harness">
    <div v-for="(layer, index) in layers" :key="layer[0]" class="harness__layer" v-click="index + 1">
      <span class="harness__number">{{ layer[0] }}</span>
      <strong>{{ layer[1] }}</strong>
      <span>{{ layer[2] }}</span>
    </div>
  </div>
</template>

<style scoped>
.harness { display: flex; flex-direction: column; gap: 5px; margin: 24px auto 0; max-width: 900px; }
.harness__layer { align-items: center; background: #fff; border: 1px solid var(--line); border-left: 9px solid var(--violet); border-radius: 10px; display: grid; gap: 18px; grid-template-columns: 60px 1fr 1.3fr; padding: 10px 22px; }
.harness__layer:nth-child(2) { border-left-color: var(--teal); }
.harness__layer:nth-child(3) { border-left-color: var(--warning); }
.harness__layer:nth-child(4) { border-left-color: #7b61ff; }
.harness__number { color: var(--muted); font-size: 15px; font-weight: 700; }
.harness__layer span:last-child { color: var(--muted); font-size: 18px; }
</style>
