---
name: implement-change
description: Implémenter un plan de modification du dépôt explicitement approuvé avec le plus petit changement sûr, ajouter ou mettre à jour les tests, exécuter les vérifications déterministes du projet et rendre compte des preuves sans prétendre avoir exécuté des vérifications qui ne l’ont pas été.
---

# Implémenter une modification approuvée

Utiliser ce skill uniquement après l’approbation humaine explicite d’un plan concret dans la conversation. Toute modification hors du plan nécessite une nouvelle approbation.

## Procédure

1. Reformuler le plan approuvé, confirmer les critères d’acceptation et vérifier que l’approbation humaine est explicite.
2. Lire les règles du projet applicables avant toute modification.
3. Réaliser l’implémentation cohérente la plus petite qui satisfasse le plan.
4. Si le comportement fonctionnel change, ajouter ou mettre à jour des tests ciblés pour couvrir les critères d’acceptation, tout en préservant le comportement existant.
5. Exécuter `make demo-check`, ou chacune des commandes qu’il contient si la cible Make est indisponible.
6. Inspecter le diff final pour repérer les modifications sans rapport, les secrets et les tests manquants.
7. Rendre compte des fichiers modifiés, des commandes réellement exécutées, des résultats, des risques et de toute vérification ignorée.

## Limites strictes

- Ne pas élargir le périmètre sans demander d’approbation.
- Ne pas affirmer qu’une vérification a réussi si elle n’a pas été exécutée et si sa sortie ne l’étaye pas.
- Ne pas dissimuler une vérification en échec derrière un résumé.
- Ne pas utiliser de commandes destructrices ni de services externes pour cette démonstration locale.
