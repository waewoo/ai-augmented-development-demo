# Sécurité et Environnement

- **Garde-fous d'exécution** :
  - Ne jamais exécuter de commandes destructrices ou ambiguës.
  - Ne réaliser aucun appel réseau externe : l'environnement d'exécution reste 100 % local.
  - Utiliser exclusivement des données synthétiques en mémoire.
- **Gestion des secrets** :
  - Ne jamais afficher, versionner, journaliser ou transmettre de jetons, clés API ou identifiants.
- **Contrôle humain** :
  - Demander confirmation humaine préalable avant toute commande à potentiel effet de bord sur le système hôte.
