<script setup lang="ts">
interface ResourceLink {
  label: string
  url: string
  sub?: string
}

interface ResourceItem {
  category: string
  badgeClass: string
  links: ResourceLink[]
  purpose: string
  isFeatured?: boolean
}

const resources: ResourceItem[] = [
  {
    category: 'Accompagnement',
    badgeClass: 'badge--featured',
    links: [
      {
        label: 'Parcours d\'ateliers pratiques',
        url: 'https://intranet.entreprise.internal/formation-ia',
        sub: 'Portail intranet entreprise',
      },
    ],
    purpose: 'Monter en compétences sur vos vrais cas d\'usage, vos règles et votre stack interne.',
    isFeatured: true,
  },
  {
    category: 'Connecteurs d\'outils',
    badgeClass: 'badge--protocol',
    links: [
      {
        label: 'Model Context Protocol (MCP)',
        url: 'https://modelcontextprotocol.io',
        sub: 'modelcontextprotocol.io',
      },
    ],
    purpose: 'Standard ouvert universel (Linux Foundation) pour connecter l\'agent aux outils (Jira, GitLab, DB).',
  },
  {
    category: 'Consignes & Skills',
    badgeClass: 'badge--rules-skills',
    links: [
      {
        label: 'AGENTS.md & Agent Skills (SKILL.md)',
        url: 'https://agentskills.io',
        sub: 'agentskills.io · Standard ouvert de compétences',
      },
    ],
    purpose: 'Règles permanentes du repo (AGENTS.md) et procédures outillées reproductibles (SKILL.md).',
  },
  {
    category: 'Cycle de dev (SDLC)',
    badgeClass: 'badge--workflow',
    links: [
      { label: 'Spec Kit', url: 'https://github.com/github/spec-kit' },
      { label: 'AIDD', url: 'https://github.com/ai-driven-dev/framework' },
      { label: 'BMAD', url: 'https://docs.bmad-method.org/fr/' },
    ],
    purpose: 'Exemples de structuration : spec → plan → tasks → code (illustrations, hors reco officielle).',
  },
  {
    category: 'Sécurité & Risques',
    badgeClass: 'badge--security',
    links: [
      {
        label: 'OWASP Top 10 for Agentic Apps',
        url: 'https://genai.owasp.org/',
        sub: 'genai.owasp.org',
      },
    ],
    purpose: 'Référentiel mondial des risques : injection de prompts, permissions excessives, supply chain.',
  },
]
</script>

<template>
  <div class="resources-table-wrapper">
    <div class="resources-table">
      <div class="table-header">
        <span class="col-cat">Besoin / Composant</span>
        <span class="col-ref">Standard ou Référence</span>
        <span class="col-purpose">À quoi ça sert concrètement</span>
      </div>

      <div
        v-for="item in resources"
        :key="item.category"
        class="table-row"
        :class="{ 'table-row--featured': item.isFeatured }"
      >
        <div class="col-cat">
          <span class="badge" :class="item.badgeClass">{{ item.category }}</span>
        </div>
        <div class="col-ref">
          <template v-if="item.links.length === 1">
            <a :href="item.links[0].url" target="_blank" rel="noopener noreferrer" class="ref-link">
              <strong>{{ item.links[0].label }}</strong>
              <span v-if="item.links[0].sub" class="ref-url">{{ item.links[0].sub }} ↗</span>
            </a>
          </template>
          <template v-else>
            <div class="links-multi">
              <a
                v-for="l in item.links"
                :key="l.label"
                :href="l.url"
                target="_blank"
                rel="noopener noreferrer"
                class="multi-link-chip"
              >
                <span>{{ l.label }}</span>
                <span class="chip-arrow">↗</span>
              </a>
            </div>
          </template>
        </div>
        <div class="col-purpose">
          <p>{{ item.purpose }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.resources-table-wrapper {
  display: flex;
  flex-direction: column;
  margin-top: 8px;
  width: 100%;
}

.resources-table {
  background: var(--surface);
  border: 1px solid var(--line);
  border-radius: 10px;
  box-shadow: 0 3px 12px rgba(15, 23, 42, 0.04);
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

.table-header {
  background: #f8fafc;
  border-bottom: 1px solid var(--line);
  color: #64748b;
  display: grid;
  font-size: 10px;
  font-weight: 800;
  grid-template-columns: 145px 255px 1fr;
  letter-spacing: 0.08em;
  padding: 8px 14px;
  text-transform: uppercase;
}

.table-row {
  align-items: center;
  border-bottom: 1px solid var(--line);
  display: grid;
  grid-template-columns: 145px 255px 1fr;
  min-height: 46px;
  padding: 8px 14px;
  transition: background-color 0.12s ease;
}

.table-row:last-child {
  border-bottom: none;
}

.table-row:hover {
  background: #f8fafc;
}

.table-row--featured {
  background: #f0fdf4;
  border-left: 4px solid var(--teal);
}

.table-row--featured:hover {
  background: #ecfdf5;
}

.col-cat {
  display: flex;
  align-items: center;
}

.badge {
  border-radius: 5px;
  font-size: 8.5px;
  font-weight: 800;
  letter-spacing: 0.03em;
  padding: 2px 7px;
  text-transform: uppercase;
  white-space: nowrap;
}

.badge--featured {
  background: #dcfce7;
  border: 1px solid #86efac;
  color: #065f46;
}

.badge--protocol {
  background: #ede9fe;
  border: 1px solid #c4b5fd;
  color: #5b21b6;
}

.badge--rules-skills {
  background: #e0f2fe;
  border: 1px solid #7dd3fc;
  color: #0369a1;
}

.badge--workflow {
  background: #fef3c7;
  border: 1px solid #fde68a;
  color: #92400e;
}

.badge--security {
  background: #ffe4e6;
  border: 1px solid #fecdd3;
  color: #9f1239;
}

.col-ref {
  display: flex;
  align-items: center;
  padding-right: 12px;
}

.ref-link {
  color: inherit;
  display: flex;
  flex-direction: column;
  gap: 1px;
  text-decoration: none !important;
}

.ref-link:hover strong {
  color: var(--teal);
  text-decoration: underline;
}

.ref-link strong {
  color: var(--ink);
  font-size: 11.5px;
  font-weight: 700;
  line-height: 1.2;
}

.ref-url {
  color: var(--muted);
  font-family: "JetBrains Mono", monospace;
  font-size: 9px;
  line-height: 1.2;
}

.links-multi {
  align-items: center;
  display: flex;
  gap: 6px;
}

.multi-link-chip {
  align-items: center;
  background: #ffffff;
  border: 1px solid #cbd5e1;
  border-radius: 5px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.04);
  color: #0f172a;
  display: inline-flex;
  font-size: 10.5px;
  font-weight: 700;
  gap: 3px;
  padding: 2px 8px;
  text-decoration: none !important;
  transition: all 0.12s ease;
}

.multi-link-chip:hover {
  background: #f8fafc;
  border-color: #00875a;
  color: #00875a;
  transform: translateY(-1px);
}

.chip-arrow {
  color: #94a3b8;
  font-size: 9px;
}

.col-purpose p {
  color: #334155;
  font-size: 11px;
  line-height: 1.35;
  margin: 0;
}

.table-row--featured .col-purpose p {
  color: #065f46;
  font-weight: 600;
}
</style>
