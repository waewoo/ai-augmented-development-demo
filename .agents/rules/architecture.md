# Architecture

- Garder cette démonstration volontairement petite et facile à expliquer.
- Conserver la couche HTTP dans `app/main.py`, les modèles de données dans `app/models.py` et la sélection des tâches dans `app/service.py`.
- Privilégier une séparation claire entre les responsabilités de l’API et la petite fonction métier/de service.
- Ne pas ajouter de dépendance externe sans justification précise dans le résumé de la modification et sans approbation humaine explicite.
- Préserver la source de données en mémoire ; la persistance est hors du périmètre de la démonstration.
