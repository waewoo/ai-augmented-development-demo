# Plan contraint — avec rules

## Fichiers ciblés

- `app/models.py` : réutiliser un type fermé pour `todo`, `doing`, `done`.
- `app/service.py` : ajouter un filtrage simple sans introduire de dépendance ni de persistance.
- `app/main.py` : exposer le paramètre optionnel sur `GET /tasks`.
- `tests/test_tasks.py` : couvrir toutes les tâches, un filtre valide et la réponse 422.

## Contrôles

- préserver la réponse actuelle sans filtre ;
- exécuter `make demo-check` avant de déclarer terminé ;
- inspecter le diff et signaler tout contrôle non exécuté.
