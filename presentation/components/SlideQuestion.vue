<script setup lang="ts">
import { ref } from 'vue'

withDefaults(
  defineProps<{
    tag?: string
    question: string
    answer: string
    variant?: 'indigo' | 'emerald' | 'amber'
  }>(),
  {
    tag: 'Question',
    variant: 'indigo',
  }
)

const isAnswerVisible = ref(false)

function toggle() {
  isAnswerVisible.value = !isAnswerVisible.value
}
</script>

<template>
  <div
    class="slide-question"
    :class="[
      `slide-question--${variant}`,
      { 'slide-question--revealed': isAnswerVisible }
    ]"
    :title="isAnswerVisible ? 'Cliquer pour masquer la réponse' : 'Cliquer pour afficher la réponse'"
    @click.stop="toggle"
  >
    <div class="slide-question__header">
      <span class="slide-question__tag">{{ tag }}</span>
      <strong class="slide-question__text">{{ question }}</strong>
      <button class="slide-question__hint" type="button" @click.stop="toggle">
        {{ isAnswerVisible ? '▲ Masquer' : '▼ Réponse' }}
      </button>
    </div>
    <Transition name="fade-slide">
      <div v-if="isAnswerVisible" class="slide-question__answer">
        <span class="slide-question__answer-badge">Réponse</span>
        <span class="slide-question__answer-text">{{ answer }}</span>
      </div>
    </Transition>
  </div>
</template>

<style scoped>
.slide-question {
  align-items: center;
  border-radius: 12px;
  cursor: pointer;
  display: flex;
  flex-direction: column;
  gap: 4px;
  justify-content: center;
  padding: 6px 14px;
  pointer-events: auto !important;
  position: relative;
  transition: all 0.15s ease;
  user-select: none;
  width: 100%;
  z-index: 25;
}

.slide-question:hover {
  transform: translateY(-1px);
}

/* Variant Indigo (Default) */
.slide-question--indigo {
  background: #eef2ff;
  border: 1px solid #c7d2fe;
  border-left: 5px solid var(--violet);
}

.slide-question--indigo:hover {
  border-color: #818cf8;
  box-shadow: 0 4px 14px rgba(91, 92, 226, 0.08);
}

.slide-question--indigo .slide-question__tag {
  background: var(--violet);
  color: #ffffff;
}

.slide-question--indigo .slide-question__text {
  color: #1e1b4b;
}

.slide-question--indigo .slide-question__hint {
  background: #ffffff;
  border: 1px solid #c7d2fe;
  color: #4338ca;
}

.slide-question--indigo:hover .slide-question__hint {
  background: #4338ca;
  border-color: #4338ca;
  color: #ffffff;
}

.slide-question--indigo .slide-question__answer-badge {
  background: #e0e7ff;
  border: 1px solid #c7d2fe;
  color: #3730a3;
}

.slide-question--indigo .slide-question__answer-text {
  color: #312e81;
}

/* Variant Emerald (Green, matching the takeaways) */
.slide-question--emerald {
  background: #f0fdf4;
  border: 1px solid #bbf7d0;
  border-left: 5px solid var(--teal);
}

.slide-question--emerald:hover {
  border-color: #86efac;
  box-shadow: 0 4px 14px rgba(0, 135, 90, 0.08);
}

.slide-question--emerald .slide-question__tag {
  background: var(--teal);
  color: #ffffff;
}

.slide-question--emerald .slide-question__text {
  color: #064e3b;
}

.slide-question--emerald .slide-question__hint {
  background: #ffffff;
  border: 1px solid #bbf7d0;
  color: var(--teal);
}

.slide-question--emerald:hover .slide-question__hint {
  background: var(--teal);
  border-color: var(--teal);
  color: #ffffff;
}

.slide-question--emerald .slide-question__answer-badge {
  background: #ccfbf1;
  border: 1px solid #99f6e4;
  color: #0f766e;
}

.slide-question--emerald .slide-question__answer-text {
  color: #134e4a;
}

.slide-question__header {
  align-items: center;
  display: flex;
  gap: 10px;
  width: 100%;
}

.slide-question__tag {
  border-radius: 999px;
  font-size: 9px;
  font-weight: 800;
  letter-spacing: 0.08em;
  padding: 2px 8px;
  text-transform: uppercase;
  white-space: nowrap;
}

.slide-question__text {
  font-size: 12px;
  font-weight: 700;
  line-height: 1.25;
}

.slide-question__hint {
  border-radius: 999px;
  cursor: pointer;
  font-size: 9px;
  font-weight: 750;
  letter-spacing: 0.03em;
  margin-left: auto;
  padding: 2px 8px;
  transition: all 0.15s ease;
  white-space: nowrap;
}

.slide-question__answer {
  align-items: center;
  display: flex;
  gap: 8px;
  margin-top: 3px;
  width: 100%;
}

.slide-question__answer-badge {
  border-radius: 4px;
  font-size: 9px;
  font-weight: 800;
  letter-spacing: 0.05em;
  padding: 1px 6px;
  text-transform: uppercase;
  white-space: nowrap;
}

.slide-question__answer-text {
  font-size: 11px;
  font-weight: 550;
  line-height: 1.35;
}

.fade-slide-enter-active,
.fade-slide-leave-active {
  transition: all 0.15s cubic-bezier(0.16, 1, 0.3, 1);
}

.fade-slide-enter-from,
.fade-slide-leave-to {
  opacity: 0;
  transform: translateY(-3px);
}
</style>
