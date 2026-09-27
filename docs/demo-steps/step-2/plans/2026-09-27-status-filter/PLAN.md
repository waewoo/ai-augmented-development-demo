# Plan d'implémentation — Filtre optionnel status sur GET /tasks

## 1. Contexte & Compréhension
L’API FastAPI expose actuellement la liste complète des tâches en mémoire via le point d'entrée HTTP `GET /tasks` (`app/main.py`), qui délègue la sélection à la fonction `list_tasks()` dans `app/service.py`. Les modèles de données existent déjà dans `app/models.py` avec l'énumération fermée `TaskStatus` (`todo`, `doing`, `done`).

L'objectif est d'ajouter un paramètre de requête optionnel `status` pour filtrer les tâches retournées, tout en respectant l'architecture en couches, le typage strict et la règle Ruff B008.

## 2. Critères d'acceptation
1. **Comportement par défaut (non-régression)** : `GET /tasks` sans paramètre retourne les 3 tâches initiales avec un code HTTP 200.
2. **Filtrage valide** : `GET /tasks?status=todo`, `GET /tasks?status=doing` ou `GET /tasks?status=done` ne retourne que les tâches correspondant au statut demandé (HTTP 200).
3. **Validation stricte des entrées** : Toute valeur de statut non reconnue (ex: `?status=blocked`) doit être automatiquement rejetée avec une réponse HTTP 422 (Unprocessable Entity).
4. **Architecture découplée** :
   - Le point d'entrée HTTP (`app/main.py`) valide le paramètre avec `TaskStatus | None = None` (sans `Query(...)` par défaut, conformément à la règle Ruff B008) et délègue au service.
   - La logique de filtrage réside exclusivement dans `app/service.py` en Python pur (aucun import FastAPI).
   - L'immutabilité défensive est préservée (retour d'une copie défensive `.copy()`).
5. **Couverture de tests & Qualité** :
   - Tests d'intégration automatisés couvrant les cas nominaux, la non-régression et le rejet 422.
   - Validation 100 % verte sur `make demo-check` (`pytest`, `ruff check`, `ruff format`, `mypy`).

## 3. Fichiers ciblés
- `app/service.py` : signature `list_tasks(status: TaskStatus | None = None) -> list[Task]` et logique de filtrage.
- `app/main.py` : exposition du paramètre optionnel `status: TaskStatus | None = None` sur la route `GET /tasks`.
- `tests/test_tasks.py` : ajout des tests ciblés (filtrage valide et rejet HTTP 422).

## 4. Stratégie de tests & Vérification déterministe
- Conserver le test existant `test_list_tasks_returns_all_tasks`.
- Ajouter `test_list_tasks_filters_by_status` pour vérifier le filtrage sur une valeur valide.
- Ajouter `test_list_tasks_rejects_unknown_status` pour vérifier le rejet 422.
- Exécuter la commande `make demo-check` pour valider les 4 contrôles qualité.

## 5. Risques & Points de vigilance
- **Violation de la règle Ruff B008** : Ne pas utiliser `Query(None)` ou `Query(...)` comme valeur par défaut d'argument dans la route FastAPI.
- **Couplage HTTP dans le service** : Ne jamais importer d'objets FastAPI dans `app/service.py`.
- **Mutation de l'état en mémoire** : S'assurer que le filtrage ne mute pas la liste originale `TASKS`.

## 6. Checklist d'implémentation
- [ ] Adapter la fonction `list_tasks` dans `app/service.py`
- [ ] Exposer le paramètre `status` sur `GET /tasks` dans `app/main.py`
- [ ] Étendre la suite de tests d'intégration dans `tests/test_tasks.py`
- [ ] Exécuter `make demo-check` et vérifier l'absence d'erreurs
- [ ] Consigner les résultats et le diff dans `plans/AVANCEMENT.md`

## 7. Statut
`En attente de validation humaine avant toute écriture de code.`
