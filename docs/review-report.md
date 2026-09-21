# Revue finale de la démonstration

Date de revue : 21 septembre 2026.

## Périmètre

- demande : ajouter un filtre optionnel `status` à `GET /tasks` ;
- plan attendu : [`demo-assets/expected-plan.md`](../demo-assets/expected-plan.md) ;
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

La vérification API couvre le comportement sans filtre, deux valeurs valides et la réponse 422 pour une valeur invalide. Les tests ont émis deux avertissements de dépréciation provenant de la combinaison FastAPI/Starlette/TestClient de l’environnement ; ils ne bloquent pas la démonstration, mais doivent être revalidés lors d’une mise à jour de dépendances.

## Support

- 15 slides natives, format 16:9 ;
- notes présentes sur chaque slide ;
- schémas composés de formes et textes éditables ;
- minutage principal : 42 minutes ; total avec formation et questions : 60 minutes.

La vérification disponible dans cet environnement est structurelle et textuelle. Aucun moteur local de rendu Office n’est installé ; une ouverture finale dans PowerPoint, LibreOffice Impress ou Google Slides reste recommandée avant diffusion pour valider le rendu propre à l’environnement de présentation.

## Conclusion

**Aucun problème bloquant identifié.** Le dépôt reste agnostique, synthétique et local. Les rules sont explicitement présentées comme des instructions, et le workflow conserve une approbation humaine ainsi que des contrôles déterministes.
