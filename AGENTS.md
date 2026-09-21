# Instructions pour les Agents IA (`AGENTS.md`)

Ce dépôt est une application FastAPI minimale conçue pour démontrer le développement logiciel augmenté par IA sous contrôle humain strict.

## 1. Architecture du projet

- `app/main.py` : Point d'entrée HTTP (FastAPI), validation des requêtes et codes retour HTTP.
- `app/models.py` : Modèles de données Pydantic et énumérations (`TaskStatus`).
- `app/service.py` : Logique métier et sélection des tâches (stockage mémoire).
- `tests/test_tasks.py` : Tests d'intégration API avec `TestClient`.

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

## 3. Règles et garde-fous stricts

- **Lecture seule par défaut** : En phase d'exploration (`plan-change`) ou de revue (`review-change`), ne modifier aucun fichier. Attendre l'approbation humaine explicite.
- **Périmètre minimal** : N'ajouter aucune dépendance externe inutile. Conserver les tests existants et le comportement par défaut (ex: `GET /tasks` sans paramètre retourne toutes les tâches).
- **Gestion des erreurs** : Rejeter les entrées invalides avec le code HTTP approprié (`422 Unprocessable Entity`).
- **Preuves réelles** : Ne jamais inventer une sortie de commande ou prétendre qu'un test est passé sans l'avoir réellement exécuté.

## 4. Skills disponibles (`.kilo/skills/`)

- `plan-change` : Explore le besoin et prépare un plan d'implémentation sans modifier de code.
- `implement-change` : Applique le changement minimal approuvé et exécute les tests.
- `review-change` : Compare le diff Git avec le plan et les règles du projet en lecture seule.
- `document-architecture` : Génère ou met à jour la documentation d'architecture (`docs/ARCHITECTURE.md`) avec schémas Mermaid.
