<script setup lang="ts">
const skillExamples = [
  { name: 'plan-change', role: 'Cadrage préalable', note: 'Lecture seule absolue' },
  { name: 'implement-change', role: 'Code chirurgical', note: 'Application du plan validé' },
  { name: 'review-change', role: 'Audit critique', note: 'Diff Git & conformité rules' },
  { name: 'document-architecture', role: 'Doc vivante', note: 'Schéma Mermaid & routes' },
]
</script>

<template>
  <div class="skill-anatomy">
    <!-- Discrete Rules vs Skills contrast strip -->
    <div class="contrast-bar">
      <div class="contrast-item contrast-item--rule">
        <span class="contrast-badge contrast-badge--rule">Rule · AGENTS.md</span>
        <span class="contrast-desc">
          <strong>Cadre passif :</strong> invariants permanents du dépôt
        </span>
      </div>
      <div class="contrast-divider">vs</div>
      <div class="contrast-item contrast-item--skill">
        <span class="contrast-badge contrast-badge--skill">Skill · SKILL.md</span>
        <span class="contrast-desc">
          <strong>Méthode active :</strong> procédure outillée exécutée par tâche
        </span>
      </div>
    </div>

    <!-- Main grid: Editor Anatomy on Left (56%), Key Superpowers on Right (44%) -->
    <div class="anatomy-grid">
      <!-- Left: SKILL.md Anatomy in Dark Code Editor -->
      <div class="editor-window">
        <div class="editor-topbar">
          <div class="editor-dots">
            <span class="dot dot--red" />
            <span class="dot dot--yellow" />
            <span class="dot dot--green" />
          </div>
          <div class="editor-tab">
            <svg class="tab-icon" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z" />
              <polyline points="14 2 14 8 20 8" />
            </svg>
            <span class="tab-name">.kilo/skills/plan-change/SKILL.md</span>
          </div>
          <span class="editor-badge">Standard Agent Skills</span>
        </div>

        <div class="editor-body">
          <!-- Section 1: Frontmatter YAML -->
          <div class="code-section code-section--yaml">
            <div class="section-label">
              <span class="label-badge label-badge--yaml">01 · Frontmatter YAML</span>
              <span class="label-hint">Déclenchement sémantique ou manuel</span>
            </div>
            <div class="code-row"><span class="c-delim">---</span></div>
            <div class="code-row">
              <span class="c-key">name:</span> <span class="c-val">plan-change</span>
              <span class="c-tag">Invocable : <code>/plan-change</code></span>
            </div>
            <div class="code-row">
              <span class="c-key">description:</span>
              <span class="c-str">« Explorer et planifier sans modifier de code... »</span>
            </div>
            <div class="code-row"><span class="c-delim">---</span></div>
          </div>

          <!-- Section 2: Procedure -->
          <div class="code-section code-section--proc">
            <div class="section-label">
              <span class="label-badge label-badge--proc">02 · Procédure outillée</span>
              <span class="label-hint">Étapes séquentielles que l'agent déroule</span>
            </div>
            <div class="code-row code-row--heading">
              <span class="c-hash">##</span> <span class="c-head">Procédure</span>
            </div>
            <div class="code-row">
              <span class="c-num">1.</span> <span>Lire <code>AGENTS.md</code> et conventions du projet</span>
            </div>
            <div class="code-row">
              <span class="c-num">2.</span> <span>Analyser le code existant et les tests de non-régression</span>
            </div>
            <div class="code-row">
              <span class="c-num">3.</span> <span>Énumérer les fichiers cibles et les critères d’acceptation</span>
            </div>
          </div>

          <!-- Section 3: Guardrail & Output format side by side -->
          <div class="code-split-row">
            <div class="code-section code-section--guard">
              <div class="section-label">
                <span class="label-badge label-badge--guard">03 · Garde-fou</span>
              </div>
              <div class="code-row code-row--heading">
                <span class="c-hash">##</span> <span class="c-head">Limite stricte</span>
              </div>
              <div class="code-row c-alert">
                <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="#f43f5e" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                  <circle cx="12" cy="12" r="10" />
                  <line x1="4.93" y1="4.93" x2="19.07" y2="19.07" />
                </svg>
                <span>Ne modifier aucun fichier.</span>
              </div>
              <div class="code-row c-alert-sub">
                <span>Attendre approbation humaine.</span>
              </div>
            </div>

            <div class="code-section code-section--output">
              <div class="section-label">
                <span class="label-badge label-badge--output">04 · Format attendu</span>
              </div>
              <div class="code-row code-row--heading">
                <span class="c-hash">##</span> <span class="c-head">Sortie attendue</span>
              </div>
              <div class="code-row">
                <span>Titres : <code>Compréhension</code>,</span>
              </div>
              <div class="code-row">
                <span><code>Fichiers</code>, <code>Tests</code>, <code>Risques</code></span>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Right: Method Powers & Concrete Repo Skills -->
      <div class="powers-col">
        <!-- Feature 1: Triggering -->
        <div class="feature-card feature-card--trigger">
          <div class="feature-icon">
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="#00875a" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
              <circle cx="12" cy="12" r="10" />
              <circle cx="12" cy="12" r="6" />
              <circle cx="12" cy="12" r="2" />
            </svg>
          </div>
          <div class="feature-content">
            <div class="feature-title">
              <strong>Double déclenchement</strong>
              <span class="feature-pill">Sémantique + Manuel</span>
            </div>
            <p>
              Le LLM compare le prompt avec le champ <code>description</code> pour s'activer automatiquement. L'humain peut aussi l'invoquer en direct (ex: <code>/plan-change</code>).
            </p>
          </div>
        </div>

        <!-- Feature 2: Shared Engineering Recipe -->
        <div class="feature-card feature-card--recipe">
          <div class="feature-icon">
            <svg width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="#1e40af" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M16 4h2a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h2" />
              <rect x="8" y="2" width="8" height="4" rx="1" ry="1" />
            </svg>
          </div>
          <div class="feature-content">
            <div class="feature-title">
              <strong>Méthode d'équipe versionnée</strong>
              <span class="feature-pill feature-pill--git">Git · Ouvert</span>
            </div>
            <p>
              Fini les prompts perdus dans un coin : la recette de travail est un fichier Markdown standardisé dans le dépôt, partageable et améliorable en équipe.
            </p>
          </div>
        </div>

        <!-- Repo Skills Ready-to-use -->
        <div class="repo-skills-box">
          <div class="repo-skills-title">
            <span class="repo-skills-tag">DÉPÔT</span>
            <span>4 skills prêts à l’emploi pour la démo</span>
          </div>
          <div class="repo-skills-grid">
            <div
              v-for="skill in skillExamples"
              :key="skill.name"
              class="skill-item"
            >
              <div class="skill-item-header">
                <code>{{ skill.name }}</code>
              </div>
              <div class="skill-item-role">{{ skill.role }}</div>
              <div class="skill-item-note">{{ skill.note }}</div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Interactive question row -->
    <div class="skill-question-row">
      <SlideQuestion
        variant="emerald"
        question="Pourquoi utiliser un skill plutôt qu’un simple prompt ?"
        answer="Un skill transforme une intention en procédure outillée standardisée. Il est versionné avec le code, partagé en équipe et activable automatiquement par matching sémantique."
      />
    </div>
  </div>
</template>

<style scoped>
.skill-anatomy {
  display: flex;
  flex-direction: column;
  gap: 5px;
  margin: 0 auto;
  max-width: 1040px;
}

/* 1. Discrete Contrast Bar */
.contrast-bar {
  align-items: center;
  background: #ffffff;
  border: 1px solid #e2e8f0;
  border-radius: 7px;
  box-shadow: 0 1px 3px rgba(15, 23, 42, 0.04);
  display: flex;
  gap: 14px;
  padding: 3px 14px;
}

.contrast-item {
  align-items: center;
  display: flex;
  flex: 1;
  gap: 7px;
  min-width: 0;
}

.contrast-divider {
  color: #94a3b8;
  font-size: 10.5px;
  font-weight: 700;
  text-transform: uppercase;
}

.contrast-badge {
  border-radius: 5px;
  flex-shrink: 0;
  font-size: 9px;
  font-weight: 800;
  letter-spacing: 0.04em;
  padding: 1.5px 6px;
  text-transform: uppercase;
  white-space: nowrap;
}

.contrast-badge--rule {
  background: #eff6ff;
  border: 1px solid #bfdbfe;
  color: #1e40af;
}

.contrast-badge--skill {
  background: #f0fdf4;
  border: 1px solid #99f6e4;
  color: #065f46;
}

.contrast-desc {
  color: #475569;
  font-size: 10.5px;
  line-height: 1.25;
  white-space: nowrap;
}

.contrast-desc strong {
  color: #0f172a;
}

.contrast-desc em {
  color: #64748b;
  font-style: normal;
}

/* 2. Main Grid */
.anatomy-grid {
  align-items: stretch;
  display: grid;
  gap: 10px;
  grid-template-columns: 1.25fr 0.95fr;
}

/* Editor Window */
.editor-window {
  background: #0b1120;
  border: 1px solid #334155;
  border-radius: 9px;
  box-shadow: 0 6px 20px rgba(15, 23, 42, 0.18);
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

.editor-topbar {
  align-items: center;
  background: #1e293b;
  border-bottom: 1px solid #334155;
  display: flex;
  gap: 9px;
  padding: 4px 10px;
}

.editor-dots {
  display: flex;
  gap: 4.5px;
}

.dot {
  border-radius: 50%;
  height: 7.5px;
  width: 7.5px;
}
.dot--red { background: #ef4444; }
.dot--yellow { background: #f59e0b; }
.dot--green { background: #10b981; }

.editor-tab {
  align-items: center;
  background: #0b1120;
  border: 1px solid #334155;
  border-bottom: none;
  border-radius: 5px 5px 0 0;
  color: #f1f5f9;
  display: flex;
  font-family: ui-monospace, SFMono-Regular, monospace;
  font-size: 9.5px;
  font-weight: 600;
  gap: 5px;
  margin-bottom: -5px;
  padding: 2.5px 7px 3.5px;
}

.tab-icon {
  color: #38bdf8;
}

.editor-badge {
  color: #64748b;
  font-size: 8.5px;
  font-weight: 700;
  letter-spacing: 0.05em;
  margin-left: auto;
  text-transform: uppercase;
}

.editor-body {
  color: #e2e8f0;
  display: flex;
  flex-direction: column;
  font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace;
  font-size: 9.5px;
  gap: 5px;
  line-height: 1.32;
  padding: 6px 10px;
}

.code-section {
  background: rgba(30, 41, 59, 0.45);
  border: 1px solid rgba(51, 65, 85, 0.5);
  border-radius: 5px;
  padding: 4px 7px;
}

.code-section--yaml {
  border-left: 3px solid #38bdf8;
}

.code-section--proc {
  border-left: 3px solid #14b8a6;
}

.code-split-row {
  display: grid;
  gap: 6px;
  grid-template-columns: 1fr 1fr;
}

.code-section--guard {
  border-left: 3px solid #f43f5e;
}

.code-section--output {
  border-left: 3px solid #a855f7;
}

.section-label {
  align-items: center;
  display: flex;
  justify-content: space-between;
  margin-bottom: 2px;
}

.label-badge {
  border-radius: 3px;
  font-size: 8px;
  font-weight: 800;
  letter-spacing: 0.04em;
  padding: 1px 3.5px;
  text-transform: uppercase;
}

.label-badge--yaml { background: rgba(56, 189, 248, 0.18); color: #38bdf8; }
.label-badge--proc { background: rgba(20, 184, 166, 0.18); color: #2dd4bf; }
.label-badge--guard { background: rgba(244, 63, 94, 0.18); color: #fb7185; }
.label-badge--output { background: rgba(168, 85, 247, 0.18); color: #c084fc; }

.label-hint {
  color: #64748b;
  font-size: 8px;
}

.code-row {
  align-items: center;
  display: flex;
  gap: 5px;
}

.code-row code {
  background: rgba(255, 255, 255, 0.1);
  border-radius: 3px;
  color: #fef08a;
  font-size: 9px;
  padding: 0 3px;
}

.code-row--heading {
  margin-bottom: 1px;
}

.c-delim { color: #64748b; font-weight: 700; }
.c-key { color: #38bdf8; font-weight: 700; }
.c-val { color: #a5b4fc; font-weight: 700; }
.c-str { color: #86efac; font-size: 9px; }
.c-hash { color: #14b8a6; font-weight: 800; }
.c-head { color: #f1f5f9; font-weight: 700; }
.c-num { color: #2dd4bf; font-weight: 800; }
.c-alert {
  align-items: center;
  color: #fda4af;
  display: flex;
  font-weight: 700;
  font-size: 9px;
  gap: 4px;
}
.c-alert-sub { color: #94a3b8; font-size: 8.5px; }

.c-tag {
  background: rgba(165, 180, 252, 0.12);
  border: 1px solid rgba(165, 180, 252, 0.3);
  border-radius: 3px;
  color: #c7d2fe;
  font-size: 8px;
  margin-left: auto;
  padding: 0.5px 3.5px;
}

/* Right Column: Powers */
.powers-col {
  display: flex;
  flex-direction: column;
  gap: 5px;
}

.feature-card {
  align-items: flex-start;
  background: #ffffff;
  border: 1px solid #e2e8f0;
  border-radius: 7px;
  box-shadow: 0 2px 5px rgba(15, 23, 42, 0.03);
  display: flex;
  gap: 8px;
  padding: 5px 8px;
}

.feature-card--trigger {
  border-left: 3.5px solid #00875a;
}

.feature-card--recipe {
  border-left: 3.5px solid #1e40af;
}

.feature-icon {
  align-items: center;
  display: flex;
  flex-shrink: 0;
  height: 18px;
  justify-content: center;
  margin-top: 1px;
  width: 18px;
}

.feature-content {
  flex: 1;
}

.feature-title {
  align-items: center;
  display: flex;
  justify-content: space-between;
  margin-bottom: 1px;
}

.feature-title strong {
  color: #0f172a;
  font-size: 11px;
  font-weight: 700;
}

.feature-pill {
  background: #ecfdf5;
  border: 1px solid #a7f3d0;
  border-radius: 4px;
  color: #065f46;
  font-size: 8px;
  font-weight: 700;
  padding: 0.5px 3.5px;
}

.feature-pill--git {
  background: #eff6ff;
  border-color: #bfdbfe;
  color: #1e40af;
}

.feature-content p {
  color: #475569;
  font-size: 9.5px;
  line-height: 1.25;
  margin: 0;
}

.feature-content code {
  background: #f1f5f9;
  border-radius: 3px;
  color: #0f172a;
  font-family: ui-monospace, SFMono-Regular, monospace;
  font-size: 9px;
  padding: 0.5px 3px;
}

/* Repo Skills Box */
.repo-skills-box {
  background: #f8fafc;
  border: 1px solid #e2e8f0;
  border-radius: 7px;
  display: flex;
  flex-direction: column;
  gap: 4px;
  padding: 5px 7px;
}

.repo-skills-title {
  align-items: center;
  color: #334155;
  display: flex;
  font-size: 9.5px;
  font-weight: 700;
  gap: 5px;
}

.repo-skills-tag {
  background: #e2e8f0;
  border-radius: 3px;
  color: #475569;
  font-size: 7.5px;
  font-weight: 800;
  letter-spacing: 0.05em;
  padding: 0.5px 3px;
}

.repo-skills-grid {
  display: grid;
  gap: 4px;
  grid-template-columns: 1fr 1fr;
}

.skill-item {
  background: #ffffff;
  border: 1px solid #e2e8f0;
  border-radius: 5px;
  padding: 3px 5px;
  transition: border-color 0.15s ease;
}

.skill-item:hover {
  border-color: #99f6e4;
}

.skill-item-header code {
  color: #0f766e;
  font-family: ui-monospace, SFMono-Regular, monospace;
  font-size: 9px;
  font-weight: 700;
}

.skill-item-role {
  color: #0f172a;
  font-size: 8.5px;
  font-weight: 600;
  line-height: 1.15;
  margin-top: 1px;
}

.skill-item-note {
  color: #64748b;
  font-size: 7.5px;
  line-height: 1.15;
}

/* Question row */
.skill-question-row {
  margin-top: 0;
}
</style>
