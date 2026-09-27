# Standards Python et Typage

- **Version et syntaxe moderne** :
  - Cible Python 3.10+.
  - Utiliser les opérateurs d'union PEP 604 (ex: `Type | None = None`) plutôt que `Optional[Type]`.
- **Typage statique strict (Mypy)** :
  - Annoter systématiquement toutes les fonctions (paramètres et type de retour).
  - Interdiction d'utiliser `# type: ignore` ou des contournements de typage sans justification formelle.
- **Linting et formatage (Ruff)** :
  - Le code doit passer sans avertissement `ruff check .` et `ruff format --check .`.
  - **Règle B008 (FastAPI)** : ne pas appeler de fonctions dans les valeurs par défaut des arguments d'endpoint (ex: éviter d'appeler `Query(...)` en valeur par défaut). Exploiter la déduction automatique de FastAPI pour les types scalaires optionnels ou utiliser `typing.Annotated`.
- **Dépendances** :
  - Aucune dépendance externe non déclarée dans `pyproject.toml`.
