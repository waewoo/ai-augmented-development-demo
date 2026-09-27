# Qualité Python

- Respecter Python 3.10 et les conventions PEP 8 applicables.
- Utiliser `ruff format` pour le formatage et Ruff pour le linting.
- Ajouter les annotations de type attendues par la configuration Mypy.
- Ne pas utiliser `# noqa`, `type: ignore` ou des contournements de typage sans justification.
- Réutiliser les dépendances existantes avant d’en proposer une nouvelle.
- Toute nouvelle dépendance doit être justifiée, approuvée et déclarée dans `pyproject.toml`.
- Utiliser FastAPI pour la couche HTTP, Pydantic pour les modèles et conserver la logique métier dans le service.
