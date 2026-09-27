---
name: implement-change
description: Implémenter un plan approuvé, exécuter make demo-check, consigner l'avancement dans le sous-répertoire daté plans/YYYY-MM-DD-<feature>/AVANCEMENT.md et fournir le lien d'accès dans Kilo Code.
---

# Implémenter une modification approuvée

Utiliser ce skill uniquement après l’approbation humaine explicite d’un plan consigné dans un sous-répertoire de `plans/` (ex: `plans/2026-09-27-status-filter/PLAN.md`).

## Procédure

1. Identifier le sous-répertoire de la tâche concernée (ex: `plans/YYYY-MM-DD-<mini-titre-feature>/`) et lire `PLAN.md`. Confirmer les critères d’acceptation et vérifier que l’approbation humaine est explicite dans la conversation.
2. Lire les règles du projet applicables avant toute modification.
3. Réaliser l’implémentation cohérente la plus petite qui satisfasse le plan (`app/`, `tests/`).
4. Si le comportement fonctionnel change, ajouter ou mettre à jour des tests ciblés pour couvrir les critères d’acceptation, tout en préservant le comportement existant.
5. Exécuter `make demo-check`, ou chacune des commandes qu’il contient si la cible Make est indisponible.
6. Inspecter le diff final (`git diff`) pour repérer les modifications sans rapport, les secrets et les tests manquants.
7. **Créer ou mettre à jour le journal de suivi dans le sous-répertoire de la tâche : `plans/YYYY-MM-DD-<mini-titre-feature>/AVANCEMENT.md`**.
   Le document doit comporter :
   - `# Suivi d'implémentation & Avancement — <Titre de la tâche>`
   - `## 1. Statut général` (ex: `Implémentation terminée · Contrôles 100% validés`)
   - `## 2. Checklist d'avancement` (reprise des étapes du plan avec cases cochées `- [x]`)
   - `## 3. Fichiers modifiés` (avec description du rôle de chaque changement)
   - `## 4. Preuves d'exécution déterministes` (sorties réelles de `pytest`, `ruff check`, `ruff format`, `mypy`)
   - `## 5. Diff Git résumé`
8. **Dans la conversation Kilo Code** :
   - Annoncer les fichiers modifiés et les preuves d'exécution.
   - Fournir le **lien Markdown direct et cliquable** vers le journal d'avancement :  
     `📋 [Consulter l'avancement : plans/<dossier-daté>/AVANCEMENT.md](plans/<dossier-daté>/AVANCEMENT.md)`
   - Présenter les résultats réels de `make demo-check`.

## Limites strictes

- Ne pas élargir le périmètre sans demander une nouvelle approbation.
- Ne pas affirmer qu’une vérification a réussi si elle n’a pas été exécutée et si sa sortie ne l’étaye pas.
- Ne pas dissimuler une vérification en échec derrière un résumé.
- Ne pas utiliser de commandes destructrices ni de services externes pour cette démonstration locale.

## Sortie attendue dans Kilo Code

- Synthèse concise des fichiers modifiés et verdict des tests.
- Le lien cliquable vers le journal d'avancement :  
  `📋 [Consulter l'avancement : plans/2026-09-27-status-filter/AVANCEMENT.md](plans/2026-09-27-status-filter/AVANCEMENT.md)`.
