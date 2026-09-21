<script setup lang="ts">
const pitfalls = [
  {
    num: '01',
    trapTitle: 'Demander du code sans plan',
    trapDesc: 'L’agent commence à modifier des fichiers au hasard, casse des dépendances et invente une architecture.',
    fixTitle: 'Exiger une exploration en lecture seule',
    fixDesc: 'Demander d’abord un plan d’implémentation détaillé et l’approuver explicitement avant toute écriture.',
    mascotEmoji: '🙈',
    scenario: 'L’agent code à l’aveugle',
  },
  {
    num: '02',
    trapTitle: 'Croire le résumé de l’agent',
    trapDesc: 'L’agent affirme que « tout fonctionne et les tests passent » alors qu’il a halluciné le résultat.',
    fixTitle: 'Exécuter le contrôle déterministe',
    fixDesc: 'Ne faire confiance qu’aux sorties réelles des commandes locales (pytest, mypy, linter) dans le terminal.',
    mascotEmoji: '🎩',
    scenario: 'L’illusion du succès textuel',
  },
  {
    num: '03',
    trapTitle: 'Valider un diff massif à l’aveugle',
    trapDesc: 'Approuver 400 lignes modifiées dans 12 fichiers sans avoir relu chaque impact ni chaque cas limite.',
    fixTitle: 'Imposer un diff minimal & auditer Git',
    fixDesc: 'Borner le périmètre aux fichiers indispensables et inspecter rigoureusement chaque ligne ajoutée dans le diff.',
    mascotEmoji: '🌊',
    scenario: 'Submergé par le diff non relu',
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
          <span class="pitfall-num">Piège {{ item.num }}</span>
          <div class="pitfall-mascot">
            <span class="mascot-face">{{ item.mascotEmoji }}</span>
            <small class="mascot-sub">{{ item.scenario }}</small>
          </div>
        </div>

        <!-- Trap Section -->
        <div class="trap-box">
          <div class="box-badge box-badge--danger">❌ Le piège fréquent</div>
          <strong>{{ item.trapTitle }}</strong>
          <p>{{ item.trapDesc }}</p>
        </div>

        <!-- Fix Section -->
        <div class="fix-box">
          <div class="box-badge box-badge--success">✅ Le réflexe d'ingénieur</div>
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
  flex-direction: column;
  gap: 10px;
  margin: 6px auto 0;
  max-width: 1040px;
}

.pitfalls-grid {
  display: grid;
  gap: 12px;
  grid-template-columns: repeat(3, 1fr);
}

.pitfall-card {
  background: var(--surface);
  border: 1px solid var(--line);
  border-radius: 12px;
  box-shadow: 0 2px 8px rgba(15, 23, 42, 0.04);
  display: flex;
  flex-direction: column;
  gap: 7px;
  padding: 10px 12px;
  transition: all 0.15s ease;
}

.pitfall-card:hover {
  border-color: #cbd5e1;
  box-shadow: 0 4px 14px rgba(15, 23, 42, 0.06);
  transform: translateY(-1px);
}

.pitfall-card__header {
  align-items: center;
  border-bottom: 1px solid var(--line);
  display: flex;
  justify-content: space-between;
  padding-bottom: 5px;
}

.pitfall-num {
  color: var(--muted);
  font-family: ui-monospace, SFMono-Regular, monospace;
  font-size: 10.5px;
  font-weight: 800;
  letter-spacing: 0.06em;
  text-transform: uppercase;
}

.pitfall-mascot {
  align-items: center;
  display: flex;
  gap: 5px;
}

.mascot-face {
  font-size: 15px;
}

.mascot-sub {
  color: #64748b;
  font-size: 9.5px;
  font-weight: 600;
}

/* Boxes */
.trap-box,
.fix-box {
  border-radius: 7px;
  display: flex;
  flex-direction: column;
  gap: 3px;
  padding: 6px 9px;
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
  font-size: 9px;
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
  line-height: 1.25;
}

.fix-box strong {
  color: #166534;
  font-size: 11.5px;
  line-height: 1.25;
}

.trap-box p {
  color: #7f1d1d;
  font-size: 10px;
  line-height: 1.32;
  margin: 0;
}

.fix-box p {
  color: #14532d;
  font-size: 10px;
  line-height: 1.32;
  margin: 0;
}

.pitfalls-question-row {
  margin-top: 3px;
}

</style>
