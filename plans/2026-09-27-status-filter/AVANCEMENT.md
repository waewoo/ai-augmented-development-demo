# Suivi d'implémentation & Avancement — Filtre status sur GET /tasks

## 1. Statut général
**Implémentation terminée · Contrôles déterministes 100% validés**  
Dernière exécution : `make demo-check` avec succès.

## 2. Checklist d'avancement
- [x] **Étape 1 :** Mise à jour du service métier (`app/service.py`) — signature `list_tasks(status: TaskStatus | None = None)`.
- [x] **Étape 2 :** Exposition HTTP et validation FastAPI (`app/main.py`) sans `Query(...)` (règle Ruff B008).
- [x] **Étape 3 :** Ajout des tests d'intégration API (`tests/test_tasks.py`) — nominal, filtrage valide, rejet 422.
- [x] **Étape 4 :** Exécution et validation des contrôles déterministes (`make demo-check`).
- [x] **Étape 5 :** Revue du diff Git et confirmation de non-régression.

## 3. Fichiers modifiés
| Fichier | Modification apportée | Rôle d'architecture |
| :--- | :--- | :--- |
| [`app/service.py`](file:///home/coder/project/app/service.py) | Paramètre optionnel `status: TaskStatus | None` et filtrage par compréhension de liste. | Couche métier Python pur |
| [`app/main.py`](file:///home/coder/project/app/main.py) | Déclaration du paramètre `status` sur la route `GET /tasks` et transmission au service. | Couche HTTP FastAPI |
| [`tests/test_tasks.py`](file:///home/coder/project/tests/test_tasks.py) | Tests du comportement sans filtre, avec statut `todo`, avec statut `done` et rejet 422 pour `blocked`. | Harnais de validation |

## 4. Preuves d'exécution déterministes (`make demo-check`)

```text
pytest
....                                                                     [100%]
4 passed in 0.58s
ruff check .
All checks passed!
ruff format --check .
36 files already formatted
mypy app
Success: no issues found in 4 source files

✅ Tous les contrôles déterministes sont validés à 100% !
```

## 5. Diff Git résumé
- **`app/service.py`** : +5 lignes (filtrage conditionnel sans import HTTP).
- **`app/main.py`** : +2 lignes (paramètre optionnel typé).
- **`tests/test_tasks.py`** : +21 lignes (3 nouveaux tests d'intégration).
- **Total** : 3 fichiers modifiés, 0 dépendance externe ajoutée.
