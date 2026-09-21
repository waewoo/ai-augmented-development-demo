# Contrôles attendus

```text
$ make demo-check
pytest                         PASS — 4 tests
ruff check .                   PASS
ruff format --check .          PASS
mypy app                       PASS
```

Le nombre exact de tests peut évoluer si le contenu est enrichi. La règle de présentation est de montrer uniquement des résultats réellement exécutés et de signaler les écarts.
