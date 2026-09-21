# Conducteur de démonstration

Durée de la partie principale : 42 minutes. Les démonstrations sont intercalées dans les explications, pas regroupées en fin de session.

## Avant la session

- Vérifier que Kilo Code est installé, connecté et configuré avec un modèle approuvé.
- Vérifier que les skills du projet sont visibles après rechargement de la session.
- Exécuter `make check` dans un environnement propre.
- Fermer les fenêtres contenant des données sensibles, agrandir la police et désactiver les notifications.
- Préparer les onglets : dépôt, `README.md`, `kilo.jsonc`, rules, skills, `demo-assets/` et support.
- Disposer d’une copie locale et des tags `demo/start`, `demo/implemented`, `demo/review`.
- Vérifier la connexion réseau, mais ne pas dépendre d’elle : le dépôt, les prompts et les sorties attendues sont locaux.
- Répéter avec un chronomètre et réserver 8 minutes à l’intervention formation et 10 minutes aux questions.

## Règles d’exploitation en direct

- Ne saisir aucun secret ou contenu interne.
- Vérifier toute commande avant de l’exécuter.
- Ne jamais laisser l’agent modifier pendant l’exploration, la planification ou la revue.
- Montrer un diff et une sortie de contrôles, pas seulement un résumé en langage naturel.
- Si une étape dépasse sa durée maximale, basculer vers le secours prévu.

## Démonstration 1 — découverte du dépôt

- **Objectif :** donner à l’agent un contexte pertinent et vérifier qu’il comprend le terrain.
- **État de départ :** `demo/start` ou copie locale propre avant implémentation.
- **Texte exact :** voir la section Exploration de [`demo-prompts.md`](demo-prompts.md).
- **Résultat attendu :** structure, point d’entrée, tests, `make check`, rules et skills identifiés ; aucun fichier modifié.
- **Durée maximale :** 3 minutes.
- **Point à commenter :** le contexte pertinent vaut mieux que le chargement indistinct de tout le dépôt.
- **Secours :** afficher `README.md` puis `demo-assets/expected-plan.md`.
- **Retour à l’état attendu :** fermer la session de lecture seule ; aucun reset nécessaire.

## Démonstration 2 — planification avec `plan-change`

- **Objectif :** rendre visible la différence entre une demande et un plan contrôlable.
- **État de départ :** état initial, sans filtre `status`.
- **Texte exact :** voir la section Planification de [`demo-prompts.md`](demo-prompts.md).
- **Résultat attendu :** critères d’acceptation, fichiers, tests, risques et plan ; aucune modification.
- **Durée maximale :** 4 minutes.
- **Point à commenter :** le plan est une véritable approbation humaine.
- **Secours :** lire `demo-assets/expected-plan.md` à l’écran.
- **Retour à l’état attendu :** rester dans l’état initial ; ne pas appliquer le plan si le temps manque.

## Démonstration 3 — implémentation et vérification

- **Objectif :** appliquer un plan approuvé et rendre le résultat vérifiable.
- **État de départ :** plan affiché et approuvé, code encore dans l’état initial.
- **Texte exact :** voir la section Implémentation de [`demo-prompts.md`](demo-prompts.md).
- **Résultat attendu :** filtre optionnel, 422 pour statut invalide, tests mis à jour, `make check` vert, diff relu.
- **Durée maximale :** 5 minutes.
- **Point à commenter :** l’agent propose et exécute ; le développeur reste responsable.
- **Secours :** afficher `demo-assets/expected-diff.md` et `demo-assets/expected-checks.md`, puis ouvrir le tag `demo/implemented` dans un worktree séparé.
- **Retour à l’état attendu :** si l’arbre est propre, `git switch --detach demo/implemented`; sinon ne pas changer de vue et utiliser le secours visuel.

## Démonstration 4 — revue avec `review-change`

- **Objectif :** contrôler l’alignement entre demande, plan, rules, diff et preuves.
- **État de départ :** implémentation terminée et contrôles connus.
- **Texte exact :** voir la section Revue de [`demo-prompts.md`](demo-prompts.md).
- **Résultat attendu :** observations par sévérité, critères vérifiés, conclusion sans modification.
- **Durée maximale :** 3 minutes.
- **Point à commenter :** une revue lisible ne remplace pas le jugement humain ; elle structure l’attention.
- **Secours :** utiliser le diff attendu et les contrôles attendus comme revue guidée.
- **Retour à l’état attendu :** aucune modification ; conserver le tag `demo/review` comme référence.

## Revenir à l’état initial sans action destructive

Avant tout changement de vue, vérifier :

```bash
git status --short
```

Si la sortie est vide :

```bash
git switch --detach demo/start
```

Cette procédure ne supprime pas de fichier. Si des modifications locales existent, ne pas utiliser de reset ; créer un worktree séparé ou basculer vers les assets Markdown. Le script [`scripts/prepare-demo-worktree.sh`](../scripts/prepare-demo-worktree.sh) propose une copie isolée.
