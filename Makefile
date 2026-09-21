.DEFAULT_GOAL := help

.PHONY: help demo-install demo-check demo-test demo-lint demo-format-check demo-format demo-types \
	demo-run-api demo-create-worktree demo-reset \
	slides-install slides-dev slides-serve slides-build slides-check \
	slides-pdf slides-pptx slides-pptx-editable slides-png slides-export slides \
	slides-mcp-install slides-mcp-info slides-mcp slides-ai-setup

# -----------------------------------------------------------------------------
# Aide catégorisée
# -----------------------------------------------------------------------------

help: ## Affiche cette aide catégorisée
	@awk 'BEGIN {FS = ":.*##"; printf "\n"} \
		/^##@/ { printf "\n\033[1;33m%s\033[0m\n", substr($$0, 5) } \
		/^[a-zA-Z0-9_.-]+:.*##/ { printf "  \033[36m%-24s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

# -----------------------------------------------------------------------------
##@ 🛠️ DÉVELOPPEMENT & QUALITÉ DU CODE (Non lié à la démo)
# -----------------------------------------------------------------------------

demo-install: ## Installe le projet Python avec ses dépendances de développement
	python -m pip install -e ".[dev]"

demo-check: demo-test demo-lint demo-format-check demo-types ## Lance tous les contrôles qualité déterministes
	@printf "\n\033[1;32m✅ Tous les contrôles déterministes sont validés à 100%% !\033[0m\n"

demo-test: ## Exécute les tests unitaires et d'intégration avec pytest
	pytest

demo-lint: ## Analyse statique du code Python avec Ruff
	ruff check .

demo-format-check: ## Vérifie la conformité du formatage de code avec Ruff
	ruff format --check .

demo-format: ## Formate automatiquement le code Python avec Ruff
	ruff format .

demo-types: ## Vérifie le typage statique strict avec Mypy
	mypy app

# -----------------------------------------------------------------------------
##@ 🎬 DÉMONSTRATION EN DIRECT (Commandes orateur · Préfixe demo-)
# -----------------------------------------------------------------------------

demo-run-api: ## Démarre l'API FastAPI locale pour la démo (http://127.0.0.1:8000/docs)
	uvicorn app.main:app --reload



demo-create-worktree: ## Prépare un worktree Git isolé pour répéter (ex: make demo-create-worktree WORKTREE=../demo-start)
	@target="$${WORKTREE:-../ai-augmented-development-demo-start}"; \
	if [ -e "$$target" ]; then \
		printf 'Refus : le chemin existe déjà : %s\n' "$$target" >&2; \
		exit 1; \
	fi; \
	git worktree add --detach "$$target" demo/start; \
	printf 'Worktree de démonstration préparé dans %s\n' "$$target"

demo-reset: ## Remet le dépôt à l'état initial propre de départ (demo/start)
	@if [ -n "$$(git status --porcelain)" ]; then \
		printf "⚠️  Attention : des modifications non commitées existent dans le dépôt.\n"; \
		git status --short; \
		printf "\nPour forcer le retour à demo/start : git reset --hard && git switch --detach demo/start\n"; \
		exit 1; \
	fi; \
	git switch --detach demo/start && printf "✅ Dépôt réinitialisé sur demo/start.\n"

# -----------------------------------------------------------------------------
##@ 📽️ SUPPORT SLIDEV & EXPORTS (Présentation · Préfixe slides-)
# -----------------------------------------------------------------------------

slides-dev: ## Démarre le serveur web Slidev (présentation & mode présentateur)
	cd presentation && npm run dev

slides-serve: slides-dev ## Alias de slides-dev

slides-check: ## Contrôle la conformité de la source et des 18 slides
	npm --prefix presentation run check

slides-export: slides-pdf slides-pptx slides-pptx-editable slides-png ## Génère tous les formats de diffusion (PDF, PPTX, PNG)

slides-pdf: ## Génère le PDF dans presentation/exports/
	npm --prefix presentation run export:pdf

slides-pptx: ## Génère le PPTX dans presentation/exports/
	npm --prefix presentation run export:pptx

slides-pptx-editable: ## Génère le PPTX éditable dans presentation/exports/
	npm --prefix presentation run export:pptx-editable

slides-png: ## Génère les captures PNG dans presentation/public/screenshots/
	npm --prefix presentation run export:png

slides-build: ## Génère le site statique Slidev dans presentation/dist/
	npm --prefix presentation run build

slides-install: ## Installe les dépendances npm de la présentation
	npm --prefix presentation install

slides: slides-check slides-export ## Vérifie la présentation puis génère tous les exports

slides-mcp-install: slides-install slides-mcp-info ## Prépare Slidev et affiche la configuration MCP/skill

slides-mcp-info: ## Affiche les modes MCP et l’installation du skill Slidev
	@printf 'MCP HTTP : démarrer `make slides-dev`, puis utiliser http://localhost:3030/__mcp\n'
	@printf 'MCP stdio : utiliser `make slides-mcp` (commande bloquante)\n'
	@printf 'Skill officiel pour les autres agents : `npx skills add slidevjs/slidev`\n'
	@printf 'Dans Codex, le skill Slidev est installé dans l’environnement de l’agent.\n'

slides-mcp: ## Lance le serveur MCP Slidev standalone en stdio
	cd presentation && npm exec -- slidev mcp slides.md

slides-ai-setup: slides-mcp-install ## Prépare les dépendances et affiche la configuration IA Slidev
