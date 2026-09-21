<script setup lang="ts">
const connectors = [
  {
    tag: 'JIRA',
    name: 'Jira / Linear',
    role: 'Spécifications & User Stories',
    server: 'mcp-server-jira',
    color: 'blue',
    bullets: [
      'Lit directement le ticket brut et ses critères d’acceptation',
      'Identifie les cas d’erreur oubliés sans copier-coller manuel',
    ],
  },
  {
    tag: 'DOCS',
    name: 'Confluence / Notion',
    role: 'Architecture & Chartes internes',
    server: 'mcp-server-confluence',
    color: 'emerald',
    bullets: [
      'Consulte les ADRs (Architecture Decision Records) d’équipe',
      'Évite de réinventer un module ou une lib interne déjà existante',
    ],
  },
  {
    tag: 'GIT',
    name: 'GitLab / GitHub',
    role: 'CI/CD & Merge Requests',
    server: 'mcp-server-gitlab',
    color: 'amber',
    bullets: [
      'Récupère les logs du job CI en échec pour comprendre la panne',
      'Prépare le résumé de la Merge Request aligné sur le diff Git',
    ],
  },
  {
    tag: 'DATA',
    name: 'PostgreSQL / Logs',
    role: 'Schémas & Observabilité',
    server: 'mcp-server-postgres',
    color: 'indigo',
    bullets: [
      'Inspecte les tables et types réels de la base de données',
      'Vérifie la compatibilité des migrations sans deviner le schéma',
    ],
  },
]
</script>

<template>
  <div class="mcp-ecosystem">
    <!-- Protocol Banner -->
    <div class="mcp-header-bar">
      <div class="mcp-pill">
        <span class="mcp-pill__tag">Standard ouvert</span>
        <strong>Model Context Protocol (MCP)</strong>
      </div>
      <span class="mcp-header-arrow">➔</span>
      <p class="mcp-header-desc">
        Le « port USB-C » de l’IA : une interface standardisée pour connecter l’agent à vos outils d’entreprise sans code sur-mesure.
      </p>
    </div>

    <!-- Connectors Grid -->
    <div class="connectors-grid">
      <div
        v-for="item in connectors"
        :key="item.name"
        class="connector-card"
        :class="`connector-card--${item.color}`"
      >
        <div class="connector-header">
          <span class="connector-tag" :class="`connector-tag--${item.color}`">{{ item.tag }}</span>
          <div class="connector-titles">
            <strong>{{ item.name }}</strong>
            <span class="connector-role">{{ item.role }}</span>
          </div>
        </div>

        <div class="connector-server">
          <code>{{ item.server }}</code>
        </div>

        <ul class="connector-bullets">
          <li v-for="(b, i) in item.bullets" :key="i">{{ b }}</li>
        </ul>
      </div>
    </div>

    <!-- Enterprise Guardrail Banner -->
    <div class="mcp-guardrail">
      <div class="guardrail-badge">GARDE-FOU ENTREPRISE</div>
      <p>
        <strong>Lecture Seule (Read-Only) par défaut :</strong> l’agent consulte les tickets, la doc et les schémas à la source, mais <u>ne modifie, ne commente et ne clôture aucun ticket</u> sans autorisation humaine expresse.
      </p>
    </div>
  </div>
</template>

<style scoped>
.mcp-ecosystem {
  display: flex;
  flex-direction: column;
  gap: 12px;
  margin: 10px auto 0;
  max-width: 1040px;
}

/* Protocol Banner */
.mcp-header-bar {
  align-items: center;
  background: var(--surface);
  border: 1px solid var(--line);
  border-radius: 12px;
  box-shadow: 0 2px 8px rgba(15, 23, 42, 0.03);
  display: flex;
  gap: 14px;
  padding: 8px 14px;
}

.mcp-pill {
  align-items: center;
  background: #f1f5f9;
  border: 1px solid #cbd5e1;
  border-radius: 8px;
  display: flex;
  gap: 8px;
  padding: 4px 10px;
  white-space: nowrap;
}

.mcp-pill__tag {
  background: var(--teal);
  border-radius: 4px;
  color: #ffffff;
  font-size: 9px;
  font-weight: 800;
  letter-spacing: 0.06em;
  padding: 1px 5px;
  text-transform: uppercase;
}

.mcp-pill strong {
  color: var(--ink);
  font-size: 12.5px;
}

.mcp-header-arrow {
  color: var(--teal);
  font-weight: 800;
}

.mcp-header-desc {
  color: var(--muted);
  font-size: 11.5px;
  line-height: 1.35;
  margin: 0;
}

/* Grid */
.connectors-grid {
  display: grid;
  gap: 12px;
  grid-template-columns: repeat(4, 1fr);
}

.connector-card {
  background: var(--surface);
  border: 1px solid var(--line);
  border-radius: 12px;
  box-shadow: 0 4px 12px rgba(15, 23, 42, 0.03);
  display: flex;
  flex-direction: column;
  gap: 8px;
  min-height: 200px;
  padding: 12px 12px 14px;
  transition: all 0.15s ease;
}

.connector-card:hover {
  border-color: #cbd5e1;
  box-shadow: 0 6px 18px rgba(15, 23, 42, 0.06);
  transform: translateY(-2px);
}

.connector-card--blue {
  border-top: 4px solid #2563eb;
}
.connector-card--emerald {
  border-top: 4px solid var(--teal);
}
.connector-card--amber {
  border-top: 4px solid #d97706;
}
.connector-card--indigo {
  border-top: 4px solid #4f46e5;
}

.connector-tag {
  border-radius: 6px;
  font-family: ui-monospace, SFMono-Regular, monospace;
  font-size: 10px;
  font-weight: 800;
  letter-spacing: 0.05em;
  padding: 3px 6px;
  white-space: nowrap;
}

.connector-tag--blue { background: #dbeafe; color: #1d4ed8; }
.connector-tag--emerald { background: #d1fae5; color: #047857; }
.connector-tag--amber { background: #fef3c7; color: #b45309; }
.connector-tag--indigo { background: #e0e7ff; color: #4338ca; }

.connector-titles {
  display: flex;
  flex-direction: column;
  gap: 1px;
}

.connector-titles strong {
  color: var(--ink);
  font-size: 13.5px;
  line-height: 1.2;
}

.connector-role {
  color: var(--muted);
  font-size: 10px;
  font-weight: 600;
  line-height: 1.2;
}

.connector-server {
  background: #f8fafc;
  border: 1px dashed #cbd5e1;
  border-radius: 6px;
  padding: 3px 6px;
}

.connector-server code {
  color: #475569;
  font-size: 9.5px;
}

.connector-bullets {
  display: flex;
  flex-direction: column;
  gap: 6px;
  list-style: none;
  margin: 2px 0 0;
  padding: 0;
}

.connector-bullets li {
  color: #334155;
  font-size: 10.5px;
  line-height: 1.35;
  position: relative;
  padding-left: 11px;
}

.connector-bullets li::before {
  color: var(--teal);
  content: '•';
  font-weight: bold;
  left: 0;
  position: absolute;
}

/* Guardrail */
.mcp-guardrail {
  align-items: center;
  background: #fffbeb;
  border: 1px solid #fde68a;
  border-left: 4px solid #d97706;
  border-radius: 10px;
  display: flex;
  gap: 12px;
  padding: 8px 14px;
}

.guardrail-badge {
  background: #fef3c7;
  border: 1px solid #fcd34d;
  border-radius: 6px;
  color: #92400e;
  font-size: 9.5px;
  font-weight: 800;
  letter-spacing: 0.04em;
  padding: 2px 6px;
  text-transform: uppercase;
  white-space: nowrap;
}

.mcp-guardrail p {
  color: #78350f;
  font-size: 11px;
  line-height: 1.35;
  margin: 0;
}

.mcp-guardrail strong {
  color: #92400e;
}
</style>
