<script setup lang="ts">
import { computed } from 'vue'
import { renderSVG } from 'uqr'

const props = defineProps<{ url: string; label?: string }>()
const svg = computed(() => renderSVG(props.url, { border: 2, ecc: 'M', pixelSize: 5 }))
</script>

<template>
  <a class="resource-qr" :href="url" target="_blank" rel="noreferrer" :aria-label="label || 'Ouvrir les ressources'">
    <span v-html="svg" />
  </a>
</template>

<style scoped>
.resource-qr { align-items: center; background: #fff; border: 1px solid var(--line); border-radius: 16px; box-shadow: var(--shadow-sm); display: inline-flex; justify-content: center; padding: 10px; }
.resource-qr span { display: block; height: 142px; width: 142px; }
.resource-qr :deep(svg) { display: block; height: 100%; width: 100%; }
</style>
