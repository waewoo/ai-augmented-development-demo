<template>
  <div class="vibe-comparison-wrapper">
    <div class="vibe-grid">
      <!-- Left Card: Vibe Coding -->
      <article class="vibe-card vibe-card--explore">
        <div class="card-header">
          <div class="card-badge card-badge--explore">
            <svg class="badge-svg" width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
              <polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2" />
            </svg>
            <span>Vibe Coding</span>
          </div>
          <span class="card-intent">Exploration rapide</span>
        </div>

        <h2 class="card-title">Demander → Générer → Ajuster</h2>
        <p class="card-desc">Une boucle instinctive guidée par le résultat visuel immédiat.</p>

        <!-- Visual Flow Loop -->
        <div class="loop-container loop-container--explore">
          <div class="loop-step">
            <span class="step-num">01</span>
            <span class="step-label">Prompt libre</span>
          </div>
          <span class="loop-arrow">→</span>
          <div class="loop-step">
            <span class="step-num">02</span>
            <span class="step-label">Génération</span>
          </div>
          <span class="loop-arrow">→</span>
          <div class="loop-step">
            <span class="step-num">03</span>
            <span class="step-label">Fix à l'œil</span>
          </div>
        </div>

        <div class="card-section">
          <span class="section-label">Idéal pour :</span>
          <div class="tag-group">
            <span class="tag tag--explore">POC &amp; Démo</span>
            <span class="tag tag--explore">Script jetable</span>
            <span class="tag tag--explore">Prototype UI</span>
            <span class="tag tag--explore">Brainstorming</span>
          </div>
        </div>

        <div class="card-alert card-alert--warning">
          <div class="alert-header">
            <span class="alert-icon">⚠️</span>
            <strong>Insuffisant seul pour livrer</strong>
          </div>
          <p>Absence de périmètre strict, régressions silencieuses, aucune preuve formelle.</p>
        </div>
      </article>

      <!-- Center Escalator Bridge -->
      <div class="vibe-bridge">
        <div class="bridge-line" />
        <div class="bridge-badge">
          <span class="bridge-arrow">→</span>
          <span class="bridge-text">Impact &amp; Criticité</span>
        </div>
        <div class="bridge-line" />
      </div>

      <!-- Right Card: Engineering Workflow -->
      <article class="vibe-card vibe-card--deliver">
        <div class="card-header">
          <div class="card-badge card-badge--deliver">
            <svg class="badge-svg" width="11" height="11" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
              <polyline points="20 6 9 17 4 12" />
            </svg>
            <span>Workflow d’Ingénierie</span>
          </div>
          <span class="card-intent card-intent--deliver">Livraison sereine</span>
        </div>

        <h2 class="card-title">Cadrer → Planifier → Contrôler</h2>
        <p class="card-desc">Une boucle explicite qui rend les décisions et les preuves déterministes.</p>

        <!-- Visual Flow Loop -->
        <div class="loop-container loop-container--deliver">
          <div class="loop-step">
            <span class="step-num">01</span>
            <span class="step-label">Cadrer (Rules)</span>
          </div>
          <span class="loop-arrow loop-arrow--deliver">→</span>
          <div class="loop-step">
            <span class="step-num">02</span>
            <span class="step-label">Plan approuvé</span>
          </div>
          <span class="loop-arrow loop-arrow--deliver">→</span>
          <div class="loop-step">
            <span class="step-num">03</span>
            <span class="step-label">Preuve machine</span>
          </div>
        </div>

        <div class="card-section">
          <span class="section-label">Nécessaire pour :</span>
          <div class="tag-group">
            <span class="tag tag--deliver">Code de production</span>
            <span class="tag tag--deliver">Système critique</span>
            <span class="tag tag--deliver">Travail d'équipe</span>
            <span class="tag tag--deliver">Pérennité</span>
          </div>
        </div>

        <div class="card-alert card-alert--success">
          <div class="alert-header">
            <span class="alert-icon">✓</span>
            <strong>Garanties déterministes</strong>
          </div>
          <p>Diff minimal inspecté, tests automatisés vérifiés (<code>pytest</code>, <code>mypy</code>, <code>ruff</code>).</p>
        </div>
      </article>
    </div>

    <!-- Bottom Takeaway Banner -->
    <div class="vibe-takeaway">
      <span class="takeaway-pill">Principe clé</span>
      <p>
        <strong>Vibe-coder pour explorer et prototyper vite</strong>, mais basculer sur un <strong>workflow cadré</strong> dès que le code impacte l'équipe ou la production.
      </p>
    </div>
  </div>
</template>

<style scoped>
.vibe-comparison-wrapper {
  display: flex;
  flex-direction: column;
  gap: 8px;
  margin-top: 10px;
  width: 100%;
}

.vibe-grid {
  align-items: stretch;
  display: grid;
  gap: 12px;
  grid-template-columns: 1fr 90px 1fr;
  width: 100%;
}

/* Card base */
.vibe-card {
  background: var(--surface, #ffffff);
  border-radius: 12px;
  box-shadow: 0 4px 14px rgba(15, 23, 42, 0.04);
  display: flex;
  flex-direction: column;
  padding: 12px 15px;
  transition: transform 0.15s ease, box-shadow 0.15s ease;
}

.vibe-card:hover {
  box-shadow: 0 6px 20px rgba(15, 23, 42, 0.06);
  transform: translateY(-1px);
}

.vibe-card--explore {
  background: linear-gradient(180deg, #fffdf8 0%, #ffffff 100%);
  border: 1px solid #fde68a;
  border-top: 3px solid #f59e0b;
}

.vibe-card--deliver {
  background: linear-gradient(180deg, #f7fdf9 0%, #ffffff 100%);
  border: 1px solid #a7f3d0;
  border-top: 3px solid var(--teal, #00875a);
}

/* Card Header */
.card-header {
  align-items: center;
  display: flex;
  justify-content: space-between;
  margin-bottom: 6px;
}

.card-badge {
  align-items: center;
  border-radius: 999px;
  display: inline-flex;
  font-size: 9.5px;
  font-weight: 800;
  gap: 4px;
  letter-spacing: 0.05em;
  padding: 2px 8px;
  text-transform: uppercase;
}

.badge-svg {
  display: inline-block;
  flex-shrink: 0;
}

.card-badge--explore {
  background: #fef3c7;
  border: 1px solid #fde68a;
  color: #92400e;
}

.card-badge--deliver {
  background: #dcfce7;
  border: 1px solid #86efac;
  color: #065f46;
}

.card-intent {
  color: #64748b;
  font-size: 10.5px;
  font-weight: 600;
}

.card-intent--deliver {
  color: #047857;
  font-weight: 700;
}

/* Titles */
.card-title {
  color: #0f172a;
  font-size: 15px;
  font-weight: 750;
  line-height: 1.25;
  margin: 0 0 3px;
}

.card-desc {
  color: #64748b;
  font-size: 11px;
  line-height: 1.3;
  margin: 0 0 8px;
}

/* Flow loop container */
.loop-container {
  align-items: center;
  border-radius: 7px;
  display: flex;
  justify-content: space-between;
  margin-bottom: 8px;
  padding: 5px 8px;
}

.loop-container--explore {
  background: #fffbeb;
  border: 1px dashed #fcd34d;
}

.loop-container--deliver {
  background: #f0fdf4;
  border: 1px solid #bbf7d0;
}

.loop-step {
  align-items: center;
  display: flex;
  flex-direction: column;
  gap: 1px;
}

.step-num {
  color: #94a3b8;
  font-family: ui-monospace, monospace;
  font-size: 8px;
  font-weight: 700;
}

.loop-container--deliver .step-num {
  color: #059669;
}

.step-label {
  color: #1e293b;
  font-size: 10px;
  font-weight: 700;
  white-space: nowrap;
}

.loop-arrow {
  color: #d97706;
  font-size: 11px;
  font-weight: 800;
}

.loop-arrow--deliver {
  color: #059669;
}

/* Tags Section */
.card-section {
  display: flex;
  flex-direction: column;
  gap: 4px;
  margin-bottom: 8px;
}

.section-label {
  color: #475569;
  font-size: 10px;
  font-weight: 700;
  text-transform: uppercase;
}

.tag-group {
  display: flex;
  flex-wrap: wrap;
  gap: 4px;
}

.tag {
  border-radius: 4px;
  font-size: 9.5px;
  font-weight: 600;
  padding: 1.5px 6px;
}

.tag--explore {
  background: #f8fafc;
  border: 1px solid #e2e8f0;
  color: #334155;
}

.tag--deliver {
  background: #ecfdf5;
  border: 1px solid #a7f3d0;
  color: #065f46;
}

/* Alert boxes */
.card-alert {
  border-radius: 7px;
  margin-top: auto;
  padding: 6px 9px;
}

.card-alert--warning {
  background: #fff7ed;
  border: 1px solid #fed7aa;
}

.card-alert--success {
  background: #f0fdf4;
  border: 1px solid #bbf7d0;
}

.alert-header {
  align-items: center;
  display: flex;
  gap: 4px;
  margin-bottom: 2px;
}

.alert-header strong {
  font-size: 10.5px;
}

.card-alert--warning .alert-header strong {
  color: #c2410c;
}

.card-alert--success .alert-header strong {
  color: #065f46;
}

.alert-icon {
  font-size: 10px;
}

.card-alert p {
  color: #64748b;
  font-size: 10px;
  line-height: 1.25;
  margin: 0;
}

.card-alert code {
  background: rgba(0, 0, 0, 0.05);
  border-radius: 3px;
  color: #047857;
  font-size: 9px;
  padding: 0 3px;
}

/* Central Bridge */
.vibe-bridge {
  align-items: center;
  display: flex;
  flex-direction: column;
  justify-content: center;
  text-align: center;
}

.bridge-line {
  background: linear-gradient(180deg, transparent, #cbd5e1, transparent);
  flex: 1;
  width: 1px;
}

.bridge-badge {
  align-items: center;
  background: #f1f5f9;
  border: 1px solid #cbd5e1;
  border-radius: 999px;
  display: flex;
  flex-direction: column;
  gap: 3px;
  padding: 8px 5px;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.04);
}

.bridge-arrow {
  align-items: center;
  background: #0284c7;
  border-radius: 50%;
  color: #ffffff;
  display: flex;
  font-size: 11px;
  font-weight: 900;
  height: 20px;
  justify-content: center;
  width: 20px;
}

.bridge-text {
  color: #475569;
  font-size: 8px;
  font-weight: 800;
  letter-spacing: 0.05em;
  line-height: 1.15;
  max-width: 65px;
  text-transform: uppercase;
}

/* Takeaway bottom banner */
.vibe-takeaway {
  align-items: center;
  background: #f8fafc;
  border: 1px solid #e2e8f0;
  border-left: 3px solid var(--teal, #00875a);
  border-radius: 8px;
  display: flex;
  gap: 10px;
  padding: 5px 12px;
}

.takeaway-pill {
  background: var(--teal, #00875a);
  border-radius: 999px;
  color: #ffffff;
  font-size: 9px;
  font-weight: 800;
  letter-spacing: 0.06em;
  padding: 2px 7px;
  text-transform: uppercase;
  white-space: nowrap;
}

.vibe-takeaway p {
  color: #334155;
  font-size: 10.5px;
  line-height: 1.3;
  margin: 0;
}

.vibe-takeaway strong {
  color: #0f172a;
}
</style>
