<script setup lang="ts">
defineProps<{
  page: string
  minutes?: number
  progress: number
}>()
</script>

<template>
  <footer class="slide-footer" aria-label="Progression de la présentation">
    <div class="slide-footer__track"><span :style="{ width: `${progress}%` }" /></div>
    <div class="slide-footer__meta">
      <strong>{{ page }}</strong>
    </div>
  </footer>
</template>

<style scoped>
.slide-footer {
  align-items: center;
  bottom: 12px;
  display: grid;
  gap: 16px;
  grid-template-columns: 1fr auto;
  left: 48px;
  position: absolute;
  right: 48px;
  z-index: 5;
}

.slide-footer__track {
  background: var(--line);
  border-radius: 999px;
  height: 2px;
  overflow: hidden;
}

.slide-footer__track span {
  background: linear-gradient(90deg, var(--violet), var(--teal));
  border-radius: inherit;
  display: block;
  height: 100%;
  min-width: 14px;
}

.slide-footer__meta {
  align-items: center;
  background: var(--surface);
  border: 1px solid var(--line);
  border-radius: 999px;
  color: var(--muted);
  display: flex;
  font-size: 11px;
  justify-content: center;
  min-width: 28px;
  padding: 3px 10px;
  white-space: nowrap;
}

.slide-footer__meta strong {
  color: var(--ink);
  font-size: 11px;
  font-variant-numeric: tabular-nums;
}
</style>
