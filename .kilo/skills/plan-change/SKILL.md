---
name: plan-change
description: Explorer une petite modification du dépôt, lire les règles applicables du projet, reformuler les critères d’acceptation, identifier les fichiers et les tests, faire ressortir les risques et produire un plan d’implémentation en lecture seule avant l’approbation humaine.
---

# Planifier une modification

Utiliser ce skill lorsqu’une demande doit être comprise et planifiée avant toute modification de fichier.

## Procédure

1. Explorer la structure du dépôt et identifier les points d’entrée pertinents.
2. Lire `AGENTS.md`, `kilo.jsonc` et les règles applicables dans `.kilo/rules/` avant de proposer une solution.
3. Lire l’implémentation existante et les tests qui encadrent la demande.
4. Reformuler la demande en critères d’acceptation observables, y compris le comportement inchangé.
5. Identifier le plus petit ensemble de fichiers susceptibles d’être modifiés.
6. Proposer des tests de réussite, des cas limites et des erreurs de validation lorsque cela est pertinent.
7. Énumérer les risques, les hypothèses et les informations encore manquantes.
8. Présenter le plan sous forme de séquence numérotée, indiquer explicitement « Approbation humaine requise », puis s’arrêter.

## Limite stricte

Ne créer, modifier, supprimer ni formater aucun fichier. Ne pas exécuter de commandes qui modifient le dépôt. Attendre l’approbation humaine explicite avant l’implémentation.

## Sortie attendue

Utiliser les titres suivants : `Compréhension`, `Critères d’acceptation`, `Fichiers`, `Tests`, `Risques`, `Plan` et `Approbation requise`. Terminer par une demande explicite d’approbation avant toute implémentation.
