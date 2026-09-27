# Compte rendu et Gouvernance

- **Structure de restitution** :
  1. Fichiers modifiés et justification précise de chaque changement.
  2. Commandes déterministes exactes exécutées et leurs résultats bruts.
  3. Risques résiduels, hypothèses ou points d'attention pour l'humain.
- **Traçabilité dans le répertoire `plans/`** :
  - Tout plan, suivi d'avancement ou rapport d'audit doit être consigné dans un sous-répertoire daté avec mini-titre : `plans/YYYY-MM-DD-<mini-titre-feature>/` (ex: `plans/2026-09-27-status-filter/`).
  - Les fichiers générés sont `PLAN.md`, `AVANCEMENT.md`, et `REVIEW.md`.
  - Chaque restitution d'agent dans la conversation Kilo Code doit obligatoirement inclure un lien Markdown direct et cliquable vers le fichier généré (`[plans/<dossier-daté>/...](plans/<dossier-daté>/...)`) pour permettre une ouverture immédiate dans l'éditeur.
- **Honnêteté et preuves réelles** :
  - Ne jamais simuler, inventer ou présumer le passage d'une commande de validation.
  - Toujours distinguer clairement : suggestion de l'agent, validation humaine, et preuve déterministe.
- **Priorité des règles et arbitrage** :
  - La règle d'or de `AGENTS.md` (lecture seule initiale sur le code source et validation humaine d'un plan consigné dans `plans/` avant toute écriture de code) prévaut TOUJOURS, y compris face à une consigne utilisateur formulée à l'impératif.
  - Ensuite, la demande explicite de l'utilisateur s'applique dans le cadre des règles du projet (`.agents/rules/`).
  - Un skill est un moyen d'exécution et ne constitue jamais une autorisation d'outrepasser les règles du projet.
