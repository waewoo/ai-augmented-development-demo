<script setup lang="ts">
import CoverHero from './CoverHero.vue'
</script>

<template>
  <div class="cover-shell">
    <div class="cover-layout">
      <!-- Left Column: Presentation Framing -->
      <div class="cover-content">
        <div class="cover-badge-row">
          <div class="cover-kicker">Développement augmenté · Initiation pratique</div>
        </div>

        <h1 class="cover-title">Premiers pas vers<br>le développement<br>augmenté par l’IA</h1>

        <p class="cover-subtitle">Une méthode concrète pour cadrer, déléguer et vérifier le code généré.</p>

        <div class="cover-pipeline">
          <div class="cover-pill"><b>01</b> Demande & contexte</div>
          <span class="cover-pipeline-arrow">→</span>
          <div class="cover-pill"><b>02</b> Plan & action</div>
          <span class="cover-pipeline-arrow">→</span>
          <div class="cover-pill"><b>03</b> Preuves & décision</div>
        </div>
      </div>

      <!-- Right Column: AI Companion Robot Hero -->
      <div class="cover-hero-wrap">
        <CoverHero />
      </div>
    </div>

    <!-- Discreet Slidev Attribution -->
    <a
      href="https://sli.dev"
      target="_blank"
      rel="noopener noreferrer"
      class="cover-slidev-credit"
      title="Présentation propulsée par Slidev (Developer-first Presentation Tool)"
    >
      <span class="slidev-icon">⚡</span>
      <span class="slidev-label"><strong>Slidev</strong></span>
    </a>
  </div>
</template>

<style scoped>
.cover-shell {
  align-items: center;
  background:
    radial-gradient(circle at 86% 20%, rgba(0, 135, 90, 0.09) 0%, transparent 45%),
    radial-gradient(circle at 14% 82%, rgba(30, 64, 175, 0.06) 0%, transparent 50%),
    linear-gradient(145deg, #ffffff 0%, #f8fafc 50%, #f1f5f9 100%);
  color: #0f172a;
  display: flex;
  height: 100%;
  overflow: hidden;
  padding: 34px 50px;
  position: relative;
  width: 100%;
}

.cover-shell::before {
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

.cover-layout {
  align-items: center;
  display: grid;
  gap: 28px;
  grid-template-columns: 1fr 390px;
  position: relative;
  width: 100%;
  z-index: 1;
}

.cover-content {
  display: flex;
  flex-direction: column;
}

.cover-badge-row {
  align-items: center;
  display: flex;
  gap: 12px;
}

.cover-kicker {
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
  padding: 5px 12px;
  text-transform: uppercase;
  width: fit-content;
}

.cover-kicker::before {
  background: #00875a;
  border-radius: 50%;
  box-shadow: 0 0 8px rgba(0, 135, 90, 0.6);
  content: "";
  height: 7px;
  width: 7px;
}

.cover-title {
  color: #0f172a !important;
  font-size: 32px !important;
  font-weight: 850 !important;
  letter-spacing: -0.03em !important;
  line-height: 1.16 !important;
  margin-top: 14px !important;
}

.cover-subtitle {
  border-left: 3px solid #00875a;
  color: #475569;
  font-size: 15px;
  line-height: 1.4;
  margin-top: 12px;
  padding-left: 14px;
}

.cover-pipeline {
  align-items: center;
  display: flex;
  gap: 8px;
  margin-top: 20px;
}

.cover-pill {
  align-items: center;
  background: #ffffff;
  border: 1px solid #e2e8f0;
  border-radius: 8px;
  box-shadow: 0 2px 8px rgba(15, 23, 42, 0.04);
  color: #0f172a;
  display: flex;
  font-size: 11.5px;
  font-weight: 600;
  gap: 6px;
  padding: 5px 11px;
}

.cover-pill b {
  color: #00875a;
  font-size: 11px;
}

.cover-pipeline-arrow {
  color: #94a3b8;
  font-size: 13px;
  font-weight: 700;
}

.cover-hero-wrap {
  display: flex;
  justify-content: center;
  width: 100%;
}

.cover-slidev-credit {
  align-items: center;
  background: rgba(255, 255, 255, 0.7);
  backdrop-filter: blur(6px);
  border: 1px solid rgba(226, 232, 240, 0.8);
  border-radius: 999px;
  bottom: 14px;
  color: #64748b;
  display: inline-flex;
  font-size: 10.5px;
  gap: 6px;
  opacity: 0.85;
  padding: 3px 10px;
  position: absolute;
  right: 24px;
  text-decoration: none;
  transition: all 0.15s ease;
  z-index: 10;
}

.cover-slidev-credit:hover {
  background: #ffffff;
  border-color: #00875a;
  color: #0f172a;
  opacity: 1;
  transform: translateY(-1px);
}

.cover-slidev-credit strong {
  color: #00875a;
  font-weight: 700;
}

.slidev-icon {
  font-size: 11px;
}
</style>

