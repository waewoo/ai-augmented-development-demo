# Plan attendu — `status` sur `GET /tasks`

## Understanding

L’API expose une liste en mémoire via `app/main.py`, avec sélection déléguée à `app/service.py`. Les tâches ont déjà un `status` fermé dans `app/models.py`.

## Acceptance criteria

1. `GET /tasks` sans paramètre retourne les trois tâches existantes.
2. `GET /tasks?status=todo`, `doing` ou `done` retourne uniquement les tâches correspondantes.
3. Une valeur hors de ces statuts retourne HTTP 422.
4. Le comportement existant est conservé.
5. Les tests couvrent ces comportements et `make check` est vert.

## Files

- `app/main.py` : paramètre optionnel typé.
- `app/service.py` : filtrage.
- `tests/test_tasks.py` : cas nominaux, régression et erreur de validation.

## Risks

- changer le type de réponse ou la liste par défaut ;
- filtrer au mauvais endroit et dupliquer la logique ;
- oublier le cas invalide.

## Plan

1. Ajouter le paramètre `status` avec le type existant.
2. Faire accepter ce filtre au service sans changer les données.
3. Ajouter les tests ciblés.
4. Exécuter `make check` et relire le diff.

Approval needed: oui, avant toute modification.
