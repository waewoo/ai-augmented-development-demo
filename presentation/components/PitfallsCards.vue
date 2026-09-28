<script setup lang="ts">
const pitfalls = [
  {
    num: '01',
    scenario: 'L’agent code à l’aveugle',
    trapTitle: 'Demander du code sans plan',
    trapQuote: '« "Vas-y implémente la feature X, je te fais confiance..." »',
    trapDesc: 'L’agent modifie des fichiers au hasard, casse des contrats existants, installe des dépendances superflues et invente une architecture bancale sans recul.',
    fixTitle: 'Exiger l’exploration en lecture seule',
    fixDesc: 'Imposer un plan d’impact daté (PLAN.md) avec analyse des risques et checklist, expressément validé par l’humain avant toute modification de code.',
    badge: 'Cadrage & Périmètre',
    iconType: 'alert',
  },
  {
    num: '02',
    scenario: 'L’illusion du succès textuel',
    trapTitle: 'Croire le résumé textuel',
    trapQuote: '« "J’ai tout testé, 100% de réussite !" (sans lancer de test) »',
    trapDesc: 'Le modèle souffre de sycophancie (tendance à flatter) : il affirme que tout marche alors qu’il n’a exécuté aucune commande ou masque une régression silencieuse.',
    fixTitle: 'Exécuter le contrôle déterministe',
    fixDesc: 'Ne jamais croire le texte du LLM : seule la machine fait foi. Exécuter soi-même la validation locale (make demo-check : pytest, ruff, mypy).',
    badge: 'Contrôle & Vérité',
    iconType: 'terminal',
  },
  {
    num: '03',
    scenario: 'Submergé par le diff massif',
    trapTitle: 'Valider un gros diff à l’aveugle',
    trapQuote: '« "LGTM !" sur 450 lignes validé en 5 secondes »',
    trapDesc: 'Débordé par un volume de modifications massif, le développeur valide sans relire. Régressions subtiles, code mort et failles de sécurité passent en production.',
    fixTitle: 'Diff minimal & audit systématique',
    fixDesc: 'Borner chaque tâche au périmètre le plus court possible. Relire rigoureusement chaque ligne modifiée avec un skill de revue (review-change) et Git.',
    badge: 'Audit & Sécurité',
    iconType: 'git',
  },
]
</script>

<template>
  <div class="pitfalls-wrapper">
    <div class="pitfalls-grid">
      <article
        v-for="item in pitfalls"
        :key="item.num"
        class="pitfall-card"
      >
        <div class="pitfall-card__header">
          <div class="header-left">
            <span class="pitfall-num">Piège {{ item.num }}</span>
            <span class="category-badge">{{ item.badge }}</span>
          </div>
          <div class="header-right">
            <!-- Icon 1: Alert -->
            <svg v-if="item.iconType === 'alert'" class="pitfall-icon pitfall-icon--alert" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
              <path d="m21.73 18-8-14a2 2 0 0 0-3.48 0l-8 14A2 2 0 0 0 4 21h16a2 2 0 0 0 1.73-3Z" />
              <line x1="12" y1="9" x2="12" y2="13" />
              <line x1="12" y1="17" x2="12.01" y2="17" />
            </svg>
            <!-- Icon 2: Terminal -->
            <svg v-else-if="item.iconType === 'terminal'" class="pitfall-icon pitfall-icon--terminal" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
              <polyline points="4 17 10 11 4 5" />
              <line x1="12" y1="19" x2="20" y2="19" />
            </svg>
            <!-- Icon 3: Git -->
            <svg v-else class="pitfall-icon pitfall-icon--git" width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
              <circle cx="12" cy="12" r="4" />
              <line x1="1.05" y1="12" x2="8" y2="12" />
              <line x1="16" y1="12" x2="22.95" y2="12" />
            </svg>
          </div>
        </div>

        <div class="scenario-label">
          <strong>Symptôme :</strong> <span>{{ item.scenario }}</span>
        </div>

        <!-- Trap Section -->
        <div class="trap-box">
          <div class="box-badge box-badge--danger">
            <svg width="9" height="9" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" style="display:inline-block; margin-right:3px; vertical-align:-1px;">
              <line x1="18" y1="6" x2="6" y2="18" />
              <line x1="6" y1="6" x2="18" y2="18" />
            </svg>
            Le piège fréquent
          </div>
          <strong>{{ item.trapTitle }}</strong>
          <em class="trap-quote">{{ item.trapQuote }}</em>
          <p>{{ item.trapDesc }}</p>
        </div>

        <!-- Fix Section -->
        <div class="fix-box">
          <div class="box-badge box-badge--success">
            <svg width="9" height="9" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" style="display:inline-block; margin-right:3px; vertical-align:-1px;">
              <polyline points="20 6 9 17 4 12" />
            </svg>
            Le réflexe d'ingénieur
          </div>
          <strong>{{ item.fixTitle }}</strong>
          <p>{{ item.fixDesc }}</p>
        </div>
      </article>
    </div>

    <div class="pitfalls-question-row">
      <SlideQuestion
        variant="emerald"
        question="Entre un collègue junior et un agent IA, à qui feriez-vous relire un diff de 500 lignes sans tests ?"
        answer="À aucun des deux ! Sans tests automatisés déterministes et audit rigoureux du diff, la confiance aveugle mène droit à l’incident de production."
      />
    </div>
  </div>
</template>

<style scoped>
.pitfalls-wrapper {
  display: flex;
  flex: 1;
  flex-direction: column;
  gap: 6px;
  justify-content: flex-start;
  margin: 2px auto 0;
  max-width: 1040px;
  width: 100%;
}

.pitfalls-grid {
  display: grid;
  gap: 12px;
  grid-template-columns: repeat(3, 1fr);
  min-height: 285px;
}

.pitfall-card {
  background: var(--surface);
  border: 1px solid var(--line);
  border-radius: 10px;
  box-shadow: 0 4px 14px rgba(15, 23, 42, 0.04);
  display: flex;
  flex-direction: column;
  gap: 6px;
  justify-content: flex-start;
  min-height: 285px;
  padding: 10px 13px;
  transition: all 0.15s ease;
}

.pitfall-card:hover {
  border-color: #cbd5e1;
  box-shadow: 0 6px 18px rgba(15, 23, 42, 0.07);
  transform: translateY(-1px);
}

.pitfall-card__header {
  align-items: center;
  border-bottom: 1px solid var(--line);
  display: flex;
  justify-content: space-between;
  padding-bottom: 4px;
}

.header-left {
  align-items: center;
  display: flex;
  gap: 8px;
}

.pitfall-num {
  color: var(--muted);
  font-family: ui-monospace, SFMono-Regular, monospace;
  font-size: 11px;
  font-weight: 800;
  letter-spacing: 0.06em;
  text-transform: uppercase;
}

.category-badge {
  background: #f1f5f9;
  border-radius: 4px;
  color: #475569;
  font-size: 8px;
  font-weight: 750;
  letter-spacing: 0.03em;
  padding: 1.5px 5px;
  text-transform: uppercase;
}

.pitfall-icon {
  display: block;
}

.pitfall-icon--alert {
  color: #ef4444;
}

.pitfall-icon--terminal {
  color: #f59e0b;
}

.pitfall-icon--git {
  color: #6366f1;
}

.scenario-label {
  color: #64748b;
  font-size: 10px;
  line-height: 1.25;
}

.scenario-label strong {
  color: #334155;
}

/* Boxes */
.trap-box,
.fix-box {
  border-radius: 7px;
  display: flex;
  flex-direction: column;
  gap: 3px;
  padding: 6px 10px;
}

.trap-box {
  background: #fff5f5;
  border: 1px solid #fed7d7;
}

.fix-box {
  background: #f0fdf4;
  border: 1px solid #bbf7d0;
}

.box-badge {
  align-self: flex-start;
  border-radius: 4px;
  font-size: 8.5px;
  font-weight: 800;
  letter-spacing: 0.04em;
  padding: 1px 5px;
  text-transform: uppercase;
}

.box-badge--danger {
  background: #fee2e2;
  color: #991b1b;
}

.box-badge--success {
  background: #dcfce7;
  color: #166534;
}

.trap-box strong {
  color: #991b1b;
  font-size: 11.5px;
  line-height: 1.2;
}

.trap-quote {
  color: #b91c1c;
  font-size: 9.5px;
  font-style: italic;
  line-height: 1.25;
}

.fix-box strong {
  color: #166534;
  font-size: 11.5px;
  line-height: 1.2;
}

.trap-box p {
  color: #7f1d1d;
  font-size: 10px;
  line-height: 1.3;
  margin: 0;
}

.fix-box p {
  color: #14532d;
  font-size: 10px;
  line-height: 1.3;
  margin: 0;
}

.pitfalls-question-row {
  margin-top: 8px;
  margin-bottom: 6px;
}
</style>
