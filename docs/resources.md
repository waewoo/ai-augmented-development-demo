# Ressources vérifiées

Vérification effectuée le **21 septembre 2026**. Les liens ci-dessous sont des pages officielles ou les dépôts officiels des projets. Les fonctionnalités peuvent évoluer : revalider avant une nouvelle session.

## Outils et protocoles

- [Kilo Code — règles personnalisées](https://kilo.ai/docs/customize/custom-rules) et [skills](https://kilo.ai/docs/customize/skills) : règles de projet via `instructions`, skills `SKILL.md` avec frontmatter.
- [Continue Docs](https://docs.continue.dev/) : assistant open source pour VS Code et JetBrains ; la documentation décrit notamment les modes Chat, Plan et Agent.
- [OpenCode Docs](https://opencode.ai/en/docs) : agent de développement open source utilisable en terminal, application ou extension IDE.
- [IBM Bob Docs](https://bob.ibm.com/docs/ide) : partenaire de développement SDLC ; la documentation décrit modes, subagents et skills.
- [Model Context Protocol](https://modelcontextprotocol.io/) : protocole standard pour exposer des outils et sources à des applications d’IA.

## Frameworks de workflow

- [GitHub Spec Kit](https://github.com/github/spec-kit) : processus structuré avec spécification, plan, tâches, implémentation et convergence ; les intégrations supportées peuvent évoluer.
- [OpenSpec](https://openspec.dev/) : framework de spécifications avec un chemin explore → propose → apply → verify/archive.
- [BMAD Method](https://docs.bmad-method.org/) : workflows et skills organisés par rôles et chemins de planification/implémentation.
- [AIDD Framework](https://github.com/ai-driven-dev/framework) : framework open source français présenté comme une méthode de cycle de développement avec skills, agents, commandes et règles. La portée exacte doit être revalidée avant de le présenter comme solution adaptée à une organisation donnée.

## Prompts, instructions et skills

- [Agent Skills](https://github.com/agentskills/agentskills) : spécification ouverte du format `SKILL.md`.
- [Anthropic Skills](https://github.com/anthropics/skills) : exemples de skills et patrons d’organisation ; le dépôt recommande lui-même de les tester avant tout usage critique.
- [Awesome GitHub Copilot](https://github.com/github/awesome-copilot) : collection communautaire de prompts, instructions, agents, hooks et skills.

Ces dépôts servent de points de départ, pas de listes de confiance. Avant toute installation, lire les instructions et le code embarqué, vérifier l’origine et la version, puis tester dans un environnement isolé avec le minimum de permissions.

## Sécurité des agents et de leur chaîne d’approvisionnement

- [OWASP Top 10 for Agentic Applications](https://genai.owasp.org/resource/owasp-top-10-for-agentic-applications-for-2026/) : risques liés notamment aux instructions injectées, aux outils et aux dépendances de l’agent.
- [Checklist de sécurité du dépôt](security-checklist.md) : contrôles à effectuer avant la démonstration ou l’adoption d’une ressource externe.

## Stack de démonstration

- [FastAPI](https://fastapi.tiangolo.com/): framework Python pour APIs basé sur les annotations de type.
- [pytest](https://docs.pytest.org/en/stable/): framework de tests Python.
- [Ruff](https://docs.astral.sh/ruff/): linter et formateur Python.

La présentation rappelle systématiquement que chacun doit employer les outils, modèles, permissions et services approuvés par son organisation.
