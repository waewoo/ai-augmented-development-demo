# Revue finale de la démonstration

Date de revue : 21 septembre 2026.

## Périmètre

- demande : ajouter un filtre optionnel `status` à `GET /tasks` ;
- plan attendu : [`demo2-secours-plan.md`](demo2-secours-plan.md) ;
- rules : architecture, testing, reporting et security ;
- diff entre `demo/start` et l’implémentation ;
- documentation, runbook, prompts et états de secours ;
- PowerPoint 16:9, notes orateur et minutage.

## Preuves exécutées

```text
pytest                    4 passed
ruff check .              passed
ruff format --check .     passed
mypy app                  Success: no issues found
```

La vérification API couvre le comportement sans filtre, deux valeurs valides et la réponse 422 pour une valeur invalide. Les dépendances de test utilisent `httpx2` et une version d’AnyIO compatible avec Starlette afin que la suite s’exécute sans avertissement de dépréciation.

## Support Slidev

- source de vérité : `presentation/slides.md` ;
- composants Vue : workflow, contexte, rules, code, harnais et cues de démonstration ;
- animations `v-click` conservées dans la présentation web ;
- export de diffusion statique généré automatiquement sans `v-click` afin de conserver 15 pages.

- 15 slides, format 16:9 ;
- notes présentes sur les 15 slides du PPTX exporté ;
- PDF, PPTX, PPTX editable et 15 captures PNG exportés depuis Slidev ;
- minutage principal : 42 minutes ; total avec formation et questions : 60 minutes.

Les captures PNG ont été inspectées avec Chromium, notamment les slides de contexte, code, harnais et synthèse. Aucun moteur local de rendu Office n’est installé ; une ouverture finale dans PowerPoint, LibreOffice Impress ou Google Slides reste recommandée avant diffusion pour valider le degré d’éditabilité et le rendu propre à l’environnement de présentation.

## Conclusion

**Aucun problème bloquant identifié.** Le dépôt reste agnostique, synthétique et local. Les rules sont explicitement présentées comme des instructions, et le workflow conserve une approbation humaine ainsi que des contrôles déterministes.
