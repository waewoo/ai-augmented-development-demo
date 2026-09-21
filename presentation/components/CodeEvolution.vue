<template>
  <div class="code-evolution">
    <!-- Visual Pipeline Header -->
    <div class="pipeline-header">
      <div class="pipeline-step pipeline-step--plan">
        <span class="step-num">01</span>
        <div class="step-meta">
          <strong>Intention du plan</strong>
          <small>Ce qui doit être vrai</small>
        </div>
      </div>
      <div class="pipeline-arrow">➔</div>
      <div class="pipeline-step pipeline-step--code">
        <span class="step-num">02</span>
        <div class="step-meta">
          <strong>Diff Git minimal</strong>
          <small>Où l’agent intervient</small>
        </div>
      </div>
      <div class="pipeline-arrow">➔</div>
      <div class="pipeline-step pipeline-step--proof">
        <span class="step-num">03</span>
        <div class="step-meta">
          <strong>Preuve déterministe</strong>
          <small>Ce que le test valide</small>
        </div>
      </div>
    </div>

    <!-- Pipeline Rows -->
    <div class="pipeline-rows">
      <!-- Row 1: Cas nominal -->
      <div class="pipeline-row">
        <div class="pipe-node pipe-node--plan">
          <div class="node-header">
            <span class="node-badge node-badge--nominal">Cas nominal</span>
            <code>GET /tasks?status=done</code>
          </div>
          <p class="node-desc">Retourner uniquement les tâches terminées</p>
        </div>

        <div class="pipe-connector">➔</div>

        <div class="pipe-node pipe-node--code">
          <div class="node-file">
            <span class="file-icon">📄</span>
            <strong>app/service.py</strong>
          </div>
          <p class="node-desc">Filtre la liste en mémoire si <code>status</code> est fourni</p>
        </div>

        <div class="pipe-connector">➔</div>

        <div class="pipe-node pipe-node--proof">
          <span class="proof-pill proof-pill--ok">✓ 200 OK · 1 tâche</span>
          <p class="node-desc">Nouveau test API vert dédié au filtre</p>
        </div>
      </div>

      <!-- Row 2: Non-régression -->
      <div class="pipeline-row">
        <div class="pipe-node pipe-node--plan">
          <div class="node-header">
            <span class="node-badge node-badge--safety">Non-régression</span>
            <code>GET /tasks</code>
          </div>
          <p class="node-desc">Sans filtre : comportement par défaut intact</p>
        </div>

        <div class="pipe-connector">➔</div>

        <div class="pipe-node pipe-node--code">
          <div class="node-file">
            <span class="file-icon">📄</span>
            <strong>app/main.py</strong>
          </div>
          <p class="node-desc">Paramètre optionnel <code>status: TaskStatus | None</code></p>
        </div>

        <div class="pipe-connector">➔</div>

        <div class="pipe-node pipe-node--proof">
          <span class="proof-pill proof-pill--ok">✓ 200 OK · 3 tâches</span>
          <p class="node-desc">Test existant inchangé et toujours passant</p>
        </div>
      </div>

      <!-- Row 3: Cas d'erreur -->
      <div class="pipeline-row">
        <div class="pipe-node pipe-node--plan">
          <div class="node-header">
            <span class="node-badge node-badge--error">Cas d'erreur</span>
            <code>GET /tasks?status=inconnu</code>
          </div>
          <p class="node-desc">Rejet strict de toute valeur non autorisée</p>
        </div>

        <div class="pipe-connector">➔</div>

        <div class="pipe-node pipe-node--code">
          <div class="node-file">
            <span class="file-icon">📄</span>
            <strong>app/models.py</strong>
          </div>
          <p class="node-desc">Énumération <code>TaskStatus</code> validée par Pydantic</p>
        </div>

        <div class="pipe-connector">➔</div>

        <div class="pipe-node pipe-node--proof">
          <span class="proof-pill proof-pill--err">✓ 422 Unprocessable</span>
          <p class="node-desc">Rejet automatique avec format d'erreur conforme</p>
        </div>
      </div>
    </div>

    <!-- Global Takeaway -->
    <footer class="trace-takeaway">
      <span class="trace-takeaway__tag">Preuve globale</span>
      <strong><code>make demo-verify</code> valide les 4 tests, le typage strict (Mypy) et le formatage (Ruff) : aucune confiance aveugle.</strong>
    </footer>
  </div>
</template>

<style scoped>
.code-evolution {
  display: flex;
  flex-direction: column;
  gap: 10px;
  margin: 10px auto 0;
  max-width: 1040px;
}

/* Pipeline Header */
.pipeline-header {
  align-items: center;
  background: var(--surface);
  border: 1px solid var(--line);
  border-radius: 12px;
  display: grid;
  grid-template-columns: 1fr 32px 1fr 32px 1fr;
  padding: 8px 16px;
}

.pipeline-step {
  align-items: center;
  display: flex;
  gap: 10px;
}

.step-num {
  align-items: center;
  border-radius: 6px;
  display: flex;
  font-size: 11px;
  font-weight: 800;
  height: 22px;
  justify-content: center;
  width: 22px;
}

.pipeline-step--plan .step-num { background: #ede9fe; color: #6d28d9; }
.pipeline-step--code .step-num { background: #e0f2fe; color: #0369a1; }
.pipeline-step--proof .step-num { background: #d1fae5; color: #047857; }

.step-meta {
  display: flex;
  flex-direction: column;
  line-height: 1.2;
}

.step-meta strong {
  color: var(--ink);
  font-size: 12px;
}

.step-meta small {
  color: var(--muted);
  font-size: 10px;
}

.pipeline-arrow {
  color: #94a3b8;
  font-size: 14px;
  text-align: center;
}

/* Pipeline Rows */
.pipeline-rows {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.pipeline-row {
  align-items: center;
  background: #ffffff;
  border: 1px solid var(--line);
  border-radius: 10px;
  box-shadow: 0 2px 6px rgba(15, 23, 42, 0.03);
  display: grid;
  grid-template-columns: 1fr 32px 1fr 32px 1fr;
  padding: 8px 14px;
  transition: all 0.15s ease;
}

.pipeline-row:hover {
  border-color: #cbd5e1;
  box-shadow: 0 4px 12px rgba(15, 23, 42, 0.06);
  transform: translateY(-1px);
}

.pipe-node {
  display: flex;
  flex-direction: column;
  gap: 3px;
}

.node-header {
  align-items: center;
  display: flex;
  gap: 8px;
}

.node-header code {
  background: #f8fafc;
  border: 1px solid #e2e8f0;
  border-radius: 4px;
  color: #0f172a;
  font-size: 10.5px;
  font-weight: 600;
  padding: 1px 5px;
}

.node-badge {
  border-radius: 4px;
  font-size: 9.5px;
  font-weight: 800;
  letter-spacing: 0.04em;
  padding: 2px 6px;
  text-transform: uppercase;
}

.node-badge--nominal { background: #ede9fe; color: #6d28d9; }
.node-badge--safety { background: #e0f2fe; color: #0369a1; }
.node-badge--error { background: #ffe4e6; color: #be123c; }

.node-file {
  align-items: center;
  display: flex;
  gap: 6px;
}

.file-icon {
  font-size: 12px;
}

.node-file strong {
  color: #1e293b;
  font-family: ui-monospace, SFMono-Regular, monospace;
  font-size: 11.5px;
}

.node-desc {
  color: #64748b;
  font-size: 11px;
  line-height: 1.3;
  margin: 0;
}

.node-desc code {
  background: #f1f5f9;
  border-radius: 3px;
  color: #334155;
  font-size: 10px;
  padding: 1px 3px;
}

.pipe-connector {
  color: #94a3b8;
  font-size: 13px;
  font-weight: bold;
  text-align: center;
}

.proof-pill {
  align-self: flex-start;
  border-radius: 999px;
  font-family: ui-monospace, SFMono-Regular, monospace;
  font-size: 10.5px;
  font-weight: 700;
  padding: 2px 8px;
}

.proof-pill--ok {
  background: #ecfdf5;
  border: 1px solid #a7f3d0;
  color: #059669;
}

.proof-pill--err {
  background: #fdf2f8;
  border: 1px solid #fbcfe8;
  color: #db2777;
}

/* Global Takeaway */
.trace-takeaway {
  align-items: center;
  background: var(--surface);
  border: 1px solid var(--line);
  border-radius: 10px;
  color: var(--ink);
  display: flex;
  font-size: 12px;
  gap: 12px;
  padding: 8px 14px;
}

.trace-takeaway__tag {
  background: #ede9fe;
  border: 1px solid #ddd6fe;
  border-radius: 6px;
  color: #6d28d9;
  flex-shrink: 0;
  font-size: 10px;
  font-weight: 800;
  letter-spacing: 0.06em;
  padding: 3px 7px;
  text-transform: uppercase;
}

.trace-takeaway code {
  color: var(--teal);
  font-size: 11.5px;
}
</style>
