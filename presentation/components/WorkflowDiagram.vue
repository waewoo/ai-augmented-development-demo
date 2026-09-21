<script setup lang="ts">
withDefaults(defineProps<{ steps?: string[] }>(), {
  steps: () => ['Comprendre', 'Planifier', 'Approuver', 'Implémenter', 'Vérifier', 'Revoir'],
})
</script>

<template>
  <div class="workflow">
    <template v-for="(step, index) in steps" :key="step">
      <div class="workflow__step" v-click="index + 1">
        <span class="workflow__number">0{{ index + 1 }}</span>
        <strong>{{ step }}</strong>
      </div>
      <span v-if="index < steps.length - 1" class="workflow__arrow" v-click="index + 1">→</span>
    </template>
  </div>
</template>

<style scoped>
.workflow { align-items: center; display: flex; justify-content: center; margin-top: 76px; }
.workflow__step { align-items: center; background: #fff; border: 1px solid var(--line); border-radius: 12px; display: flex; flex-direction: column; gap: 13px; justify-content: center; min-height: 128px; padding: 16px 12px; text-align: center; width: 140px; }
.workflow__number { color: var(--violet); font-size: 16px; font-weight: 700; }
.workflow__step strong { font-size: 20px; }
.workflow__arrow { color: var(--teal); font-size: 28px; padding: 0 10px; }
</style>
