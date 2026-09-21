# Diff attendu — résumé

```diff
 app/main.py          | paramètre optionnel `status` sur GET /tasks
 app/service.py       | filtrage par statut, copie conservée sans filtre
 tests/test_tasks.py  | tests de filtre, non-régression et 422
 3 files changed
```

Le diff réel doit rester limité à ce périmètre et ne doit contenir ni secret ni changement de style sans rapport.
