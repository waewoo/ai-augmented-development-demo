# Premiers pas vers le développement augmenté par l’IA

Dépôt privé de préparation d’une présentation et d’une démonstration reproductible sur le développement augmenté par l’IA.

Le projet met en regard :

- une petite API FastAPI réellement testable ;
- des `rules` et des `skills` Kilo Code explicites et versionnés ;
- un workflow **comprendre → planifier → approuver → implémenter → vérifier → revoir** ;
- des prompts reproductibles et des états de secours locaux ;
- une présentation Slidev, ses composants, ses notes et ses exports de diffusion.

Kilo Code est l’outil utilisé pendant la démonstration parce qu’il est maîtrisé par le présentateur. Il ne constitue pas une recommandation exclusive : les principes présentés sont transposables à d’autres outils (Cursor, Copilot, Claude Code, etc.) et chaque équipe doit employer les modèles, permissions et services approuvés par son organisation.

## Sommaire

- [Démarrage rapide](#démarrage-rapide)
- [Structure du dépôt](#structure-du-dépôt)
- [API de démonstration](#api-de-démonstration)
- [Présentation Slidev](#présentation-slidev)
- [Démonstrations en direct](#démonstrations-en-direct)
- [États de secours et tags Git](#états-de-secours-et-tags-git)
- [Contrôles et CI](#contrôles-et-ci)
- [Évaluation de l’organisation](#évaluation-de-lorganisation)
- [Sécurité](#sécurité)
- [Licence](#licence)

## Démarrage rapide

Les commandes ci-dessous sont à exécuter depuis la racine du dépôt.

### Prérequis

- Python 3.10 minimum ; Python 3.12 est recommandé pour correspondre à la CI ;
- Node.js 20.19+ et npm, uniquement nécessaires pour travailler sur la présentation ;
- Git.

### Installer et vérifier l’API

```bash
python -m venv .venv
source .venv/bin/activate
make demo-install
make demo-check
```

`make` ou `make help` affiche la liste des commandes disponibles. La cible par défaut est volontairement `help` : elle ne lance pas les tests implicitement.

### Lancer l’API

```bash
make demo-run-api
# ou directement : uvicorn app.main:app --reload
```

Puis ouvrir la documentation interactive : <http://127.0.0.1:8000/docs>.

## Structure du dépôt

### Vue d’ensemble

```text
.
├── .github/workflows/       CI GitHub Actions
├── .kilo/                   rules et skills du projet
├── app/                     code de l’API FastAPI
├── tests/                   tests pytest
├── docs/                    documentation, fiches de démo et fichiers de secours
├── presentation/            source Slidev et exports de la présentation
├── kilo.jsonc               configuration de chargement Kilo Code
├── Makefile                 commandes de validation et de présentation
├── pyproject.toml           métadonnées et dépendances Python
└── LICENSE                  licence MIT
```

### Rôle des répertoires

| Répertoire | Rôle | Contenu principal |
| --- | --- | --- |
| `.github/workflows/` | Automatisation distante | `ci.yml` installe le projet et exécute `make demo-check` sur les push et pull requests. |
| `.kilo/rules/` | Instructions persistantes du projet | Architecture, tests, restitution et sécurité. Elles orientent l’agent mais ne remplacent ni les permissions ni la revue humaine. |
| `.kilo/skills/` | Procédures réutilisables | `plan-change`, `implement-change`, `review-change` et `document-architecture`, chacun avec son `SKILL.md`. |
| `app/` | Application Python | `main.py` pour HTTP, `models.py` pour les types métier et `service.py` pour la sélection des tâches. |
| `tests/` | Vérification automatisée | Tests API et non-régression exécutés par pytest. |
| `docs/` | Documentation & Démos | Fiches de démo (`DEMOS.md`, `demo-1.md` à `demo-4.md`), architecture (`ARCHITECTURE.md`), ressources et fichiers de secours (`docs/demo-assets/`). |
| `presentation/` | Projet Slidev autonome | `slides.md`, composants Vue, styles, scripts d’export, dépendances npm et livrables PDF/PPTX/PNG. |

### Fichiers importants à la racine

- [`kilo.jsonc`](kilo.jsonc) déclare les quatre rules et le répertoire des skills chargés par Kilo Code ;
- [`pyproject.toml`](pyproject.toml) décrit le paquet Python, ses dépendances et la configuration de pytest, Ruff et mypy ;
- [`Makefile`](Makefile) fournit le point d’entrée commun pour les contrôles Python et les opérations Slidev ;
- [`README.md`](README.md) donne la vue d’ensemble ; les explications opérationnelles détaillées vivent dans `docs/`.

## API de démonstration

L’API expose `GET /tasks` avec trois tâches en mémoire. Le comportement démontré est volontairement petit :

- sans paramètre, les trois tâches sont retournées ;
- avec `status=todo`, `status=doing` ou `status=done`, seules les tâches correspondantes sont retournées ;
- avec une valeur inconnue, FastAPI répond `422` grâce au type fermé du statut ;
- aucune persistance ni dépendance externe n’est introduite.

La séparation est volontaire : la couche HTTP reste dans `app/main.py`, les modèles dans `app/models.py` et la sélection dans `app/service.py`.

## Présentation Slidev

La source de vérité de la présentation est [`presentation/slides.md`](presentation/slides.md). Les composants Vue réutilisables sont dans `presentation/components/`, les styles dans `presentation/styles/` et les scripts techniques dans `presentation/scripts/`.

### Installer et démarrer

```bash
make slides-install
make slides-dev
```

Pour choisir le port :

```bash
make slides-dev SLIDES_ARGS="--port 3030"
```

### MCP et skill Slidev

Slidev fournit un serveur MCP intégré à la CLI : aucun paquet MCP séparé n’est nécessaire. Le skill officiel apporte à l’agent les bonnes pratiques Slidev pour la syntaxe Markdown, les layouts, les animations, les composants et les exports. Il est installé dans l’environnement Codex ; le dépôt ne contient pas de configuration agent spécifique.

```bash
make slides-mcp-install    # installe la CLI et affiche la configuration MCP
make slides-mcp-info       # rappelle les modes HTTP et stdio
make slides-mcp             # lance le serveur MCP stdio au premier plan
```

Avec le serveur de développement actif, l’endpoint MCP HTTP est `http://localhost:3030/__mcp`. Le serveur stdio agit directement sur `presentation/slides.md` et reste attaché au terminal. Pour un autre agent compatible avec le gestionnaire `skills`, utiliser `npx skills add slidevjs/slidev`.

Références officielles : [MCP Slidev](https://sli.dev/features/mcp) et [Slidev — travailler avec l’IA](https://sli.dev/guide/work-with-ai).

### Vérifier et exporter

```bash
make slides-check            # build Slidev et contrôle du deck
make slides-build            # build web statique dans presentation/dist/
make slides-pdf              # PDF
make slides-pptx             # PPTX
make slides-pptx-editable    # PPTX éditable
make slides-png              # captures PNG
make slides-export           # tous les formats de diffusion
make slides                  # vérification puis tous les exports
```

Les exports sont placés dans `presentation/exports/` et les captures dans `presentation/public/screenshots/`. Ils sont conservés dans Git pour permettre une diffusion ou une répétition hors ligne ; `node_modules/`, `dist/` et les nouveaux artefacts locaux restent ignorés par `presentation/.gitignore`.

Le script d’export retire les directives `v-click` dans une copie temporaire afin de produire des livrables statiques de 18 pages, tandis que la source web conserve ses animations.

## Démonstrations en direct

Le parcours pédagogique de la session (42 min) intègre 4 démonstrations en direct réparties tout au long des 18 slides, avec des fiches individuelles très simples à suivre contenant les prompts prêts au copier/coller :

| Démo | Slide & Durée | Fiche pas-à-pas | Objectif & Compétences démontrées |
| :--- | :--- | :--- | :--- |
| **Démo 1** | Slide 07 (3 min) | [`docs/demo-1.md`](docs/demo-1.md) | **Le choc des Rules :** Même prompt envoyé sans rules (code chaotique) puis avec `AGENTS.md` (refus de coder sans plan, contrainte 422). |
| **Démo 2** | Slide 09 (3 min) | [`docs/demo-2.md`](docs/demo-2.md) | **Dans le ventre d'un Skill :** Inspection de `SKILL.md` et déclenchement sémantique de `plan-change` par langage naturel. |
| **Démo 3** | Slide 11 (4 min) | [`docs/demo-3.md`](docs/demo-3.md) | **Skill + MCP Confluence :** Génération de documentation vivante (`document-architecture`) avec schéma Mermaid interactif et matrice des routes dans [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md). |
| *(Pont)* | Slide 12 (2 min) | *(Slide conceptuelle)* | **Contrôles déterministes & Séparation des pouvoirs :** Pourquoi le résumé de l'agent n'est pas une preuve et pourquoi un agent ne doit pas auditer son propre code. |
| **Démo 4** | Slide 13 (4 min) | [`docs/demo-4.md`](docs/demo-4.md) | **L'Agent Reviewer :** Duel d'agents avec `review-change` auditant le diff Git de manière impartiale (rejet 422, tests, `make demo-check`). |

- Le sommaire des démos est consultable dans [`docs/DEMOS.md`](docs/DEMOS.md).
- Les fiches de démo directes sont [`docs/demo-1.md`](docs/demo-1.md), [`docs/demo-2.md`](docs/demo-2.md), [`docs/demo-3.md`](docs/demo-3.md) et [`docs/demo-4.md`](docs/demo-4.md).
- Le conducteur chronologique pas à pas et le guide complet sont dans [`docs/DEMOS.md`](docs/DEMOS.md).
- Les notes orateur sont directement intégrées dans le support Slidev [`presentation/slides.md`](presentation/slides.md) (mode présentateur).

## À quoi servent les fichiers de secours (`docs/demo-assets/`) ?

Le dossier [`docs/demo-assets/`](docs/demo-assets/) contient des références locales pour que la démonstration reste présentable même si l’agent, l’interface ou le réseau ne répond pas comme prévu :

- `demo1-secours-sans-rules.md` : exemple de réponse floue d'un agent codant sans `AGENTS.md` ;
- `demo1-secours-avec-rules.md` : réponse cadrée refusant d'écrire sans plan approuvé ;
- `demo2-secours-plan.md` : plan d'action structuré complet généré par `plan-change` ;
- `demo3-secours-architecture.md` : documentation d'architecture avec schéma Mermaid interactif ;
- `demo4-secours-diff.md` : diff Git minimal et propre de l'implémentation ;
- `demo4-secours-checks.md` : preuve machine de validation déterministe (`make demo-check`) ;
- `demo4-secours-review.md` : rapport d'audit structuré généré par l'agent Reviewer (`review-change`).

Ils ne remplacent pas les contrôles réels : le conducteur demande de signaler clairement lorsqu’un fichier de secours est utilisé.

## États de secours et tags Git

Les tags permettent de revenir à des états connus sans dépendre d’une génération en direct :

| Tag | État |
| --- | --- |
| `demo/start` | Scénario initial, avant l’ajout du filtre `status`. |
| `demo/implemented` | Modification approuvée implémentée et testée. |
| `demo/review` | État de référence pour la revue finale. |
| `demo/slidev` | Présentation Slidev devenue la source de vérité, avec ses exports contrôlés. |

Avant de changer de vue :

```bash
git status --short
```

Si l’arbre est propre, un état peut être ouvert en lecture avec :

```bash
git switch --detach demo/start
```

Pour préserver le worktree principal, préparer plutôt une copie isolée via le Makefile :

```bash
make demo-create-worktree WORKTREE=../ai-augmented-development-demo-start
```

La commande refuse d’écraser un chemin existant. Ne pas utiliser `git reset --hard` pendant la démonstration.

## Contrôles et CI

`make demo-check` exécute les contrôles Python suivants :

```text
pytest
ruff check .
ruff format --check .
mypy app
```

Les dépendances de test utilisent `httpx2` et une version d’AnyIO compatible avec Starlette afin d’éviter les warnings de dépréciation du `TestClient` dans l’environnement Python 3.14.

La CI GitHub Actions reprend `make demo-check` avec Python 3.12 et des permissions de contenu en lecture seule. La vérification Slidev reste une commande locale dédiée (`make slides-check`) car le workflow CI actuel couvre le socle Python.

## Évaluation de l’organisation

La séparation actuelle est adaptée au but du dépôt : le code applicatif, les tests, la documentation de séance, la configuration de l’agent et les livrables de présentation ont des responsabilités distinctes. Aucune réorganisation de répertoires n’est nécessaire pour la démonstration.

Quelques choix sont intentionnels :

- `docs/demo-assets/` est un nom adapté à des fixtures pédagogiques ; les renommer en `fixtures/` ferait perdre leur intention de secours de démonstration ;
- `presentation/` possède son propre `package.json` et `package-lock.json`, car Slidev est un sous-projet Node autonome ;
- les exports finaux sont suivis dans Git pour permettre une présentation sans régénération, même si les artefacts intermédiaires restent ignorés ;
- `.kilo/` est spécifique à l’outil de démonstration et ne doit pas être confondu avec le code métier ;
- les caches Python et le répertoire `*.egg-info` sont locaux et ignorés, pas des éléments de l’architecture du projet.

Pour une reproductibilité Python encore plus stricte dans une future évolution, un lockfile ou une stratégie de contraintes Python pourrait être ajouté. Ce n’est pas nécessaire pour le scénario actuel, qui fixe déjà les grandes bornes dans `pyproject.toml`.

## Sécurité

Ce dépôt ne contient aucun secret et ne doit pas en recevoir. Les prompts, rules, logs, captures et exemples doivent rester synthétiques. Les rules orientent l’agent, mais ne remplacent ni les permissions, ni les tests, ni la CI, ni la revue humaine.

Voir [`docs/resources.md`](docs/resources.md) pour les références officielles utilisées dans la présentation.

## Licence

Le contenu de démonstration est distribué sous licence MIT. Les liens vers les produits, frameworks et outils tiers restent soumis à leurs propres conditions.
