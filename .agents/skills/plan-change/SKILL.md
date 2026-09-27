---
name: plan-change
description: Explorer une modification du dépôt, lire les règles applicables, reformuler les critères d'acceptation, identifier les fichiers et tests, évaluer les risques et consigner un plan d'implémentation dans un sous-répertoire daté plans/YYYY-MM-DD-<feature>/PLAN.md avec lien cliquable dans la conversation avant l'approbation humaine.
---

# Planifier une modification

Utiliser ce skill lorsqu’une demande doit être comprise et planifiée avant toute modification du code source.

## Procédure

1. Explorer la structure du dépôt et identifier les points d’entrée pertinents.
2. Lire `AGENTS.md`, `kilo.jsonc` et les règles applicables dans `.agents/rules/` avant de proposer une solution.
3. Lire l’implémentation existante et les tests qui encadrent la demande.
4. Reformuler la demande en critères d’acceptation observables, y compris le comportement inchangé.
5. Identifier le plus petit ensemble de fichiers susceptibles d’être modifiés.
6. Proposer des tests de réussite, des cas limites et des erreurs de validation lorsque cela est pertinent.
7. Énumérer les risques, les hypothèses et les informations encore manquantes.
8. **Créer le sous-répertoire daté et le fichier de plan associé** :
   - Format de chemin : `plans/YYYY-MM-DD-<mini-titre-feature>/PLAN.md`  
     *(Exemple : `plans/2026-09-27-status-filter/PLAN.md`)*
   - L'agent **DOIT créer ce sous-répertoire** dans `plans/` s'il n'existe pas encore avant d'y écrire le fichier `PLAN.md`.
   - Structure obligatoire du fichier :
     - `# Plan d'implémentation — <Titre de la tâche>`
     - `## 1. Contexte & Compréhension`
     - `## 2. Critères d'acceptation` (non-régression, cas nominaux, validation)
     - `## 3. Fichiers ciblés`
     - `## 4. Stratégie de tests & Vérification déterministe`
     - `## 5. Risques & Points de vigilance`
     - `## 6. Checklist d'implémentation` (cases à cocher `- [ ]` pour chaque étape)
     - `## 7. Statut` (`En attente de validation humaine`)
9. **Dans la conversation Kilo Code** :
   - Présenter une synthèse concise du plan.
   - Fournir le **lien Markdown direct et cliquable** vers le fichier généré :  
     `📄 [Consulter le plan : plans/<dossier-daté>/PLAN.md](plans/<dossier-daté>/PLAN.md)`
   - Indiquer explicitement « **Approbation humaine requise** » et demander la validation de l'utilisateur avant toute implémentation.
   - S’arrêter immédiatement sans modifier aucun fichier de code source.

## Limites strictes

- **Code source sanctuarisé** : Ne modifier, créer ni supprimer aucun fichier de code applicatif ou de test (`app/`, `tests/`).
- **Seul le répertoire de la tâche sous `plans/` est autorisé en écriture** : L'écriture est strictement limitée à `plans/YYYY-MM-DD-<mini-titre-feature>/PLAN.md`.
- Attendre l’approbation humaine explicite avant toute modification de code.

## Sortie attendue dans Kilo Code

- Un court résumé des critères d'acceptation.
- Le lien cliquable vers le fichier de plan dans son sous-dossier daté :  
  `📄 [Consulter le plan : plans/2026-09-27-status-filter/PLAN.md](plans/2026-09-27-status-filter/PLAN.md)`.
- La mention claire : **Approbation humaine requise**.
