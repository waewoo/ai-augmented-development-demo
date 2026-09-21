<script setup lang="ts">
import { computed, ref, useSlots } from 'vue'

defineProps<{
  number: string
  title: string
  minutes?: number
  result: string
  action?: string
  target?: string
  actionHeading?: string
  targetHeading?: string
  resultHeading?: string
  actionTag?: string
  targetTag?: string
  resultTag?: string
  question?: string
  answer?: string
}>()

const slots = useSlots()
const hasSlot = computed(() => !!slots.default)

const isAnswerVisible = ref(false)

function toggleAnswer() {
  isAnswerVisible.value = !isAnswerVisible.value
}
</script>

<template>
  <div class="demo-cue" :class="{ 'demo-cue--with-slot': hasSlot }">
    <header class="demo-cue__header">
      <div class="demo-cue__badge">
        <span class="demo-cue__dot" />
        <b>Démo {{ number.padStart(2, '0') }}</b>
      </div>
      <h2 class="demo-cue__title">{{ title }}</h2>
    </header>

    <div class="demo-cue__grid">
      <div class="demo-card demo-card--action">
        <span class="demo-card__tag">{{ actionTag || '01 · Action' }}</span>
        <strong>{{ actionHeading || 'Dans l\'éditeur' }}</strong>
        <p>{{ action || 'Lancer Kilo Code en mode lecture seule ou assisté' }}</p>
      </div>

      <div class="demo-card demo-card--target">
        <span class="demo-card__tag">{{ targetTag || '02 · Observation' }}</span>
        <strong>{{ targetHeading || 'Ce qu\'on examine' }}</strong>
        <p>{{ target || 'Le comportement de l\'agent et le respect du cadre' }}</p>
      </div>

      <div class="demo-card demo-card--result">
        <span class="demo-card__tag">{{ resultTag || '03 · Résultat' }}</span>
        <strong>{{ resultHeading || 'Ce qu\'on obtient' }}</strong>
        <p>{{ result }}</p>
      </div>
    </div>

    <div
      v-if="question"
      class="demo-cue__footer-row"
    >
      <div
        class="demo-cue__question-card"
        :class="{
          'demo-cue__question-card--clickable': !!answer,
          'demo-cue__question-card--revealed': isAnswerVisible
        }"
        :title="answer ? (isAnswerVisible ? 'Cliquer pour masquer la réponse' : 'Cliquer pour afficher la réponse') : undefined"
        @click="answer ? toggleAnswer() : undefined"
      >
        <div class="demo-cue__q-header">
          <span class="demo-cue__question-tag">Question</span>
          <strong class="demo-cue__question-text">{{ question }}</strong>
          <button v-if="answer" class="demo-cue__reveal-hint" type="button" @click.stop="toggleAnswer">
            {{ isAnswerVisible ? '▲ Masquer' : '▼ Réponse' }}
          </button>
        </div>
        <Transition name="fade-slide">
          <div v-if="answer && isAnswerVisible" class="demo-cue__answer-line">
            <span class="demo-cue__answer-badge">Réponse</span>
            <span class="demo-cue__answer-text">{{ answer }}</span>
          </div>
        </Transition>
      </div>
    </div>
  </div>
</template>

<style scoped>
.demo-cue {
  background: var(--surface);
  border: 1px solid var(--line);
  border-radius: 20px;
  box-shadow: 0 14px 36px rgba(15, 23, 42, 0.06);
  display: flex;
  flex-direction: column;
  gap: 20px;
  margin: 0 auto;
  max-width: 1040px;
  padding: 32px 36px;
  text-align: left;
  width: 100%;
}

.demo-cue__header {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.demo-cue__badge {
  align-items: center;
  background: #eef2ff;
  border: 1px solid #c7d2fe;
  border-radius: 999px;
  color: var(--violet);
  display: inline-flex;
  font-size: 13px;
  font-weight: 800;
  gap: 9px;
  letter-spacing: 0.08em;
  padding: 6px 14px;
  text-transform: uppercase;
  width: fit-content;
}

.demo-cue__dot {
  background: var(--teal);
  border-radius: 50%;
  box-shadow: 0 0 0 4px rgba(13, 148, 136, 0.18);
  height: 8px;
  width: 8px;
}

.demo-cue__time {
  background: #fff;
  border-radius: 999px;
  color: var(--ink);
  font-size: 11px;
  font-weight: 700;
  padding: 2px 8px;
}

.demo-cue__title {
  color: var(--ink);
  font-size: 34px;
  letter-spacing: -0.025em;
  line-height: 1.15;
  margin: 0;
}

.demo-cue__grid {
  display: grid;
  gap: 16px;
  grid-template-columns: repeat(3, 1fr);
}

.demo-card {
  background: var(--slide-bg);
  border: 1px solid var(--line);
  border-radius: 14px;
  display: flex;
  flex-direction: column;
  min-height: 140px;
  padding: 18px 20px;
  transition: all 0.15s ease;
}

.demo-card:hover {
  border-color: #a5b4fc;
  box-shadow: 0 8px 22px rgba(30, 64, 175, 0.08);
  transform: translateY(-2px);
}

.demo-card--action {
  border-top: 4px solid var(--violet);
}

.demo-card--target {
  border-top: 4px solid var(--warning);
}

.demo-card--result {
  background: #f0fdfa;
  border-color: #99f6e4;
  border-top: 4px solid var(--teal);
}

.demo-card--result:hover {
  border-color: #5eead4;
}

.demo-card__tag {
  color: var(--muted);
  font-size: 11px;
  font-weight: 800;
  letter-spacing: 0.08em;
  text-transform: uppercase;
}

.demo-card strong {
  color: var(--ink);
  font-size: 17px;
  margin-top: 6px;
}

.demo-card p {
  color: var(--muted);
  font-size: 14px;
  line-height: 1.35;
  margin: 8px 0 0;
}

.demo-cue__footer-row {
  align-items: stretch;
  display: grid;
  gap: 14px;
  grid-template-columns: 1fr;
}

.demo-cue__question-card {
  background: #eef2ff;
  border: 1px solid #c7d2fe;
  border-left: 5px solid var(--violet);
  border-radius: 12px;
  display: flex;
  flex-direction: column;
  gap: 5px;
  justify-content: center;
  padding: 10px 16px;
  transition: all 0.15s ease;
}

.demo-cue__question-card:hover {
  border-color: #a5b4fc;
  box-shadow: 0 6px 18px rgba(91, 92, 226, 0.08);
  transform: translateY(-1px);
}

.demo-cue__question-card--clickable {
  cursor: pointer;
  user-select: none;
}

.demo-cue__question-card--clickable:hover {
  border-color: #818cf8;
}

.demo-cue__q-header {
  align-items: center;
  display: flex;
  gap: 10px;
  width: 100%;
}

.demo-cue__question-tag {
  background: var(--violet);
  border-radius: 999px;
  color: #ffffff;
  font-size: 9.5px;
  font-weight: 800;
  letter-spacing: 0.08em;
  padding: 2px 8px;
  text-transform: uppercase;
  white-space: nowrap;
}

.demo-cue__question-text {
  color: #1e1b4b;
  font-size: 13px;
  font-weight: 700;
  line-height: 1.25;
}

.demo-cue__reveal-hint {
  background: #ffffff;
  border: 1px solid #c7d2fe;
  border-radius: 999px;
  color: #4338ca;
  font-size: 10px;
  font-weight: 750;
  letter-spacing: 0.03em;
  margin-left: auto;
  padding: 2px 8px;
  transition: all 0.15s ease;
  white-space: nowrap;
}

.demo-cue__question-card:hover .demo-cue__reveal-hint {
  background: #4338ca;
  border-color: #4338ca;
  color: #ffffff;
}

.demo-cue__answer-line {
  align-items: center;
  display: flex;
  gap: 8px;
  margin-top: 1px;
}

/* Fade slide animation for answer reveal */
.fade-slide-enter-active,
.fade-slide-leave-active {
  transition: all 0.2s cubic-bezier(0.16, 1, 0.3, 1);
}

.fade-slide-enter-from,
.fade-slide-leave-to {
  opacity: 0;
  transform: translateY(-4px);
}

.demo-cue__answer-badge {
  background: #e0e7ff;
  border: 1px solid #c7d2fe;
  border-radius: 4px;
  color: #3730a3;
  font-size: 9.5px;
  font-weight: 800;
  letter-spacing: 0.05em;
  padding: 1px 6px;
  text-transform: uppercase;
  white-space: nowrap;
}

.demo-cue__answer-text {
  color: #312e81;
  font-size: 11.5px;
  font-weight: 500;
  line-height: 1.3;
}

/* Compact layout when slot (code banner) is present */
.demo-cue--with-slot {
  gap: 10px;
  padding: 16px 26px;
}

.demo-cue--with-slot .demo-cue__header {
  gap: 4px;
}

.demo-cue--with-slot .demo-cue__badge {
  font-size: 11px;
  padding: 3px 10px;
}

.demo-cue--with-slot .demo-cue__title {
  font-size: 22px;
}

.demo-cue--with-slot .demo-cue__grid {
  gap: 12px;
}

.demo-cue--with-slot .demo-card {
  min-height: 70px;
  padding: 8px 14px;
}

.demo-cue--with-slot .demo-card strong {
  font-size: 12.5px;
}

.demo-cue--with-slot .demo-card p {
  font-size: 11.5px;
  line-height: 1.25;
  margin-top: 3px;
}

.demo-cue--with-slot .demo-cue__footer-row {
  margin-top: 0;
}

.demo-cue--with-slot .demo-cue__question-card {
  padding: 6px 14px;
}

.demo-code-banner {
  background: #f8fafc;
  border: 1px solid #cbd5e1;
  border-radius: 10px;
  overflow: hidden;
  width: 100%;
}

.demo-code-banner :deep(pre),
.demo-code-banner :deep(code) {
  font-size: 11px !important;
  line-height: 1.3 !important;
}

.demo-code-banner :deep(.slidev-code) {
  margin: 0 !important;
  padding: 6px 12px !important;
}

.demo-code-banner :deep(.shiki) {
  margin: 0 !important;
  padding: 6px 12px !important;
}

.code-banner-header {
  align-items: center;
  background: #f1f5f9;
  border-bottom: 1px solid #cbd5e1;
  display: flex;
  justify-content: space-between;
  padding: 5px 12px;
}

.code-banner-badge {
  color: #1e40af;
  font-family: "JetBrains Mono", ui-monospace, monospace;
  font-size: 10.5px;
  font-weight: 700;
}

.code-banner-hint {
  color: #64748b;
  font-size: 10.5px;
  font-style: italic;
}
</style>
