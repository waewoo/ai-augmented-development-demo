# Premiers pas vers le développement augmenté par l’IA

Dépôt privé de préparation d’une présentation et d’une démonstration reproductible sur le développement augmenté par l’IA.

Le projet volontairement agnostique combine :

- un exemple FastAPI minimal, testable localement ;
- des règles et skills Kilo Code qui rendent la méthode explicite ;
- un workflow plan → approbation humaine → implémentation → contrôles → revue ;
- un conducteur, des prompts exacts et des états de secours ;
- un support PowerPoint 16:9 et ses notes orateur.

Kilo Code est l’outil utilisé pendant la démonstration parce qu’il est maîtrisé par le présentateur. Il ne constitue pas une recommandation exclusive : Continue, OpenCode et IBM Bob sont également mentionnés, et chaque équipe doit employer les outils et modèles approuvés par son organisation.

## Démarrage rapide

Python 3.12+ est recommandé (le code est compatible Python 3.10+). Avec un environnement virtuel :

```bash
python -m venv .venv
source .venv/bin/activate
python -m pip install -e ".[dev]"
make check
```

Lancer l’API :

```bash
uvicorn app.main:app --reload
```

Puis ouvrir `http://127.0.0.1:8000/docs`.

## Fonctionnalité démontrée

L’API expose `GET /tasks` avec trois tâches en mémoire. La branche `demo/start` montre l’état initial sans filtre. La branche principale ajoute le paramètre optionnel `status` :

- sans paramètre : toutes les tâches sont retournées ;
- avec `status=todo|doing|done` : seules les tâches correspondantes sont retournées ;
- avec une valeur inconnue : FastAPI répond `422`.

## Parcours de la présentation

Le fil pédagogique est : contexte → rules → skills → workflow → frameworks → contrôles et harnais. La partie principale est minutée à 42 minutes, auxquelles s’ajoutent 8 minutes d’intervention formation et 10 minutes de questions.

Voir :

- [`docs/presentation-plan.md`](docs/presentation-plan.md) pour le déroulé et le minutage ;
- [`docs/speaker-notes.md`](docs/speaker-notes.md) pour les notes détaillées ;
- [`docs/demo-runbook.md`](docs/demo-runbook.md) pour le conducteur opérationnel ;
- [`docs/demo-prompts.md`](docs/demo-prompts.md) pour les textes exacts ;
- [`presentation/premiers-pas-developpement-augmente-ia.pptx`](presentation/premiers-pas-developpement-augmente-ia.pptx) pour le support ;
- [`docs/resources.md`](docs/resources.md) pour les ressources officielles vérifiées.

## États de secours

Les tags `demo/start`, `demo/implemented` et `demo/review` permettent de préparer la démonstration sans dépendre d’une génération en direct. Les assets attendus dans `demo-assets/` servent de référence visuelle et textuelle.

Pour travailler dans un état de départ propre, vérifier d’abord que l’arbre est propre puis utiliser :

```bash
git switch --detach demo/start
```

Cette commande change la vue de travail mais ne supprime aucun fichier. Si l’arbre n’est pas propre, conserver les changements ou utiliser un worktree séparé avant de changer d’état.

## Positionnement et sécurité

Ce dépôt ne contient aucun secret et ne doit pas en recevoir. Les rules sont des instructions textuelles : elles orientent l’agent mais ne remplacent ni les permissions, ni les tests, ni la CI, ni la revue humaine. Ne pas donner automatiquement à un agent l’accès à la production ou à des données sensibles.

## Licence

Le contenu de démonstration est distribué sous licence MIT. Les liens vers les produits, frameworks et outils tiers restent soumis à leurs propres conditions.
