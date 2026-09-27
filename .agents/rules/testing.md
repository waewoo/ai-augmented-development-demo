# Stratégie de Tests

- **Couverture ciblée** : Tout critère d'acceptation fonctionnel doit être couvert par un test d'intégration dans le répertoire `tests/`.
- **Cas à couvrir systématiquement pour les endpoints** :
  1. **Non-régression / Comportement par défaut** : valider le comportement nominal sans paramètre optionnel.
  2. **Cas nominaux ciblés** : valider le comportement attendu pour chaque filtre ou paramètre valide.
  3. **Rejet des entrées invalides** : vérifier que toute entrée non conforme au contrat d'interface renvoie une erreur appropriée (ex: code HTTP `422 Unprocessable Entity` pour les types fermés ou énumérés).
- **Conventions d'écriture** :
  - Utiliser le `TestClient(app)` de FastAPI sans dépendances de mocks externes.
  - Vérifier systématiquement les codes retour HTTP et le corps de réponse JSON.
  - Préserver impérativement l'intention et la réussite des tests préexistants.
- **Rôle des tests** : Les tests constituent des preuves déterministes obligatoires, à combiner avec l'inspection visuelle du diff Git.
