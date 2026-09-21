<template>
  <div class="vibe-comparison">
    <article class="vibe-path vibe-path--explore">
      <div class="vibe-path__eyebrow"><span>⚡</span> Vibe coding</div>
      <h2>Demander → générer → ajuster</h2>
      <p>Une boucle rapide, guidée par l’intuition et le résultat visible.</p>
      <div class="vibe-path__use">
        <strong>Bien adapté à</strong>
        <span>Script jetable · POC · exploration</span>
      </div>
      <div class="vibe-path__risk">
        <strong>Insuffisant seul pour livrer</strong>
        <span>Pas de périmètre explicite, pas de preuve, pas de revue.</span>
      </div>
    </article>

    <div class="vibe-escalation" aria-hidden="true">
      <span>→</span>
      <strong>À mesure que l’impact augmente</strong>
    </div>

    <article class="vibe-path vibe-path--deliver">
      <div class="vibe-path__eyebrow"><span>✓</span> Workflow d’ingénierie</div>
      <h2>Cadrer → planifier → contrôler</h2>
      <p>Une boucle explicite, qui rend les décisions et les preuves visibles.</p>
      <div class="vibe-path__use">
        <strong>Nécessaire pour</strong>
        <span>Changement durable · système critique · équipe</span>
      </div>
      <div class="vibe-path__proof">
        <span>Critères</span><span>Plan</span><span>Tests</span><span>Diff</span><span>Revue humaine</span>
      </div>
    </article>
  </div>
</template>

<style scoped>
.vibe-comparison {
  align-items: stretch;
  display: grid;
  gap: 16px;
  grid-template-columns: 1fr 128px 1fr;
  margin: 22px auto 0;
  max-width: 1020px;
}

.vibe-path {
  border: 1px solid var(--line);
  border-radius: 18px;
  box-shadow: 0 8px 24px rgba(15, 23, 42, 0.05);
  padding: 18px 20px;
}

.vibe-path--explore { background: #fffbeb; border-color: #fde68a; }
.vibe-path--deliver { background: #f0fdf4; border-color: #99f6e4; }

.vibe-path__eyebrow {
  color: var(--muted);
  font-size: 11px;
  font-weight: 800;
  letter-spacing: 0.08em;
  text-transform: uppercase;
}

.vibe-path__eyebrow span { color: var(--teal); font-size: 15px; margin-right: 4px; }
.vibe-path--explore .vibe-path__eyebrow span { color: #d97706; }

.vibe-path h2 { color: var(--ink); font-size: 20px; line-height: 1.15; margin: 11px 0 7px; }
.vibe-path > p { color: var(--muted); font-size: 12.5px; line-height: 1.35; margin: 0; min-height: 34px; }

.vibe-path__use, .vibe-path__risk {
  display: grid;
  gap: 5px;
  margin-top: 14px;
}

.vibe-path__use strong, .vibe-path__risk strong {
  color: var(--ink);
  font-size: 12px;
}

.vibe-path__use span, .vibe-path__risk span { color: var(--muted); font-size: 11.5px; line-height: 1.3; }
.vibe-path__risk { border-top: 1px solid #fcd34d; margin-top: 11px; padding-top: 10px; }
.vibe-path__risk strong { color: #b45309; }

.vibe-escalation {
  align-items: center;
  display: flex;
  flex-direction: column;
  justify-content: center;
  text-align: center;
}

.vibe-escalation > span {
  align-items: center;
  background: #eff6ff;
  border: 1px solid #bfdbfe;
  border-radius: 50%;
  color: #1d4ed8;
  display: flex;
  font-size: 28px;
  height: 48px;
  justify-content: center;
  width: 48px;
}

.vibe-escalation strong { color: #1e40af; font-size: 10.5px; margin-top: 8px; text-transform: uppercase; }

.vibe-path__proof { display: flex; flex-wrap: wrap; gap: 5px; margin-top: 14px; }
.vibe-path__proof span { background: #ffffff; border: 1px solid #a7f3d0; border-radius: 999px; color: #047857; font-size: 10.5px; font-weight: 750; padding: 3px 8px; }
</style>
