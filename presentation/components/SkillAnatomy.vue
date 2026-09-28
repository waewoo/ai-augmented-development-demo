<script setup lang="ts">
const skillExamples = [
  { name: 'plan-change', role: 'Cadrage préalable', note: 'Lecture seule absolue · Génère PLAN.md' },
  { name: 'implement-change', role: 'Application ciblée', note: 'Code chirurgical · Exécute demo-check' },
  { name: 'review-change', role: 'Audit critique', note: 'Diff Git & conformité · Génère REVIEW.md' },
  { name: 'document-architecture', role: 'Doc vivante', note: 'Analyse Python · Diagramme Mermaid' },
]
</script>

<template>
  <div class="skill-anatomy">
    <!-- Clean compact intro strip -->
    <div class="skill-intro-strip">
      <span class="intro-pill">SOP outillée</span>
      <span class="intro-text">
        Complément d'<code>AGENTS.md</code> : la Règle fixe le cadre passif · Le Skill formalise la <strong>procédure active étape par étape</strong>.
      </span>
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
            <span class="tab-name">.agents/skills/plan-change/SKILL.md</span>
          </div>
          <span class="editor-badge">Standard Agent Skills</span>
        </div>

        <div class="editor-body">
          <!-- Section 1: Frontmatter YAML -->
          <div class="code-section code-section--yaml">
            <div class="section-label">
              <span class="label-badge label-badge--yaml">01 · Frontmatter YAML</span>
              <span class="label-hint">Déclenchement sémantique & métadonnées</span>
            </div>
            <div class="code-row"><span class="c-delim">---</span></div>
            <div class="code-row">
              <span class="c-key">name:</span> <span class="c-val">plan-change</span>
              <span class="c-tag">Invocable : <code>/plan-change</code></span>
            </div>
            <div class="code-row">
              <span class="c-key">description:</span>
              <span class="c-str">« Explorer le code en lecture seule, cadrer l'impact et rédiger PLAN.md... »</span>
            </div>
            <div class="code-row">
              <span class="c-key">mode:</span> <span class="c-val">read-only</span>
              <span class="c-tag c-tag--ro">Garde-fou strict</span>
            </div>
            <div class="code-row"><span class="c-delim">---</span></div>
          </div>

          <!-- Section 2: Procedure -->
          <div class="code-section code-section--proc">
            <div class="section-label">
              <span class="label-badge label-badge--proc">02 · Procédure outillée (SOP)</span>
              <span class="label-hint">Étapes séquentielles exécutées par l'agent</span>
            </div>
            <div class="code-row code-row--heading">
              <span class="c-hash">##</span> <span class="c-head">Procédure</span>
            </div>
            <div class="code-row">
              <span class="c-num">1.</span> <span>Explorer l’arborescence et repérer les modules cibles (app/, tests/)</span>
            </div>
            <div class="code-row">
              <span class="c-num">2.</span> <span>Inspecter les tests existants et formaliser les contrats d’API</span>
            </div>
            <div class="code-row">
              <span class="c-num">3.</span> <span>Identifier le périmètre minimal et isoler les cas d'erreur (HTTP 422)</span>
            </div>
            <div class="code-row">
              <span class="c-num">4.</span> <span>Rédiger la stratégie complète dans <code>plans/YYYY-MM-DD/PLAN.md</code></span>
            </div>
            <div class="code-row">
              <span class="c-num">5.</span> <span>Fournir le lien Markdown et <strong>demander l’accord humain express</strong></span>
            </div>
          </div>

          <!-- Section 3: Guardrail & Output format side by side -->
          <div class="code-split-row">
            <div class="code-section code-section--guard">
              <div class="section-label">
                <span class="label-badge label-badge--guard">03 · Garde-fou</span>
              </div>
              <div class="code-row code-row--heading">
                <span class="c-hash">##</span> <span class="c-head">Limite d'action</span>
              </div>
              <div class="code-row c-alert">
                <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="#f43f5e" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                  <circle cx="12" cy="12" r="10" />
                  <line x1="4.93" y1="4.93" x2="19.07" y2="19.07" />
                </svg>
                <span>Lecture seule absolue (zéro write).</span>
              </div>
              <div class="code-row c-alert-sub">
                <span>Interdiction formelle de modifier le code.</span>
              </div>
              <div class="code-row c-alert-sub">
                <span>Validation humaine obligatoire pour agir.</span>
              </div>
            </div>

            <div class="code-section code-section--output">
              <div class="section-label">
                <span class="label-badge label-badge--output">04 · Structure du plan</span>
              </div>
              <div class="code-row code-row--heading">
                <span class="c-hash">##</span> <span class="c-head">Sortie attendue</span>
              </div>
              <div class="code-row">
                <span>Sections : <code>Contexte</code>, <code>Critères</code></span>
              </div>
              <div class="code-row">
                <span><code>Fichiers</code>, <code>Tests</code>, <code>Checklist</code></span>
              </div>
              <div class="code-row c-tag-row">
                <span class="c-out-tag">Preuve Markdown versionnée</span>
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
              <strong>Double déclenchement intelligent</strong>
              <span class="feature-pill">Sémantique + Manuel</span>
            </div>
            <p>
              <strong>Automatique :</strong> Le LLM compare le prompt au champ <code>description</code> et s’active de lui-même dès que l’intention correspond.<br>
              <strong>Manuel :</strong> L’ingénieur force la méthode avec la commande slash (ex: <code>/plan-change</code>).
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
              <strong>Procédure opératoire (SOP) versionnée</strong>
              <span class="feature-pill feature-pill--git">Git · Standard ouvert</span>
            </div>
            <p>
              Un skill est la <strong>procédure opératoire standard outillée</strong> de l’agent (fichier <code>SKILL.md</code>). Au lieu de laisser l'IA deviner, sa méthode pas-à-pas est formalisée, versionnée dans Git, partagée en équipe et auditable.
            </p>
          </div>
        </div>

        <!-- Repo Skills Ready-to-use -->
        <div class="repo-skills-box">
          <div class="repo-skills-title">
            <span class="repo-skills-tag">DÉPÔT</span>
            <span>4 skills prêts à l’emploi dans le projet</span>
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
        question="Pourquoi formaliser un skill plutôt qu’un simple prompt ?"
        answer="Un skill est une procédure opératoire standardisée (SOP) outillée. Il est versionné avec le code, partagé en équipe et activable automatiquement par matching sémantique."
      />
    </div>
  </div>
</template>

<style scoped>
.skill-anatomy {
  display: flex;
  flex: 1;
  flex-direction: column;
  gap: 5px;
  justify-content: flex-start;
  margin: 2px auto 0;
  max-width: 1040px;
  width: 100%;
}

/* 1. Intro Strip */
.skill-intro-strip {
  align-items: center;
  background: #f0fdf4;
  border: 1px solid #bbf7d0;
  border-left: 3.5px solid var(--teal, #00875a);
  border-radius: 6px;
  box-shadow: 0 1px 3px rgba(15, 23, 42, 0.03);
  display: flex;
  gap: 10px;
  padding: 3px 10px;
}

.intro-pill {
  background: var(--teal, #00875a);
  border-radius: 999px;
  color: #ffffff;
  font-size: 8.5px;
  font-weight: 800;
  letter-spacing: 0.04em;
  padding: 1.5px 7px;
  text-transform: uppercase;
  white-space: nowrap;
}

.intro-text {
  color: #334155;
  font-size: 11px;
  line-height: 1.3;
}

.intro-text strong {
  color: #0f172a;
}

.intro-text code {
  background: rgba(0, 0, 0, 0.06);
  border-radius: 3px;
  color: #047857;
  font-size: 10px;
  padding: 1px 4px;
}

/* 2. Main Grid */
.anatomy-grid {
  align-items: stretch;
  display: grid;
  flex: 1;
  gap: 10px;
  grid-template-columns: 1.26fr 0.94fr;
  min-height: 260px;
}

/* Editor Window */
.editor-window {
  background: #0b1120;
  border: 1px solid #334155;
  border-radius: 10px;
  box-shadow: 0 6px 20px rgba(15, 23, 42, 0.18);
  display: flex;
  flex: 1;
  flex-direction: column;
  min-height: 260px;
  overflow: hidden;
}

.editor-topbar {
  align-items: center;
  background: #1e293b;
  border-bottom: 1px solid #334155;
  display: flex;
  gap: 9px;
  padding: 5px 10px;
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

.editor-tab {
  align-items: center;
  background: #0b1120;
  border: 1px solid #334155;
  border-bottom: none;
  border-radius: 5px 5px 0 0;
  color: #f1f5f9;
  display: flex;
  font-family: ui-monospace, SFMono-Regular, monospace;
  font-size: 10px;
  font-weight: 600;
  gap: 5px;
  margin-bottom: -7px;
  padding: 3px 8px 4px;
}

.tab-icon {
  color: #38bdf8;
}

.editor-badge {
  color: #64748b;
  font-size: 9px;
  font-weight: 700;
  letter-spacing: 0.05em;
  margin-left: auto;
  text-transform: uppercase;
}

.editor-body {
  color: #e2e8f0;
  display: flex;
  flex: 1;
  flex-direction: column;
  font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace;
  font-size: 9.5px;
  gap: 4px;
  justify-content: space-between;
  line-height: 1.32;
  padding: 6px 10px;
}

.code-section {
  background: rgba(30, 41, 59, 0.45);
  border: 1px solid rgba(51, 65, 85, 0.5);
  border-radius: 5px;
  padding: 3.5px 7px;
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
.c-alert-sub { color: #94a3b8; font-size: 8px; }

.c-tag {
  background: rgba(165, 180, 252, 0.12);
  border: 1px solid rgba(165, 180, 252, 0.3);
  border-radius: 3px;
  color: #c7d2fe;
  font-size: 8px;
  margin-left: auto;
  padding: 0.5px 3.5px;
}

.c-tag--ro {
  background: rgba(244, 63, 94, 0.15);
  border-color: rgba(244, 63, 94, 0.4);
  color: #fb7185;
}

.c-tag-row {
  margin-top: 2px;
}

.c-out-tag {
  background: rgba(168, 85, 247, 0.15);
  border: 1px solid rgba(168, 85, 247, 0.35);
  border-radius: 3px;
  color: #c084fc;
  font-size: 8px;
  font-weight: 700;
  padding: 0.5px 3.5px;
}

/* Right Column: Powers */
.powers-col {
  display: flex;
  flex: 1;
  flex-direction: column;
  gap: 6px;
  justify-content: space-between;
  min-height: 260px;
}

.feature-card {
  align-items: flex-start;
  background: #ffffff;
  border: 1px solid #e2e8f0;
  border-radius: 7px;
  box-shadow: 0 2px 5px rgba(15, 23, 42, 0.03);
  display: flex;
  gap: 8px;
  padding: 5px 10px;
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
  font-weight: 750;
}

.feature-pill {
  background: #ecfdf5;
  border: 1px solid #a7f3d0;
  border-radius: 4px;
  color: #065f46;
  font-size: 8px;
  font-weight: 700;
  padding: 1px 4px;
}

.feature-pill--git {
  background: #eff6ff;
  border-color: #bfdbfe;
  color: #1e40af;
}

.feature-content p {
  color: #475569;
  font-size: 9.5px;
  line-height: 1.3;
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
  flex: 1;
  flex-direction: column;
  gap: 4px;
  justify-content: space-between;
  padding: 5px 8px;
}

.repo-skills-title {
  align-items: center;
  color: #334155;
  display: flex;
  font-size: 9.5px;
  font-weight: 750;
  gap: 5px;
}

.repo-skills-tag {
  background: #e2e8f0;
  border-radius: 3px;
  color: #475569;
  font-size: 7.5px;
  font-weight: 800;
  letter-spacing: 0.05em;
  padding: 1px 3.5px;
}

.repo-skills-grid {
  display: grid;
  flex: 1;
  gap: 5px;
  grid-template-columns: 1fr 1fr;
}

.skill-item {
  background: #ffffff;
  border: 1px solid #e2e8f0;
  border-radius: 5px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  padding: 3px 6px;
  transition: border-color 0.15s ease;
}

.skill-item:hover {
  border-color: #99f6e4;
}

.skill-item-header code {
  color: #0f766e;
  font-family: ui-monospace, SFMono-Regular, monospace;
  font-size: 9px;
  font-weight: 750;
}

.skill-item-role {
  color: #0f172a;
  font-size: 8.5px;
  font-weight: 650;
  margin-top: 1px;
}

.skill-item-note {
  color: #64748b;
  font-size: 8px;
  line-height: 1.2;
}

/* Question row */
.skill-question-row {
  margin-top: 8px;
  margin-bottom: 6px;
}
</style>
