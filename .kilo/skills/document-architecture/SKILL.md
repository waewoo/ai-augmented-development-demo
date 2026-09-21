---
name: document-architecture
description: Inspecter la base de code Python (FastAPI, Pydantic, services, tests) et générer ou mettre à jour un document d’architecture complet et visuel (docs/ARCHITECTURE.md) avec des diagrammes Mermaid, les modèles de données, les endpoints et les commandes de validation.
---

# Documenter l’architecture

Utiliser ce skill lorsque vous souhaitez que l’agent documente la structure de la base de code, les points d’entrée, les flux de données et les contraintes dans un format standardisé et facile à exploiter pour les développeurs.

## Procédure

1. Inspecter les points d’entrée de la base de code (`app/main.py`, `app/models.py`, `app/service.py`, `tests/test_tasks.py`, `AGENTS.md`), ainsi que `Makefile`, `pyproject.toml` et `kilo.jsonc` lorsqu’ils sont pertinents.
2. Identifier les composants de l’application, les modèles, les routes et les règles de gestion des erreurs.
3. Générer ou mettre à jour `docs/ARCHITECTURE.md` avec :
   - **Vue d’ensemble & Rôle du projet**.
   - **Schéma d’architecture Mermaid (`graph TD`)** lisible et rendable, illustrant le flux entre le client HTTP, FastAPI, Pydantic, le service et les tests.
   - **Dictionnaire des données** : modèles Pydantic, énumérations et types stricts.
   - **Spécification des endpoints API** : méthode, URL, paramètres de requête et codes retour réellement observés dans le code et les tests, notamment `200` et `422` lorsqu’ils s’appliquent.
   - **Chaîne de vérification déterministe** : commande `make demo-check` (pytest, ruff, mypy).
4. Présenter un bref résumé de la documentation mise à jour, puis s’arrêter.

## Limite stricte

- Écrire ou mettre à jour uniquement `docs/ARCHITECTURE.md`.
- Ne toucher ni modifier aucun fichier dans `app/` ou `tests/`.
- Ne pas ajouter de dépendances externes.

## Format de sortie attendu

Un fichier Markdown propre et soigné, enregistré dans `docs/ARCHITECTURE.md`, contenant des diagrammes Mermaid lisibles et rendables ainsi que des tableaux structurés.

