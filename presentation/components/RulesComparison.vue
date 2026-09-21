<script setup lang="ts">
const promptIssues = [
  'Risque de casser l’existant (rendre le filtre obligatoire)',
  'Gestion d’erreur anarchique (renvoyer une 500 ou du texte brut)',
  'Ajout de dépendances externes superflues',
  'Aucune commande de validation ni tests imposés',
]
</script>

<template>
  <div class="rules-comparison">
    <!-- Left panel: prompt sans rules -->
    <div class="rules-panel rules-panel--left">
      <div class="panel-header">
        <span class="panel-badge panel-badge--left">Sans rules (Demande brute isolée)</span>
      </div>
      <div class="prompt-box">
        <div class="prompt-box__label">
          <svg class="prompt-box__icon" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z" />
          </svg>
          <span>Prompt utilisateur</span>
        </div>
        <p class="prompt-box__content">« Ajoute un filtre status sur l’API des tâches. »</p>
      </div>
      <div class="issues-list">
        <div v-for="(text, idx) in promptIssues" :key="idx" class="issue-item">
          <svg class="issue-icon" width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="#f59e0b" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="m21.73 18-8-14a2 2 0 0 0-3.48 0l-8 14A2 2 0 0 0 4 21h16a2 2 0 0 0 1.73-3Z" />
            <line x1="12" y1="9" x2="12" y2="13" />
            <line x1="12" y1="17" x2="12.01" y2="17" />
          </svg>
          <span class="issue-text">{{ text }}</span>
        </div>
      </div>
    </div>

    <!-- Center arrow -->
    <div class="rules-arrow">
      <span>→</span>
      <small>cadré par</small>
    </div>

    <!-- Right panel: generalist project rules in AGENTS.md -->
    <div class="rules-panel rules-panel--right">
      <div class="editor-window">
        <div class="editor-topbar">
          <div class="editor-dots">
            <span class="dot dot--red" />
            <span class="dot dot--yellow" />
            <span class="dot dot--green" />
          </div>
          <div class="editor-tabs">
            <div class="editor-tab editor-tab--active">
              <svg class="tab-icon" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z" />
                <polyline points="14 2 14 8 20 8" />
              </svg>
              <span class="tab-name">AGENTS.md</span>
            </div>
            <div class="editor-tab editor-tab--secondary">
              <svg class="tab-icon" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M22 19a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h5l2 3h9a2 2 0 0 1 2 2z" />
              </svg>
              <span class="tab-name">.agents/rules/</span>
            </div>
          </div>
          <span class="editor-lang">markdown</span>
        </div>

        <div class="editor-body">
          <div class="code-line code-line--heading">
            <span class="md-hash">##</span> <span>Règles &amp; conventions</span>
          </div>

          <div class="code-line">
            <div class="code-line-text">
              <span class="md-bullet">-</span>
              <span><strong>Lecture seule :</strong> aucun code modifié sans plan validé</span>
            </div>
            <span class="code-tag code-tag--guard">Garde-fou</span>
          </div>

          <div class="code-line">
            <div class="code-line-text">
              <span class="md-bullet">-</span>
              <span><strong>Périmètre :</strong> préserver les comportements existants</span>
            </div>
            <span class="code-tag code-tag--safety">Non-régression</span>
          </div>

          <div class="code-line">
            <div class="code-line-text">
              <span class="md-bullet">-</span>
              <span><strong>Dépendances :</strong> aucune nouvelle bibliothèque externe</span>
            </div>
            <span class="code-tag code-tag--deps">Périmètre</span>
          </div>

          <div class="code-line">
            <div class="code-line-text">
              <span class="md-bullet">-</span>
              <span><strong>Erreurs :</strong> rejeter les entrées invalides en <code>HTTP 422</code></span>
            </div>
            <span class="code-tag code-tag--error">Code 422</span>
          </div>

          <div class="code-line code-line--blank" />

          <div class="code-line code-line--heading">
            <span class="md-hash">##</span> <span>Validation déterministe</span>
          </div>

          <div class="code-line">
            <div class="code-line-text">
              <span class="md-bullet">-</span>
              <span><strong>Preuve machine :</strong> toujours exécuter <code>make demo-check</code></span>
            </div>
            <span class="code-tag code-tag--check">Preuve machine</span>
          </div>
        </div>

        <div class="editor-statusbar">
          <span class="statusbar-badge">Convention</span>
          <span class="statusbar-text">
            Fichier <code>AGENTS.md</code> à la racine, ou dossiers de rules (ex. <code>.kilo/rules/</code>, <code>.cursor/rules/</code>).
          </span>
        </div>
      </div>
    </div>

    <!-- Footer takeaway -->
    <div class="rules-question-row">
      <SlideQuestion
        variant="indigo"
        question="Pourquoi une consigne dans AGENTS.md n'est pas obligatoirement respecté par l'IA ?"
        answer="Parce qu'un modèle LLM reste probabiliste : seule la machine (tests déterministes, typage, sandbox) applique des barrières inviolables."
      />
    </div>
  </div>
</template>

<style scoped>
.rules-comparison {
  align-items: stretch;
  display: grid;
  gap: 10px;
  grid-template-columns: 0.95fr 36px 1.62fr;
  margin: 4px auto 0;
  max-width: 1060px;
}

.rules-panel {
  background: var(--surface);
  border: 1px solid var(--line);
  border-radius: 12px;
  box-shadow: 0 4px 14px rgba(15, 23, 42, 0.04);
  display: flex;
  flex-direction: column;
  padding: 10px 14px;
}

.rules-panel--left {
  background: #fdfbfb;
  border-color: #e2e8f0;
  border-top: 4px solid #ef4444;
}

.rules-panel--right {
  background: #0f172a;
  border-color: #334155;
  border-top: 4px solid #14b8a6;
  box-shadow: 0 8px 24px rgba(15, 23, 42, 0.25);
  padding: 0;
  overflow: hidden;
}

.panel-header {
  margin-bottom: 6px;
}

.panel-badge {
  font-size: 10.5px;
  font-weight: 800;
  letter-spacing: 0.06em;
  text-transform: uppercase;
}

.panel-badge--left {
  color: #dc2626;
}

.prompt-box {
  background: #ffffff;
  border: 1px solid #fecaca;
  border-left: 3px solid #ef4444;
  border-radius: 7px;
  padding: 6px 10px;
  margin-bottom: 8px;
}

.prompt-box__label {
  align-items: center;
  color: #991b1b;
  display: flex;
  font-size: 10px;
  font-weight: 700;
  gap: 5px;
  margin-bottom: 2px;
}

.prompt-box__content {
  color: #1e293b;
  font-family: ui-monospace, SFMono-Regular, monospace;
  font-size: 11.5px;
  font-weight: 600;
  margin: 0;
}

.issues-list {
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.issue-item {
  align-items: flex-start;
  display: flex;
  gap: 6px;
  font-size: 11.5px;
  line-height: 1.3;
  color: #64748b;
}

.issue-icon {
  flex-shrink: 0;
  margin-top: 1px;
}

.rules-arrow {
  align-items: center;
  color: var(--teal);
  display: flex;
  flex-direction: column;
  justify-content: center;
  text-align: center;
}

.rules-arrow span {
  font-size: 24px;
  font-weight: 700;
  line-height: 1;
}

.rules-arrow small {
  color: var(--muted);
  font-size: 9.5px;
  font-weight: 700;
  letter-spacing: 0.05em;
  text-transform: uppercase;
}

/* Code Editor Styling */
.editor-window {
  display: flex;
  flex-direction: column;
  height: 100%;
}

.editor-topbar {
  align-items: center;
  background: #1e293b;
  border-bottom: 1px solid #334155;
  display: flex;
  gap: 12px;
  padding: 5px 12px;
}

.editor-dots {
  display: flex;
  gap: 5px;
}

.dot {
  border-radius: 50%;
  height: 8px;
  width: 8px;
}
.dot--red { background: #ef4444; }
.dot--yellow { background: #f59e0b; }
.dot--green { background: #10b981; }

.editor-tabs {
  display: flex;
  gap: 4px;
  margin-bottom: -6px;
}

.editor-tab {
  align-items: center;
  border-radius: 6px 6px 0 0;
  display: flex;
  font-family: ui-monospace, SFMono-Regular, monospace;
  font-size: 10.5px;
  font-weight: 600;
  gap: 5px;
  padding: 3px 9px 4px;
}

.editor-tab--active {
  background: #0f172a;
  border: 1px solid #334155;
  border-bottom: none;
  color: #f1f5f9;
}

.editor-tab--secondary {
  background: rgba(30, 41, 59, 0.6);
  border: 1px solid rgba(51, 65, 85, 0.6);
  border-bottom: none;
  color: #94a3b8;
  font-size: 10px;
}

.tab-icon {
  font-size: 11px;
}

.editor-lang {
  color: #64748b;
  font-size: 9.5px;
  margin-left: auto;
  text-transform: uppercase;
}

.editor-body {
  color: #e2e8f0;
  font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace;
  font-size: 10.5px;
  line-height: 1.45;
  padding: 7px 12px;
}

.code-line {
  align-items: center;
  display: flex;
  justify-content: space-between;
  gap: 8px;
  margin-bottom: 2px;
}

.code-line-text {
  align-items: center;
  display: flex;
  flex: 1;
  gap: 6px;
  min-width: 0;
  white-space: nowrap;
}

.code-line-text strong {
  color: #f8fafc;
}

.code-line--heading {
  color: #38bdf8;
  display: flex;
  font-size: 11px;
  font-weight: 700;
  gap: 6px;
  justify-content: flex-start;
  margin-top: 2px;
  margin-bottom: 2px;
}

.code-line--blank {
  height: 2px;
}

.md-hash {
  color: #0284c7;
}

.md-bullet {
  color: #14b8a6;
  font-weight: 800;
}

.editor-body code {
  background: rgba(255, 255, 255, 0.09);
  border-radius: 4px;
  color: #fef08a;
  font-size: 10.5px;
  padding: 1px 4px;
}

.code-tag {
  border-radius: 4px;
  flex-shrink: 0;
  font-size: 8.5px;
  font-weight: 800;
  letter-spacing: 0.04em;
  padding: 1.5px 5px;
  text-transform: uppercase;
  white-space: nowrap;
}

.code-tag--safety {
  background: rgba(16, 185, 129, 0.15);
  border: 1px solid rgba(16, 185, 129, 0.4);
  color: #34d399;
}

.code-tag--guard {
  background: rgba(245, 158, 11, 0.15);
  border: 1px solid rgba(245, 158, 11, 0.4);
  color: #fbbf24;
}

.code-tag--deps {
  background: rgba(168, 85, 247, 0.15);
  border: 1px solid rgba(168, 85, 247, 0.4);
  color: #c084fc;
}

.code-tag--error {
  background: rgba(244, 63, 94, 0.15);
  border: 1px solid rgba(244, 63, 94, 0.4);
  color: #fb7185;
}

.code-tag--check {
  background: rgba(56, 189, 248, 0.15);
  border: 1px solid rgba(56, 189, 248, 0.4);
  color: #38bdf8;
}

.editor-statusbar {
  align-items: center;
  background: #0b1120;
  border-top: 1px solid #1e293b;
  display: flex;
  font-size: 9.5px;
  gap: 8px;
  line-height: 1.3;
  margin-top: auto;
  padding: 5px 12px;
}

.statusbar-badge {
  background: rgba(56, 189, 248, 0.15);
  border: 1px solid rgba(56, 189, 248, 0.35);
  border-radius: 4px;
  color: #38bdf8;
  flex-shrink: 0;
  font-size: 8.5px;
  font-weight: 700;
  letter-spacing: 0.04em;
  padding: 1px 5px;
  text-transform: uppercase;
}

.statusbar-text {
  color: #94a3b8;
}

.statusbar-text code {
  background: rgba(255, 255, 255, 0.08);
  border-radius: 3px;
  color: #fef08a;
  font-size: 9px;
  padding: 0 4px;
}

.rules-question-row {
  grid-column: 1 / -1;
  margin-top: 2px;
}
</style>
