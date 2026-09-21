# Prompts exacts de démonstration

Les prompts ci-dessous sont volontairement courts, explicites et reproductibles. Ils ne contiennent aucun secret et ne supposent pas un accès réseau.

## Exploration — lecture seule

> Explore ce dépôt sans modifier de fichier. Résume son architecture, identifie le point d’entrée, les tests, les commandes de validation, les règles du projet et les skills disponibles. Signale les informations qui te manquent.

Attendu : structure, `app/main.py`, tests, `make check`, `kilo.jsonc`, rules et skills ; aucune modification.

## Planification — lecture seule

> Utilise le skill plan-change pour préparer l’ajout d’un filtre optionnel `status` sur `GET /tasks`. Ne modifie aucun fichier. Reformule les critères d’acceptation, identifie les fichiers et tests concernés, puis attends mon approbation.

Attendu : compréhension, critères, fichiers, tests, risques, plan et attente d’approbation.

## Approbation humaine

> J’approuve le plan proposé, dans son périmètre exact. N’ajoute pas de fonctionnalité hors de ce plan.

Cette phrase est saisie uniquement après lecture du plan par le présentateur.

## Implémentation — périmètre approuvé

> Le plan est approuvé. Utilise le skill implement-change. Implémente la modification minimale, ajoute les tests nécessaires, exécute les contrôles déterministes du projet et présente le diff et les résultats.

Attendu : filtre optionnel, validation 422 via le type de statut, tests de non-régression et contrôles réellement exécutés.

## Revue — lecture seule

> Utilise le skill review-change. Ne modifie aucun fichier. Compare la demande initiale, le plan approuvé, les rules, le diff et les résultats des contrôles. Classe les observations par sévérité.

Attendu : findings classés, critères vérifiés, preuve des contrôles et conclusion explicite sur l’absence ou la présence d’un problème bloquant.

## Prompts de secours

Si l’interface est lente :

> Lis seulement `demo-assets/expected-plan.md` et explique comment il couvre les critères d’acceptation, sans modifier de fichier.

Si la génération part hors périmètre :

> Arrête toute modification. Reviens à une analyse en lecture seule, liste les fichiers déjà modifiés et attends une nouvelle instruction.

Si la démonstration doit basculer sur un état connu :

> N’essaie pas de réparer l’état courant. Je vais ouvrir l’état de secours documenté dans le runbook ; reste en lecture seule jusqu’à mon signal.
