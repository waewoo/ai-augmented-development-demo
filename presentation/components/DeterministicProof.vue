<template>
  <div class="deterministic-proof">
    <div class="proof-duel">
      <!-- Left side: The agent's text claim (Illusion / Risk) -->
      <div class="duel-card duel-card--claim">
        <div class="duel-header duel-header--claim">
          <span class="duel-tag duel-tag--claim">❌ L’affirmation de l’agent</span>
          <span class="duel-sub">Langage naturel (Non vérifiable)</span>
        </div>

        <div class="agent-chat-bubble">
          <div class="chat-avatar">🤖</div>
          <div class="chat-content">
            <span class="chat-author">Assistant IA</span>
            <p class="chat-text">
              « J'ai implémenté le filtre <code>status</code> dans l'API. J'ai également vérifié le code et <strong>tout fonctionne parfaitement ! Tous les tests passent avec succès.</strong> »
            </p>
          </div>
        </div>

        <div class="claim-warning">
          <span class="warning-icon">⚠️</span>
          <span><strong>Risque d'hallucination :</strong> un modèle peut affirmer qu'un test est passé sans l'avoir lancé, ignorer une régression ou masquer un effet de bord.</span>
        </div>
      </div>

      <!-- Duel separator vs -->
      <div class="duel-vs">
        <span>VS</span>
      </div>

      <!-- Right side: Deterministic Machine Proofs + Diff -->
      <div class="duel-card duel-card--proof">
        <div class="duel-header duel-header--proof">
          <span class="duel-tag duel-tag--proof">✅ Les vraies preuves</span>
          <span class="duel-sub">Machine déterministe + Audit humain</span>
        </div>

        <!-- Terminal Output -->
        <div class="terminal-box">
          <div class="terminal-bar">
            <div class="terminal-dots">
              <span class="dot dot--red" />
              <span class="dot dot--yellow" />
              <span class="dot dot--green" />
            </div>
            <span class="terminal-title">terminal · make demo-verify</span>
            <span class="terminal-badge">Exit 0</span>
          </div>
          <div class="terminal-body">
            <div class="term-line">
              <span class="term-cmd">$ pytest</span>
              <span class="term-dots">....</span>
              <span class="term-ok">[100%] (4 passed)</span>
            </div>
            <div class="term-line">
              <span class="term-cmd">$ ruff check .</span>
              <span class="term-ok">All checks passed!</span>
            </div>
            <div class="term-line">
              <span class="term-cmd">$ mypy app</span>
              <span class="term-ok">Success: no issues found</span>
            </div>
          </div>
        </div>

        <!-- Git Diff Snippet -->
        <div class="diff-box">
          <div class="diff-header">
            <span class="diff-file">diff --git a/app/service.py</span>
            <span class="diff-badge">+2 -0</span>
          </div>
          <div class="diff-body">
            <div class="diff-line diff-line--ctx">&nbsp;def get_tasks(status: TaskStatus | None = None):</div>
            <div class="diff-line diff-line--add">+&nbsp;&nbsp;&nbsp;&nbsp;if status:</div>
            <div class="diff-line diff-line--add">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return [t for t in tasks if t.status == status]</div>
          </div>
        </div>
      </div>
    </div>

    <!-- Execution Tiers: Manuel vs Hooks CLI vs CI/CD -->
    <div class="execution-tiers">
      <span class="tiers-label">Niveaux de déclenchement :</span>
      <div class="tier-pill tier-pill--manual">
        <span class="tier-icon">💻</span>
        <strong>Manuel</strong>
        <small>Terminal / make demo-verify</small>
      </div>
      <span class="tier-arrow">➔</span>
      <div class="tier-pill tier-pill--hook">
        <span class="tier-icon">🪝</span>
        <strong>Hooks CLI &amp; Git</strong>
        <small>Interception auto (Kilo / pre-commit)</small>
      </div>
      <span class="tier-arrow">➔</span>
      <div class="tier-pill tier-pill--ci">
        <span class="tier-icon">🚀</span>
        <strong>Pipeline CI/CD</strong>
        <small>GitLab CI / GitHub Actions avant merge</small>
      </div>
    </div>

    <!-- Bottom Takeaway -->
    <footer class="proof-takeaway">
      <span class="takeaway-tag">Règle d'or</span>
      <strong>J’accepte le résultat parce que les contrôles machine sont passés (à la main ou en CI) et le diff Git relu.</strong>
    </footer>
  </div>
</template>

<style scoped>
.deterministic-proof {
  display: flex;
  flex-direction: column;
  gap: 8px;
  margin: 8px auto 0;
  max-width: 1040px;
}

.proof-duel {
  align-items: stretch;
  display: grid;
  flex: 1;
  gap: 12px;
  grid-template-columns: 1fr 36px 1.2fr;
}

.duel-card {
  border-radius: 12px;
  box-shadow: 0 4px 14px rgba(15, 23, 42, 0.04);
  display: flex;
  flex-direction: column;
  padding: 10px 14px;
}

.duel-card--claim {
  background: #fdfbfb;
  border: 1px solid #fecaca;
  border-top: 4px solid #ef4444;
}

.duel-card--proof {
  background: #0f172a;
  border: 1px solid #334155;
  border-top: 4px solid #10b981;
  box-shadow: 0 8px 24px rgba(15, 23, 42, 0.25);
  color: #f1f5f9;
  padding: 10px 14px;
}

.duel-header {
  align-items: center;
  display: flex;
  justify-content: space-between;
  margin-bottom: 8px;
}

.duel-tag {
  font-size: 10.5px;
  font-weight: 800;
  letter-spacing: 0.06em;
  text-transform: uppercase;
}
.duel-tag--claim { color: #dc2626; }
.duel-tag--proof { color: #10b981; }

.duel-sub {
  color: #64748b;
  font-size: 9.5px;
}
.duel-card--proof .duel-sub {
  color: #94a3b8;
}

/* Chat bubble */
.agent-chat-bubble {
  background: #ffffff;
  border: 1px solid #cbd5e1;
  border-radius: 10px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
  display: flex;
  gap: 8px;
  padding: 8px 10px;
  margin-bottom: 8px;
}

.chat-avatar {
  background: #f1f5f9;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 18px;
  height: 32px;
  width: 32px;
  flex-shrink: 0;
}

.chat-content {
  display: flex;
  flex-direction: column;
  gap: 2px;
}

.chat-author {
  color: #475569;
  font-size: 10.5px;
  font-weight: 700;
}

.chat-text {
  color: #1e293b;
  font-size: 11px;
  line-height: 1.35;
  margin: 0;
}

.chat-text code {
  background: #f1f5f9;
  border-radius: 3px;
  color: #0f766e;
  padding: 1px 4px;
  font-size: 10.5px;
}

.claim-warning {
  align-items: flex-start;
  background: #fef2f2;
  border-radius: 6px;
  border: 1px solid #fee2e2;
  color: #991b1b;
  display: flex;
  font-size: 10.5px;
  gap: 6px;
  line-height: 1.3;
  margin-top: auto;
  padding: 6px 8px;
}

.warning-icon {
  flex-shrink: 0;
  font-size: 12px;
  margin-top: 1px;
}

.duel-vs {
  align-items: center;
  color: var(--line);
  display: flex;
  font-size: 12px;
  font-weight: 900;
  justify-content: center;
  letter-spacing: 1px;
}

/* Terminal & Diff */
.terminal-box {
  background: #020617;
  border: 1px solid #1e293b;
  border-radius: 6px;
  margin-bottom: 8px;
  overflow: hidden;
}

.terminal-bar {
  align-items: center;
  background: #0f172a;
  border-bottom: 1px solid #1e293b;
  display: flex;
  gap: 6px;
  padding: 5px 8px;
}

.terminal-dots {
  display: flex;
  gap: 4px;
}

.dot {
  border-radius: 50%;
  height: 6px;
  width: 6px;
}
.dot--red { background: #ef4444; }
.dot--yellow { background: #f59e0b; }
.dot--green { background: #10b981; }

.terminal-title {
  color: #94a3b8;
  font-family: ui-monospace, SFMono-Regular, monospace;
  font-size: 9.5px;
}

.terminal-badge {
  background: rgba(16, 185, 129, 0.15);
  border: 1px solid rgba(16, 185, 129, 0.4);
  border-radius: 3px;
  color: #34d399;
  font-family: ui-monospace, SFMono-Regular, monospace;
  font-size: 8.5px;
  font-weight: 700;
  margin-left: auto;
  padding: 1px 4px;
}

.terminal-body {
  font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace;
  font-size: 10px;
  line-height: 1.45;
  padding: 6px 8px;
}

.term-line {
  align-items: center;
  display: flex;
  gap: 6px;
}

.term-cmd { color: #f8fafc; }
.term-dots { color: #34d399; font-weight: bold; letter-spacing: 1.5px; }
.term-ok { color: #34d399; margin-left: auto; font-size: 9.5px; }

/* Diff Box */
.diff-box {
  background: #020617;
  border: 1px solid #1e293b;
  border-radius: 6px;
  overflow: hidden;
}

.diff-header {
  align-items: center;
  background: #0f172a;
  border-bottom: 1px solid #1e293b;
  display: flex;
  justify-content: space-between;
  padding: 4px 8px;
}

.diff-file {
  color: #38bdf8;
  font-family: ui-monospace, SFMono-Regular, monospace;
  font-size: 9.5px;
}

.diff-badge {
  color: #34d399;
  font-family: ui-monospace, SFMono-Regular, monospace;
  font-size: 8.5px;
  font-weight: 700;
}

.diff-body {
  font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace;
  font-size: 9.5px;
  line-height: 1.35;
  padding: 5px 8px;
}

.diff-line {
  white-space: pre;
}

.diff-line--ctx {
  color: #64748b;
}

.diff-line--add {
  background: rgba(16, 185, 129, 0.12);
  color: #34d399;
}

/* Execution Tiers Strip */
.execution-tiers {
  align-items: center;
  background: #ffffff;
  border: 1px solid var(--line);
  border-radius: 8px;
  box-shadow: 0 1px 4px rgba(15, 23, 42, 0.03);
  display: flex;
  gap: 8px;
  padding: 6px 12px;
}

.tiers-label {
  color: var(--muted);
  font-size: 10px;
  font-weight: 800;
  letter-spacing: 0.04em;
  text-transform: uppercase;
}

.tier-pill {
  align-items: center;
  background: #f8fafc;
  border: 1px solid #e2e8f0;
  border-radius: 6px;
  display: flex;
  gap: 5px;
  padding: 3px 8px;
}

.tier-pill strong {
  color: #1e293b;
  font-size: 10.5px;
}

.tier-pill small {
  color: #64748b;
  font-size: 9px;
}

.tier-icon {
  font-size: 11px;
}

.tier-arrow {
  color: #cbd5e1;
  font-size: 11px;
}

.tier-pill--hook {
  background: #f0fdfa;
  border-color: #99f6e4;
}
.tier-pill--hook strong { color: #0f766e; }

.tier-pill--ci {
  background: #eff6ff;
  border-color: #bfdbfe;
}
.tier-pill--ci strong { color: #1d4ed8; }

/* Footer Takeaway */
.proof-takeaway {
  align-items: center;
  background: var(--surface);
  border: 1px solid var(--line);
  border-radius: 8px;
  color: var(--ink);
  display: flex;
  font-size: 11.5px;
  gap: 10px;
  padding: 6px 12px;
}

.takeaway-tag {
  background: #ecfdf5;
  border: 1px solid #a7f3d0;
  border-radius: 4px;
  color: #065f46;
  flex-shrink: 0;
  font-size: 9px;
  font-weight: 800;
  letter-spacing: 0.06em;
  padding: 2px 6px;
  text-transform: uppercase;
}
</style>
