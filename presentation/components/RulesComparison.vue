<script setup lang="ts">
const left = ['réponse générique', 'conventions oubliées', 'contrôles non précisés']
const right = ['architecture respectée', 'tests explicitement attendus', 'compte-rendu standardisé']
</script>

<template>
  <div class="rules-comparison">
    <div class="rules-comparison__panel rules-comparison__panel--plain">
      <div class="small-label">Sans rules</div>
      <p v-for="item in left" :key="item">{{ item }}</p>
    </div>
    <div class="rules-comparison__arrow">→</div>
    <div class="rules-comparison__panel rules-comparison__panel--guided">
      <div class="small-label">Avec rules</div>
      <p v-for="item in right" :key="item">{{ item }}</p>
    </div>
  </div>
</template>

<style scoped>
.rules-comparison { align-items: center; display: flex; gap: 26px; margin: 58px auto 0; max-width: 1060px; }
.rules-comparison__panel { border-radius: 13px; flex: 1; min-height: 230px; padding: 28px; }
.rules-comparison__panel--plain { background: #fff; border: 1px solid var(--line); }
.rules-comparison__panel--guided { background: #eeefff; border: 1px solid #c9c9fa; }
.rules-comparison__panel p { font-size: 24px; margin-top: 24px; }
.rules-comparison__arrow { color: var(--violet); font-size: 34px; }
</style>
