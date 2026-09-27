# Instructions pour les Agents IA (`AGENTS.md`)

Ce dépôt est une application FastAPI minimale conçue pour démontrer le développement logiciel augmenté par IA sous contrôle humain strict.

## 1. Architecture du projet

- `app/main.py` : Point d'entrée HTTP (FastAPI), validation des requêtes et codes retour HTTP.
- `app/models.py` : Modèles de données Pydantic et types énumérés.
- `app/service.py` : Logique métier et requêtes en mémoire.
- `tests/` : Tests d'intégration API avec `TestClient`.
- `plans/` : Espace dédié à la traçabilité par sous-dossier daté (`plans/YYYY-MM-DD-<feature>/`).

## 2. Commandes de validation déterministe

Avant de déclarer une tâche terminée, TOUJOURS exécuter :
```bash
make demo-check
```
Cette commande exécute :
1. `pytest` : suite de tests automatisés.
2. `ruff check .` : linter de code.
3. `ruff format --check .` : conformité du formatage.
4. `mypy app` : vérification stricte des types.

## 3. Garde-fous globaux (Constitution)

- **Lecture seule sur le code source et plan obligatoire dans `plans/`** : Toute demande d'ajout ou de modification de code DOIT obligatoirement débuter par une phase de cadrage et de planification (`plan-change`). L'agent a l'interdiction formelle de modifier ou de créer le moindre fichier dans le code applicatif ou les tests (`app/`, `tests/`), mais il DOIT consigner son plan détaillé dans un sous-répertoire daté sous `plans/` (`plans/YYYY-MM-DD-<feature>/PLAN.md`) et fournir un lien cliquable dans la conversation. IL EST STRICTEMENT INTERDIT de toucher au code sans approbation humaine préalable explicite du plan, même si la demande initiale de l'utilisateur est formulée à l'impératif (ex: « Ajoute... », « Implémente... », « Corrige... »).
- **Périmètre minimal** : N'ajouter aucune dépendance externe inutile. Conserver le comportement par défaut des endpoints existants.
- **Preuves réelles** : Ne jamais inventer une sortie de commande ou prétendre qu'un test est passé sans l'avoir réellement exécuté.

## 4. Règles spécifiques (`.agents/rules/`)

Pour les règles techniques détaillées par domaine, se référer aux fichiers modulaires :
- `architecture.md` : Découplage API / Service et gestion de l'état mémoire.
- `python.md` : Standards Python 3.10+, typage strict Mypy et règles Ruff (B008).
- `testing.md` : Stratégie de tests d'intégration, non-régression et validation HTTP.
- `reporting.md` : Format des comptes rendus, traçabilité dans `plans/` et arbitrage de priorité.
- `security.md` : Garde-fous d'exécution locale et gestion des secrets.

## 5. Skills disponibles (`.agents/skills/`)

- `plan-change` : Explore le besoin, rédige le plan dans `plans/YYYY-MM-DD-<feature>/PLAN.md` et fournit le lien cliquable sans modifier le code source.
- `implement-change` : Applique le changement approuvé sur le code, exécute `make demo-check` et consigne l'avancement dans `plans/YYYY-MM-DD-<feature>/AVANCEMENT.md`.
- `review-change` : Compare le diff Git avec le plan et les règles, et consigne le rapport d'audit dans `plans/YYYY-MM-DD-<feature>/REVIEW.md`.
- `document-architecture` : Génère ou met à jour la documentation d'architecture (`docs/ARCHITECTURE.md`) avec schémas Mermaid.
