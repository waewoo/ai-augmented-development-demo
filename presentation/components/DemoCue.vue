<script setup lang="ts">
defineProps<{
  number: string
  title: string
  minutes: number
  result: string
}>()
</script>

<template>
  <div class="demo-cue">
    <div class="demo-cue__label">LIVE DEMO · {{ minutes }} min max</div>
    <h2>Démonstration {{ number }} — {{ title }}</h2>
    <p><strong>Résultat attendu :</strong> {{ result }}</p>
  </div>
</template>

<style scoped>
.demo-cue { border-left: 7px solid var(--violet); max-width: 920px; padding: 18px 28px; text-align: left; }
.demo-cue__label { color: var(--violet); font-size: 15px; font-weight: 700; letter-spacing: 0.1em; margin-bottom: 22px; }
.demo-cue p { color: var(--muted); font-size: 21px; margin-top: 22px; }
</style>
