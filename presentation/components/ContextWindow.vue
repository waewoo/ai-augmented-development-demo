<template>
  <div class="context-window-wrapper">
    <!-- Top Metaphor Strip -->
    <div class="metaphor-bar">
      <div class="metaphor-badge">
        <svg class="metaphor-icon" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
          <rect x="2" y="3" width="20" height="14" rx="2" ry="2" />
          <line x1="8" y1="21" x2="16" y2="21" />
          <line x1="12" y1="17" x2="12" y2="21" />
        </svg>
        <span>Mémoire de travail (Contexte)</span>
      </div>
      <p class="metaphor-text">
        Le contexte d’un LLM <strong>n’est pas un disque dur</strong> ou une base de données : c’est une <strong>table de travail limitée</strong>.
      </p>
    </div>

    <!-- Main Comparison Grid -->
    <div class="context-grid">
      <!-- Left: The Trap (Over-injection) -->
      <article class="context-card context-card--trap">
        <div class="card-header">
          <div class="card-badge card-badge--trap">
            <span class="badge-icon">⚠️</span>
            <span>Le Piège : La Sur-injection</span>
          </div>
          <span class="card-subtitle">« Tout injecter dans le prompt »</span>
        </div>

        <div class="visual-desk visual-desk--messy">
          <div class="desk-item desk-item--noise">📚 Tout le dépôt (milliers de fichiers)</div>
          <div class="desk-item desk-item--noise">📄 Documentation brute non filtrée</div>
          <div class="desk-item desk-item--noise">💬 Historique de conversation saturé</div>
          <div class="desk-item desk-item--lost">❓ Consignes AGENTS.md noyées au milieu</div>
        </div>

        <div class="effects-list">
          <div class="effect-item effect-item--bad">
            <span class="effect-bullet">❌</span>
            <span><strong>Bruit cognitif (« Lost in the Middle ») :</strong> L’attention du modèle se dilue sur les détails inutiles.</span>
          </div>
          <div class="effect-item effect-item--bad">
            <span class="effect-bullet">❌</span>
            <span><strong>Oubli des garde-fous :</strong> Les règles strictes (lecture seule, 422) sont ignorées.</span>
          </div>
          <div class="effect-item effect-item--bad">
            <span class="effect-bullet">❌</span>
            <span><strong>Hallucinations &amp; Latence :</strong> Réponses floues, coûts multipliés, régressions silencieuses.</span>
          </div>
        </div>
      </article>

      <!-- Right: Best Practice (Surgical Context) -->
      <article class="context-card context-card--clean">
        <div class="card-header">
          <div class="card-badge card-badge--clean">
            <span class="badge-icon">✓</span>
            <span>La Pratique : Le Ciblage Chirurgical</span>
          </div>
          <span class="card-subtitle card-subtitle--clean">Les 4 briques indispensables</span>
        </div>

        <div class="visual-desk visual-desk--clean">
          <div class="desk-grid">
            <div class="desk-slot desk-slot--intent">
              <span class="slot-num">01 · Pourquoi</span>
              <strong>Intention</strong>
              <small>Ticket &amp; critères d'acceptation</small>
            </div>
            <div class="desk-slot desk-slot--anchor">
              <span class="slot-num">02 · Où</span>
              <strong>Ancrage</strong>
              <small>Fichiers cibles &amp; tests existants</small>
            </div>
            <div class="desk-slot desk-slot--rules">
              <span class="slot-num">03 · Comment</span>
              <strong>Règles</strong>
              <small>Cadre pérenne (AGENTS.md)</small>
            </div>
            <div class="desk-slot desk-slot--guard">
              <span class="slot-num">04 · Jusqu'où</span>
              <strong>Procédure</strong>
              <small>Skill outillé (plan-change)</small>
            </div>
          </div>
        </div>

        <div class="effects-list">
          <div class="effect-item effect-item--good">
            <span class="effect-bullet">✓</span>
            <span><strong>Attention 100 % focalisée :</strong> Zéro information parasite, concentration maximale.</span>
          </div>
          <div class="effect-item effect-item--good">
            <span class="effect-bullet">✓</span>
            <span><strong>Respect absolu du cadre :</strong> Lecture seule et tests déterministes appliqués sans faille.</span>
          </div>
          <div class="effect-item effect-item--good">
            <span class="effect-bullet">✓</span>
            <span><strong>Code minimal chirurgical :</strong> Moins de bruit = zéro régression.</span>
          </div>
        </div>
      </article>
    </div>

    <!-- Takeaway Banner & Question -->
    <div class="context-bottom">
      <SlideQuestion
        variant="emerald"
        question="Si on injecte l'intégralité du code et de la doc dans le contexte, le résultat est-il meilleur ?"
        answer="Non ! Le surplus de bruit noie l'attention du modèle (« Lost in the Middle »), dilue les consignes d'AGENTS.md et décuple le risque d'hallucinations."
      />
    </div>
  </div>
</template>

<style scoped>
.context-window-wrapper {
  display: flex;
  flex: 1;
  flex-direction: column;
  gap: 10px;
  margin: 6px auto 0;
  max-width: 1040px;
  width: 100%;
}

/* Top Metaphor Strip */
.metaphor-bar {
  align-items: center;
  background: #ffffff;
  border: 1px solid #e2e8f0;
  border-left: 4px solid var(--violet, #6366f1);
  border-radius: 8px;
  box-shadow: 0 2px 6px rgba(15, 23, 42, 0.03);
  display: flex;
  gap: 12px;
  padding: 6px 14px;
}

.metaphor-badge {
  align-items: center;
  background: #ede9fe;
  border: 1px solid #c4b5fd;
  border-radius: 6px;
  color: #4f46e5;
  display: inline-flex;
  flex-shrink: 0;
  font-size: 9.5px;
  font-weight: 800;
  gap: 5px;
  letter-spacing: 0.04em;
  padding: 2px 8px;
  text-transform: uppercase;
}

.metaphor-icon {
  flex-shrink: 0;
}

.metaphor-text {
  color: #334155;
  font-size: 12px;
  line-height: 1.35;
  margin: 0;
}

.metaphor-text strong {
  color: #0f172a;
}

/* Grid */
.context-grid {
  align-items: stretch;
  display: grid;
  flex: 1;
  gap: 14px;
  grid-template-columns: 1fr 1fr;
}

.context-card {
  background: var(--surface, #ffffff);
  border-radius: 12px;
  box-shadow: 0 4px 14px rgba(15, 23, 42, 0.04);
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  padding: 12px 16px;
  transition: all 0.15s ease;
}

.context-card--trap {
  background: linear-gradient(180deg, #fffafa 0%, #ffffff 100%);
  border: 1px solid #fecaca;
  border-top: 3.5px solid #ef4444;
}

.context-card--clean {
  background: linear-gradient(180deg, #f7fdf9 0%, #ffffff 100%);
  border: 1px solid #bbf7d0;
  border-top: 3.5px solid var(--teal, #00875a);
}

.card-header {
  align-items: center;
  display: flex;
  justify-content: space-between;
  margin-bottom: 8px;
}

.card-badge {
  align-items: center;
  border-radius: 999px;
  display: inline-flex;
  font-size: 9.5px;
  font-weight: 800;
  gap: 4px;
  letter-spacing: 0.04em;
  padding: 2px 8px;
  text-transform: uppercase;
}

.card-badge--trap {
  background: #fee2e2;
  border: 1px solid #fca5a5;
  color: #991b1b;
}

.card-badge--clean {
  background: #dcfce7;
  border: 1px solid #86efac;
  color: #065f46;
}

.card-subtitle {
  color: #64748b;
  font-size: 10px;
  font-weight: 600;
}

.card-subtitle--clean {
  color: #047857;
  font-weight: 700;
}

/* Visual Desks */
.visual-desk {
  border-radius: 8px;
  margin-bottom: 8px;
  padding: 8px;
}

.visual-desk--messy {
  background: #fff1f2;
  border: 1px dashed #fca5a5;
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.desk-item {
  border-radius: 5px;
  font-family: ui-monospace, SFMono-Regular, monospace;
  font-size: 9.5px;
  padding: 3px 7px;
}

.desk-item--noise {
  background: #ffffff;
  border: 1px solid #fecaca;
  color: #991b1b;
}

.desk-item--lost {
  background: #fef2f2;
  border: 1.5px dashed #dc2626;
  color: #b91c1c;
  font-weight: 700;
}

.visual-desk--clean {
  background: #f0fdf4;
  border: 1px solid #bbf7d0;
}

.desk-grid {
  display: grid;
  gap: 6px;
  grid-template-columns: 1fr 1fr;
}

.desk-slot {
  background: #ffffff;
  border: 1px solid #e2e8f0;
  border-radius: 6px;
  display: flex;
  flex-direction: column;
  gap: 1px;
  padding: 4px 6px;
}

.desk-slot--intent { border-left: 3px solid #6366f1; }
.desk-slot--anchor { border-left: 3px solid #00875a; }
.desk-slot--rules { border-left: 3px solid #f59e0b; }
.desk-slot--guard { border-left: 3px solid #8b5cf6; }

.slot-num {
  color: #94a3b8;
  font-size: 7.5px;
  font-weight: 800;
  text-transform: uppercase;
}

.desk-slot strong {
  color: #0f172a;
  font-size: 10px;
  font-weight: 750;
}

.desk-slot small {
  color: #64748b;
  font-size: 8px;
  line-height: 1.2;
}

/* Effects List */
.effects-list {
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.effect-item {
  align-items: flex-start;
  display: flex;
  font-size: 10px;
  gap: 5px;
  line-height: 1.35;
}

.effect-bullet {
  flex-shrink: 0;
  font-size: 9.5px;
  margin-top: 1px;
}

.effect-item--bad {
  color: #475569;
}

.effect-item--bad strong {
  color: #991b1b;
}

.effect-item--good {
  color: #334155;
}

.effect-item--good strong {
  color: #065f46;
}

/* Bottom */
.context-bottom {
  margin-top: 2px;
}
</style>
