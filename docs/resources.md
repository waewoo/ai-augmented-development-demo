# Ressources vérifiées

Vérification effectuée le **21 septembre 2026**. Les liens ci-dessous sont des pages officielles ou les dépôts officiels des projets. Les fonctionnalités peuvent évoluer : revalider avant une nouvelle session.

## Outils et protocoles

- [Kilo Code — règles personnalisées](https://kilo.ai/docs/customize/custom-rules) et [skills](https://kilo.ai/docs/customize/skills) : règles de projet via `instructions`, skills `SKILL.md` avec frontmatter.
- [Continue Docs](https://docs.continue.dev/) : assistant open source pour VS Code et JetBrains ; la documentation décrit notamment les modes Chat, Plan et Agent.
- [OpenCode Docs](https://opencode.ai/en/docs) : agent de développement open source utilisable en terminal, application ou extension IDE.
- [IBM Bob Docs](https://bob.ibm.com/docs/ide) : partenaire de développement SDLC ; la documentation décrit modes, subagents et skills.
- [Model Context Protocol](https://modelcontextprotocol.io/) : protocole standard pour exposer des outils et sources à des applications d’IA.

---

## 📖 Glossaire & Repères clés de l'IA de développement

Ce tableau synthétique clarifie le vocabulaire technique essentiel pour l'équipe et dissipe les confusions fréquentes :

| Concept | Ce que c'est concrètement | Ce que ce n'est PAS | Rôle dans le projet |
| :--- | :--- | :--- | :--- |
| **Modèle (LLM)** | Moteur probabiliste qui prédit du texte et génère du code (ex: Claude 3.7, GPT-4o). | Un agent autonome capable d'exécuter des actions seul. | Le "cerveau" de calcul textuel. |
| **Agent de code** | Client (CLI ou extension IDE) qui donne au modèle des outils (fichiers, terminal) dans une boucle d'action continue. | Un simple assistant d'autocomplétion ou un chatbot web. | L'exécuteur outillé qui lit, planifie, édite et teste. |
| **Boucle d'action (Tool loop)** | Cycle récurrent de l'agent : *Observer le contexte → Décider d'une action → Appeler un outil → Lire le résultat de la machine*. | Une génération magique d'un seul bloc sans feedback. | Le mécanisme fondamental qui différencie un agent d'un chatbot. |
| **Contexte** | L'ensemble des informations fournies au modèle pour cadrer sa réflexion : code existant, arborescence, conventions, tests. | Un prompt géant de 100 lignes qu'on recopie à la main à chaque échange. | La matière première qui détermine la pertinence de la réponse. |
| **Rule (`AGENTS.md`)** | Fichier de consignes permanentes, versionné dans Git, injecté automatiquement au démarrage de chaque session. | Un script exécutable ou une procédure pas-à-pas temporaire. | Le cadre passif continu (stack, formatage, commandes obligatoires, lecture seule). |
| **Skill (`SKILL.md`)** | Procédure d'équipe outillée et reproductible pour réaliser une tâche précise (ex: planifier, auditer un diff). | Un simple prompt enregistré ou un plugin fermé inaccessible. | La méthode active à la demande (déclenchée par slash-command ou matching sémantique). |
| **Outil (Tool)** | Capacité concrète accordée à l'agent : lire un fichier, éditer des lignes, exécuter une commande bash locale. | Une fonction interne au modèle ou une boîte noire. | Les "mains" de l'agent qui interagissent avec la machine. |
| **MCP (Model Context Protocol)** | Standard ouvert permettant à l'agent de se connecter à des outils et sources d'entreprise (Jira, Confluence, GitLab, DB). | Un prérequis obligatoire pour utiliser un agent sur son code local. | L'interface universelle de connecteurs externes (lecture seule par défaut). |
| **Hooks** | Points d'interception configurés (ex: pre-commit Git, hook CLI) pour déclencher des vérifications ou bloquer des actions non conformes. | Des instructions en langage naturel pour le LLM. | Une barrière machine déterministe qui intercepte l'exécution. |
| **Validation déterministe** | Commandes machine locales (`make demo-check` : pytest, ruff, mypy) qui retournent un code de sortie binaire (0 ou erreur). | Une affirmation textuelle du modèle (*« Tout fonctionne, les tests passent »*). | La seule autorité de preuve formelle de bon fonctionnement. |
| **Sub-agent / Agent Reviewer** | Session d'agent distincte dédiée à une tâche spécialisée (ex: audit critique et impartial du diff avant commit). | Une garantie absolue d'absence de bugs ou un substitut à la validation machine. | Un copilote de relecture structuré qui prépare la décision humaine. |
| **SDLC augmenté** | Cycle de développement logiciel où l'humain cadre le besoin, délègue l'exécution à l'agent, et arbitre sur des preuves machine. | Un développement 100% autonome sans ingénieur. | La méthodologie d'ingénierie moderne sous contrôle humain strict. |

---

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
