<script setup lang="ts">
import { ref, computed, watch, onMounted, onUnmounted } from 'vue'
import { useNav } from '@slidev/client'

const { currentSlideNo, isPresenter } = useNav()

// Durées cibles par slide en secondes
const SLIDE_DURATIONS: Record<number, number> = {
  1: 60,   // Ouverture (1 min)
  2: 120,  // Ce que la session apporte (2 min)
  3: 120,  // Modèles, chats, assistants et agents (2 min)
  4: 120,  // Workflow et décisions humaines (2 min)
  5: 120,  // Contexte utile (2 min)
  6: 180,  // Démo 1 : Comprendre (3 min)
  7: 120,  // Rules (2 min)
  8: 120,  // Skills (2 min)
  9: 240,  // Démo 2 : Planifier (4 min)
  10: 120, // Traçabilité (2 min)
  11: 120, // Contrôles déterministes (2 min)
  12: 300, // Démo 3 : Implémenter (5 min)
  13: 180, // Harnais et sécurité (3 min)
  14: 120, // Trois pièges classiques (2 min)
  15: 120, // Plan d’action pour demain matin (2 min)
  16: 120, // Frameworks avancés (2 min)
  17: 60,  // Ressources & pratique (1 min)
  18: 600, // Clôture & Q&A (10 min)
}

const slideStartTime = ref(Date.now())
const now = ref(Date.now())
const isPaused = ref(false)
const pausedElapsed = ref(0)
let timerInterval: ReturnType<typeof setInterval> | null = null

function resetForSlide() {
  slideStartTime.value = Date.now()
  now.value = Date.now()
  isPaused.value = false
  pausedElapsed.value = 0
}

watch(currentSlideNo, () => {
  resetForSlide()
})

onMounted(() => {
  resetForSlide()
  timerInterval = setInterval(() => {
    if (!isPaused.value) {
      now.value = Date.now()
    }
  }, 250)
})

onUnmounted(() => {
  if (timerInterval) clearInterval(timerInterval)
})

const targetSeconds = computed(() => {
  return SLIDE_DURATIONS[currentSlideNo.value] ?? 120
})

const elapsedSeconds = computed(() => {
  if (isPaused.value) return pausedElapsed.value
  return Math.floor((now.value - slideStartTime.value) / 1000)
})

const remainingSeconds = computed(() => {
  return targetSeconds.value - elapsedSeconds.value
})

const isOvertime = computed(() => remainingSeconds.value < 0)

const statusClass = computed(() => {
  if (isOvertime.value) return 'status-danger'
  if (remainingSeconds.value <= 30 || remainingSeconds.value <= targetSeconds.value * 0.25) {
    return 'status-warning'
  }
  return 'status-ok'
})

const displayTime = computed(() => {
  if (isOvertime.value) {
    const over = Math.abs(remainingSeconds.value)
    const m = Math.floor(over / 60)
    const s = (over % 60).toString().padStart(2, '0')
    return `+${m}:${s}`
  }
  const m = Math.floor(remainingSeconds.value / 60)
  const s = (remainingSeconds.value % 60).toString().padStart(2, '0')
  return `${m}:${s}`
})

const progressPercent = computed(() => {
  if (isOvertime.value) return 100
  return Math.min(100, Math.max(0, (elapsedSeconds.value / targetSeconds.value) * 100))
})

function togglePause() {
  if (isPaused.value) {
    slideStartTime.value = Date.now() - (pausedElapsed.value * 1000)
    isPaused.value = false
  } else {
    pausedElapsed.value = elapsedSeconds.value
    isPaused.value = true
  }
}
</script>

<template>
  <div v-if="isPresenter" class="slide-countdown-widget" :class="[statusClass, { paused: isPaused }]">
    <div class="countdown-track">
      <div class="countdown-bar" :style="{ width: `${progressPercent}%` }" />
    </div>
    <div class="countdown-content">
      <button class="countdown-icon" @click.stop="togglePause" :title="isPaused ? 'Reprendre' : 'Pause'">
        {{ isPaused ? '⏸' : (isOvertime ? '⚠️' : '⏳') }}
      </button>
      <span class="countdown-slide">Slide {{ currentSlideNo }}</span>
      <span class="countdown-sep">·</span>
      <strong class="countdown-timer">{{ displayTime }}</strong>
      <span class="countdown-target">/ {{ Math.floor(targetSeconds / 60) }}m</span>
      <button class="countdown-reset" @click.stop="resetForSlide" title="Réinitialiser pour cette slide">↺</button>
    </div>
  </div>
</template>

<style scoped>
.slide-countdown-widget {
  position: absolute;
  top: 14px;
  right: 18px;
  z-index: 9999;
  background: rgba(15, 23, 42, 0.92);
  backdrop-filter: blur(8px);
  border: 1px solid rgba(255, 255, 255, 0.15);
  border-radius: 999px;
  padding: 5px 12px 6px 12px;
  color: #f8fafc;
  font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace;
  font-size: 12px;
  box-shadow: 0 4px 14px rgba(0, 0, 0, 0.4);
  user-select: none;
  transition: border-color 0.3s, background 0.3s;
  overflow: hidden;
}

.countdown-track {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  height: 2px;
  background: rgba(255, 255, 255, 0.1);
}

.countdown-bar {
  height: 100%;
  transition: width 0.25s linear;
}

/* Status OK (vert / cyan) */
.status-ok {
  border-color: rgba(16, 185, 129, 0.5);
}
.status-ok .countdown-bar {
  background: linear-gradient(90deg, #10b981, #06b6d4);
}
.status-ok .countdown-timer {
  color: #34d399;
}

/* Status Warning (orange) */
.status-warning {
  border-color: rgba(245, 158, 11, 0.7);
  background: rgba(30, 20, 10, 0.95);
}
.status-warning .countdown-bar {
  background: #f59e0b;
}
.status-warning .countdown-timer {
  color: #fbbf24;
}

/* Status Danger (rouge clignotant / dépassement) */
.status-danger {
  border-color: rgba(239, 68, 68, 0.9);
  background: rgba(45, 10, 15, 0.96);
  animation: pulse-danger 1.5s infinite;
}
.status-danger .countdown-bar {
  background: #ef4444;
}
.status-danger .countdown-timer {
  color: #f87171;
  font-weight: 700;
}

@keyframes pulse-danger {
  0%, 100% { box-shadow: 0 0 0 0 rgba(239, 68, 68, 0.5); }
  50% { box-shadow: 0 0 0 6px rgba(239, 68, 68, 0); }
}

.countdown-content {
  display: flex;
  align-items: center;
  gap: 6px;
  line-height: 1.2;
}

.countdown-icon {
  background: transparent;
  border: none;
  cursor: pointer;
  font-size: 13px;
  padding: 0;
  display: flex;
  align-items: center;
}

.countdown-slide {
  color: rgba(255, 255, 255, 0.65);
  font-size: 11px;
  font-weight: 500;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.countdown-sep {
  color: rgba(255, 255, 255, 0.3);
}

.countdown-timer {
  font-size: 13px;
  font-variant-numeric: tabular-nums;
  letter-spacing: 0.5px;
}

.countdown-target {
  color: rgba(255, 255, 255, 0.45);
  font-size: 11px;
}

.countdown-reset {
  background: transparent;
  border: none;
  color: rgba(255, 255, 255, 0.4);
  cursor: pointer;
  font-size: 12px;
  padding: 0 2px;
  margin-left: 2px;
  transition: color 0.2s;
}
.countdown-reset:hover {
  color: #fff;
}
</style>
