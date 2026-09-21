<script setup lang="ts">
import ClosingHero from './ClosingHero.vue'
</script>

<template>
  <div class="closing-shell">
    <div class="closing-layout">
      <!-- Left Column: Thanks, core takeaways, Q&A invitation -->
      <div class="closing-content">
        <div class="closing-badge-row">
          <div class="closing-kicker">Échange &amp; Questions</div>
        </div>

        <h1 class="closing-title">Merci pour<br>votre attention !</h1>

        <p class="closing-subtitle">
          Le code s'accélère avec l'IA. Notre métier d'ingénieur garantit la rigueur, le contexte et la qualité.
        </p>

        <!-- Invitation aux questions & échange -->
        <div
          class="closing-qa-box"
          v-motion
          :initial="{ opacity: 0, y: 20 }"
          :enter="{ opacity: 1, y: 0, transition: { duration: 500, delay: 200 } }"
        >
          <div class="closing-qa-icon">💬</div>
          <div class="closing-qa-content">
            <strong class="closing-qa-title">Avez-vous des questions ?</strong>
            <p class="closing-qa-text">
              Retours d’expérience, cadrage des règles ou mise en pratique : la parole est à vous !
            </p>
          </div>
        </div>
      </div>

      <!-- Right Column: Celebratory AI Companion Robot -->
      <div
        class="closing-hero-wrap"
        v-motion
        :initial="{ opacity: 0, scale: 0.9 }"
        :enter="{ opacity: 1, scale: 1, transition: { duration: 600, delay: 350 } }"
      >
        <ClosingHero />
      </div>
    </div>
  </div>
</template>

<style scoped>
.closing-shell {
  align-items: center;
  background:
    radial-gradient(circle at 86% 20%, rgba(0, 135, 90, 0.09) 0%, transparent 45%),
    radial-gradient(circle at 14% 82%, rgba(30, 64, 175, 0.06) 0%, transparent 50%),
    linear-gradient(145deg, #ffffff 0%, #f8fafc 50%, #f1f5f9 100%);
  color: #0f172a;
  display: flex;
  height: 100%;
  overflow: hidden;
  padding: 30px 48px;
  position: relative;
  width: 100%;
}

.closing-shell::before {
  background-image: radial-gradient(rgba(0, 135, 90, 0.12) 1.2px, transparent 1.2px);
  background-size: 24px 24px;
  content: "";
  height: 100%;
  left: 0;
  opacity: 0.4;
  pointer-events: none;
  position: absolute;
  top: 0;
  width: 100%;
}

.closing-layout {
  align-items: center;
  display: grid;
  gap: 36px;
  grid-template-columns: 1fr 340px;
  position: relative;
  width: 100%;
  z-index: 1;
}

.closing-content {
  display: flex;
  flex-direction: column;
}

.closing-badge-row {
  align-items: center;
  display: flex;
  gap: 12px;
}

.closing-kicker {
  align-items: center;
  background: #e6f7ef;
  border: 1px solid #bbf7d0;
  border-radius: 999px;
  color: #007343;
  display: inline-flex;
  font-size: 11px;
  font-weight: 800;
  gap: 7px;
  letter-spacing: 0.08em;
  padding: 4px 12px;
  text-transform: uppercase;
  width: fit-content;
}

.closing-title {
  color: #0f172a;
  font-size: 42px;
  font-weight: 850;
  letter-spacing: -0.04em;
  line-height: 1.12;
  margin-top: 14px;
}

.closing-subtitle {
  color: #475569;
  font-size: 15px;
  line-height: 1.45;
  margin-top: 10px;
  max-width: 520px;
}

.closing-qa-box {
  align-items: center;
  background: #ffffff;
  border: 1px solid #e2e8f0;
  border-left: 4px solid var(--teal, #00875a);
  border-radius: 12px;
  box-shadow: 0 4px 16px rgba(15, 23, 42, 0.04);
  display: flex;
  gap: 16px;
  margin-top: 24px;
  max-width: 520px;
  padding: 16px 20px;
}

.closing-qa-icon {
  align-items: center;
  background: #e6f7ef;
  border: 1px solid #bbf7d0;
  border-radius: 12px;
  display: flex;
  font-size: 22px;
  height: 46px;
  justify-content: center;
  min-width: 46px;
  width: 46px;
}

.closing-qa-content {
  display: flex;
  flex-direction: column;
  gap: 3px;
}

.closing-qa-title {
  color: #0f172a;
  font-size: 15px;
  font-weight: 800;
}

.closing-qa-text {
  color: #475569;
  font-size: 13px;
  line-height: 1.4;
  margin: 0;
}

.closing-hero-wrap {
  display: flex;
  justify-content: center;
}
</style>

