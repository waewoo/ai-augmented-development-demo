<script setup lang="ts">
const steps = [
  {
    num: '01',
    time: '10 min',
    title: 'Choisir son outil & modèle',
    badge: 'Environnement',
    action: 'Installer le client adapté à vos habitudes :',
    bullets: [
      'Dans l’IDE : Cursor, Kilo Code ou Copilot Edits',
      'En terminal : Claude Code (CLI performante)',
      'Sélectionner un modèle frontière (Claude 3.7, GPT-4o)',
    ],
  },
  {
    num: '02',
    time: '5 min',
    title: 'Créer votre premier AGENTS.md',
    badge: 'Garde-fous',
    action: 'Déposer ces 4 lignes à la racine du repo :',
    snippetHeader: 'AGENTS.md (minimal)',
    snippet: `# Consignes Agent
- Commande test : pytest (ou npm test)
- Typage strict : mypy app
- Règle d’or : Lecture seule par défaut`,
  },
  {
    num: '03',
    time: '15 min',
    title: 'Déléguer une tâche cadrée',
    badge: 'Pratique',
    action: 'Démarrer sans risque avec ce prompt exact :',
    snippetHeader: 'Prompt d’exploration',
    snippet: `Explore ce dépôt en lecture seule.
Résume son architecture, repère les
tests et propose un plan pour...`,
  },
]
</script>

<template>
  <div class="action-plan-wrapper">
    <div class="action-grid">
      <article
        v-for="step in steps"
        :key="step.num"
        class="action-card"
      >
        <div class="action-card__top">
          <span class="step-num">{{ step.num }}</span>
          <span class="step-badge">{{ step.badge }}</span>
          <span class="step-time">{{ step.time }}</span>
        </div>

        <div class="action-card__title">
          <strong>{{ step.title }}</strong>
        </div>

        <p class="action-intro">{{ step.action }}</p>

        <ul v-if="step.bullets" class="action-bullets">
          <li v-for="(b, i) in step.bullets" :key="i">{{ b }}</li>
        </ul>

        <div v-if="step.snippet" class="action-snippet">
          <div class="snippet-header">
            <span>{{ step.snippetHeader }}</span>
            <small>copier</small>
          </div>
          <pre><code>{{ step.snippet }}</code></pre>
        </div>
      </article>
    </div>

    <!-- Takeaway -->
    <div class="action-takeaway">
      <span class="takeaway-pill">À retenir</span>
      <p>
        <strong>Pas besoin d’attendre un grand chantier :</strong> un simple fichier <code>AGENTS.md</code> de 4 lignes
        transforme immédiatement votre outil IA en copilote discipliné.
      </p>
    </div>
  </div>
</template>

<style scoped>
.action-plan-wrapper {
  display: flex;
  flex-direction: column;
  gap: 14px;
  margin-top: 14px;
  width: 100%;
}

.action-grid {
  display: grid;
  flex: 1;
  gap: 16px;
  grid-template-columns: repeat(3, 1fr);
}

.action-card {
  background: var(--surface);
  border: 1px solid var(--line);
  border-radius: 14px;
  box-shadow: 0 4px 14px rgba(15, 23, 42, 0.04);
  display: flex;
  flex-direction: column;
  padding: 16px 18px;
  transition: all 0.15s ease;
}

.action-card:hover {
  border-color: #a5b4fc;
  box-shadow: 0 8px 22px rgba(30, 64, 175, 0.08);
  transform: translateY(-2px);
}

.action-card__top {
  align-items: center;
  display: flex;
  justify-content: space-between;
  margin-bottom: 10px;
}

.step-num {
  color: var(--teal);
  font-size: 16px;
  font-weight: 850;
}

.step-badge {
  background: #f1f5f9;
  border-radius: 999px;
  color: #475569;
  font-size: 10px;
  font-weight: 750;
  letter-spacing: 0.05em;
  padding: 2px 8px;
  text-transform: uppercase;
}

.step-time {
  color: #64748b;
  font-size: 11px;
  font-weight: 700;
}

.action-card__title {
  align-items: center;
  display: flex;
  gap: 8px;
  margin-bottom: 8px;
}

.action-card__title strong {
  color: var(--ink);
  font-size: 14.5px;
  line-height: 1.25;
}

.action-intro {
  color: #475569;
  font-size: 11.5px;
  font-weight: 600;
  margin: 0 0 8px;
}

.action-bullets {
  display: flex;
  flex-direction: column;
  gap: 6px;
  list-style: none;
  margin: 0;
  padding: 0;
}

.action-bullets li {
  color: #1e293b;
  font-size: 11.5px;
  line-height: 1.35;
  padding-left: 14px;
  position: relative;
}

.action-bullets li::before {
  color: var(--teal);
  content: "→";
  font-size: 12px;
  font-weight: 800;
  left: 0;
  position: absolute;
  top: -1px;
}

/* Snippet Block */
.action-snippet {
  background: #0f172a;
  border: 1px solid #1e293b;
  border-radius: 8px;
  display: flex;
  flex-direction: column;
  margin-top: 4px;
  overflow: hidden;
}

.snippet-header {
  align-items: center;
  background: #1e293b;
  color: #94a3b8;
  display: flex;
  font-family: ui-monospace, SFMono-Regular, monospace;
  font-size: 9.5px;
  font-weight: 700;
  justify-content: space-between;
  padding: 3px 8px;
}

.snippet-header small {
  background: #334155;
  border-radius: 3px;
  color: #cbd5e1;
  font-size: 8px;
  padding: 1px 4px;
  text-transform: uppercase;
}

.action-snippet pre {
  margin: 0;
  padding: 6px 8px;
}

.action-snippet code {
  color: #38bdf8;
  display: block;
  font-family: ui-monospace, SFMono-Regular, Menlo, monospace;
  font-size: 9.5px;
  line-height: 1.35;
  white-space: pre;
}

.action-takeaway {
  align-items: center;
  background: #f0fdf4;
  border: 1px solid #bbf7d0;
  border-left: 4px solid var(--teal);
  border-radius: 10px;
  box-shadow: 0 2px 8px rgba(0, 135, 90, 0.05);
  display: flex;
  gap: 12px;
  padding: 8px 16px;
  transition: all 0.15s ease;
}

.action-takeaway:hover {
  border-color: #86efac;
  border-left-color: var(--teal);
  box-shadow: 0 6px 18px rgba(0, 135, 90, 0.08);
  transform: translateY(-1px);
}

.takeaway-pill {
  background: var(--teal);
  border-radius: 999px;
  color: #ffffff;
  font-size: 10.5px;
  font-weight: 800;
  letter-spacing: 0.06em;
  padding: 3px 10px;
  text-transform: uppercase;
  white-space: nowrap;
}

.action-takeaway p {
  color: #1e293b;
  font-size: 12px;
  line-height: 1.35;
  margin: 0;
}

.action-takeaway code {
  background: #ffffff;
  border: 1px solid #bbf7d0;
  border-radius: 4px;
  color: #00875a;
  font-weight: 700;
  padding: 1px 5px;
}
</style>

