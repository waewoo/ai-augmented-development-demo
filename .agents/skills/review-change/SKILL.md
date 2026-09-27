---
name: review-change
description: Effectuer une revue en comparant la demande, le plan (PLAN.md), le diff et les preuves, consigner le rapport dans le sous-répertoire daté plans/YYYY-MM-DD-<feature>/REVIEW.md et fournir le lien d'accès dans Kilo Code.
---

# Revoir une modification

Utiliser ce skill après que l’implémentation et les vérifications déterministes ont produit un diff et un journal d'avancement.

## Procédure

1. Identifier le sous-répertoire daté de la tâche dans `plans/` (ex: `plans/YYYY-MM-DD-<mini-titre-feature>/`).
2. Lire la demande initiale et le plan de cadrage `PLAN.md` dans ce dossier.
3. Lire les règles du projet qui s’appliquent aux fichiers modifiés.
4. Inspecter le diff complet (`git diff`), et pas seulement le résumé de l’agent.
5. Relancer indépendamment `make demo-check` et comparer le résultat aux preuves rapportées.
6. Vérifier chaque critère d’acceptation, y compris le comportement préservé et la gestion des entrées invalides.
7. Classer les observations selon leur criticité : `Bloquant`, `Important`, `Mineur` ou `Aucune anomalie`.
8. **Créer ou mettre à jour le rapport de revue dans ce sous-répertoire : `plans/YYYY-MM-DD-<mini-titre-feature>/REVIEW.md`**.
   Le document doit comporter :
   - `# Rapport de Revue de Code — <Titre de la tâche>`
   - `## 1. Périmètre examiné` (fichiers modifiés, plan de référence `PLAN.md`)
   - `## 2. Grille de conformité & Constats` (tableau des règles et critères vérifiés)
   - `## 3. Validation des critères d'acceptation` (non-régression, cas nominaux, validation 422)
   - `## 4. Preuves d'exécution indépendantes` (résultat de la ré-exécution de `make demo-check`)
   - `## 5. Risques résiduels & Recommandations`
   - `## 6. Verdict final` (`Validé pour fusion` ou `Corrections requises`)
9. **Dans la conversation Kilo Code** :
   - Présenter une synthèse claire du verdict.
   - Fournir le **lien Markdown direct et cliquable** vers le rapport de revue :  
     `🔍 [Consulter le rapport de revue : plans/<dossier-daté>/REVIEW.md](plans/<dossier-daté>/REVIEW.md)`

## Limite stricte

- Ne modifier aucun fichier de code applicatif ou de test (`app/`, `tests/`).
- Ne pas corriger les constats pendant la phase de revue.
- L'écriture est strictement limitée à `plans/YYYY-MM-DD-<mini-titre-feature>/REVIEW.md`.

## Sortie attendue dans Kilo Code

- Verdict de la revue (Validé / Non validé).
- Le lien cliquable vers le rapport :  
  `🔍 [Consulter le rapport de revue : plans/2026-09-27-status-filter/REVIEW.md](plans/2026-09-27-status-filter/REVIEW.md)`.
