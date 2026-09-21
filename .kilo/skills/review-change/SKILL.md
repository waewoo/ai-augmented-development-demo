---
name: review-change
description: Effectuer une revue en lecture seule en comparant la demande, le plan approuvé, les règles du projet, le diff final et les résultats de validation réels ; classer les constats par gravité et indiquer clairement si un problème bloquant subsiste.
---

# Revoir une modification

Utiliser ce skill après que l’implémentation et les vérifications déterministes ont produit un diff.

## Procédure

1. Lire la demande initiale et le plan approuvé.
2. Lire les règles qui s’appliquent aux fichiers modifiés.
3. Inspecter le diff complet, et pas seulement le résumé de l’agent.
4. Relancer `make demo-check` lorsque cela est possible et comparer le résultat aux preuves rapportées. Si la relance est impossible, indiquer explicitement que les résultats n’ont pas été vérifiés indépendamment.
5. Vérifier chaque critère d’acceptation, y compris le comportement préservé et la gestion des entrées invalides.
6. Classer les observations comme `Bloquant`, `Important`, `Mineur` ou `Aucune anomalie`.
7. Signaler les tests manquants, les hypothèses non vérifiées, les préoccupations de sécurité et toute dérive de périmètre.

## Limite stricte

Ne modifier aucun fichier. Ne pas corriger les constats pendant cette revue. Si aucun problème bloquant n’existe, l’indiquer explicitement et distinguer cette affirmation d’une garantie de perfection.

## Sortie attendue

Utiliser les titres suivants : `Périmètre examiné`, `Constats`, `Critères d’acceptation`, `Éléments probants`, `Risques` et `Conclusion`.
