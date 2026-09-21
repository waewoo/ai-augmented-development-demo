<script setup lang="ts">
const items = [
  {
    category: 'Moteur',
    type: 'Modèle (LLM)',
    tagClass: 'badge--model',
    desc: 'Cerveau probabiliste : prédit du texte et génère du code.',
    examples: 'Claude 3.7 Sonnet · GPT-4o · Llama 3',
    access: 'Aucun accès direct',
    accessSub: 'Ne lit ni n’exécute rien seul',
    icon: '🧠',
  },
  {
    category: 'Web',
    type: 'Chat',
    tagClass: 'badge--chat',
    desc: 'Conversation textuelle ou connecteurs d’API distants.',
    examples: 'Claude.ai · ChatGPT',
    access: 'Distant / Navigateur',
    accessSub: 'Pas d’accès au terminal local',
    icon: '💬',
  },
  {
    category: 'Extension IDE',
    type: 'Assistant',
    tagClass: 'badge--assistant',
    desc: 'Complétion contextuelle au fil de votre frappe.',
    examples: 'GitHub Copilot · Cursor Tab',
    access: '1 fichier actif',
    accessSub: 'Suggestion sous votre curseur',
    icon: '✨',
  },
  {
    category: 'CLI ou IDE',
    type: 'Agent de code',
    tagClass: 'badge--agent',
    desc: 'Client outillé : explore, planifie, modifie et exécute.',
    examples: 'Claude Code (CLI) · Cursor · IBM Bob · Kilo Code',
    access: 'Tout le dépôt + terminal',
    accessSub: 'Boucle autonome : édition et tests',
    icon: '⚡',
  },
]
</script>

<template>
  <div class="matrix-wrapper">
    <div class="matrix-table">
      <div class="matrix-header">
        <span class="col-type">Niveau / Rôle</span>
        <span class="col-desc">Ce que c'est</span>
        <span class="col-examples">Exemples concrets</span>
        <span class="col-access">Accès &amp; Pouvoir sur votre code</span>
      </div>

      <div
        v-for="item in items"
        :key="item.type"
        class="matrix-row"
        :class="{ 'matrix-row--agent': item.category === 'CLI ou IDE' }"
      >
        <div class="col-type">
          <span class="row-icon">{{ item.icon }}</span>
          <div class="type-info">
            <strong>{{ item.type }}</strong>
            <span class="category-badge" :class="item.tagClass">{{ item.category }}</span>
          </div>
        </div>

        <div class="col-desc">
          <p>{{ item.desc }}</p>
        </div>

        <div class="col-examples">
          <code class="example-code">{{ item.examples }}</code>
        </div>

        <div class="col-access">
          <span class="access-pill" :class="{ 'access-pill--agent': item.category === 'CLI ou IDE' }">
            {{ item.access }}
          </span>
          <small class="access-sub">{{ item.accessSub }}</small>
        </div>
      </div>
    </div>

    <!-- Interactive question footer -->
    <SlideQuestion
      variant="emerald"
      tag="Question"
      question="À partir de quel moment une IA devient-elle un agent de dev IA ?"
      answer="Quand le client lui donne des outils : accès au dépôt, au terminal et à des commandes autorisées. Le modèle seul n’est pas un agent."
    />
  </div>
</template>

<style scoped>
.matrix-wrapper {
  display: flex;
  flex-direction: column;
  gap: 8px;
  margin-top: 8px;
  width: 100%;
}

.matrix-table {
  background: var(--surface);
  border: 1px solid var(--line);
  border-radius: 14px;
  box-shadow: 0 4px 14px rgba(15, 23, 42, 0.04);
  display: flex;
  flex-direction: column;
  overflow: hidden;
  transition: all 0.15s ease;
}

.matrix-table:hover {
  border-color: #a5b4fc;
  box-shadow: 0 8px 22px rgba(30, 64, 175, 0.08);
}

.matrix-header {
  align-items: center;
  background: #f8fafc;
  border-bottom: 1px solid var(--line);
  color: #64748b;
  display: grid;
  font-size: 11px;
  font-weight: 750;
  gap: 14px;
  grid-template-columns: 200px 1.2fr 1.3fr 1fr;
  letter-spacing: 0.06em;
  padding: 6px 16px;
  text-transform: uppercase;
}

.matrix-row {
  align-items: center;
  border-bottom: 1px solid #f1f5f9;
  display: grid;
  gap: 14px;
  grid-template-columns: 200px 1.2fr 1.3fr 1fr;
  padding: 7px 16px;
  transition: background 0.15s ease;
}

.matrix-row:last-child {
  border-bottom: none;
}

.matrix-row--agent {
  background: #fcfdfc;
  border-left: 3px solid var(--teal);
}

.col-type {
  align-items: center;
  display: flex;
  gap: 10px;
}

.row-icon {
  font-size: 20px;
}

.type-info {
  display: flex;
  flex-direction: column;
  gap: 2px;
}

.type-info strong {
  color: var(--ink);
  font-size: 13.5px;
  font-weight: 750;
}

.category-badge {
  border-radius: 4px;
  font-size: 10px;
  font-weight: 700;
  padding: 1px 6px;
  text-transform: uppercase;
  width: fit-content;
}

.badge--model {
  background: #eff6ff;
  border: 1px solid #bfdbfe;
  color: #1d4ed8;
}

.badge--chat {
  background: #f1f5f9;
  border: 1px solid #cbd5e1;
  color: #475569;
}

.badge--assistant {
  background: #f5f3ff;
  border: 1px solid #ddd6fe;
  color: #6d28d9;
}

.badge--agent {
  background: #ecfdf5;
  border: 1px solid #a7f3d0;
  color: #047857;
}

.col-desc p {
  color: #334155;
  font-size: 12.5px;
  line-height: 1.35;
  margin: 0;
}

.col-examples {
  display: flex;
  align-items: center;
}

.example-code {
  background: #f8fafc;
  border: 1px solid #e2e8f0;
  border-radius: 6px;
  color: #0f172a;
  font-family: "JetBrains Mono", monospace;
  font-size: 11px;
  font-weight: 600;
  padding: 4px 8px;
  width: 100%;
}

.col-access {
  display: flex;
  flex-direction: column;
  gap: 2px;
}

.access-pill {
  background: #f1f5f9;
  border-radius: 999px;
  color: #475569;
  font-size: 11px;
  font-weight: 700;
  padding: 2px 8px;
  width: fit-content;
}

.access-pill--agent {
  background: #dcfce7;
  color: #15803d;
}

.access-sub {
  color: #64748b;
  font-size: 10.5px;
}

/* Takeaway Banner */
.matrix-takeaway {
  align-items: center;
  background: #f0fdf4;
  border: 1px solid #bbf7d0;
  border-left: 4px solid var(--teal);
  border-radius: 10px;
  box-shadow: 0 2px 8px rgba(0, 135, 90, 0.05);
  display: flex;
  gap: 14px;
  padding: 8px 16px;
  transition: all 0.15s ease;
}

.matrix-takeaway:hover {
  border-color: #86efac;
  border-left-color: var(--teal);
  box-shadow: 0 6px 18px rgba(0, 135, 90, 0.08);
  transform: translateY(-1px);
}

.takeaway-badge {
  background: #00875a;
  border-radius: 999px;
  color: #ffffff;
  font-size: 10.5px;
  font-weight: 800;
  letter-spacing: 0.06em;
  padding: 3px 10px;
  text-transform: uppercase;
  white-space: nowrap;
}

.matrix-takeaway p {
  color: #1e293b;
  font-size: 12px;
  line-height: 1.35;
  margin: 0;
}

.matrix-takeaway strong {
  color: #0f172a;
}
</style>
