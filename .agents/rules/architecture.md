# Principes d'Architecture

- **Séparation stricte des responsabilités** :
  - **Couche API (`app/main.py`)** : déclare les routes FastAPI, documente les endpoints et délègue immédiatement au service. Elle ne doit contenir aucune logique métier ni algorithme de filtrage.
  - **Couche Modèles (`app/models.py`)** : définit les schémas de données Pydantic et les énumérations (types fermés).
  - **Couche Métier (`app/service.py`)** : implémente la logique d'interrogation et de filtrage des données. Le service est du code Python pur : il ne doit dépendre d'aucun composant HTTP FastAPI (`Request`, `Response`, `Query`, `HTTPException`).
- **Gestion de l'état mémoire** :
  - Stockage en mémoire vive uniquement, sans dépendance de base de données externe.
  - **Immutabilité défensive** : toujours renvoyer des copies (nouvelles listes ou `.copy()`) pour éviter toute altération accidentelle de l'état en mémoire.
- **Sobriété technique** :
  - Préférer la solution la plus simple et lisible sans sur-ingénierie.
