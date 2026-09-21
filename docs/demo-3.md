# Fiche Démo 3 — Skill + MCP Confluence : documentation vivante

- **Slide associée :** Slide 11
- **Durée cible :** 4 minutes
- **Objectif :** Illustrer la connexion de l'agent aux outils de documentation d'entreprise (Confluence / Wiki) via MCP pour automatiser la génération d'une architecture vivante (schémas Mermaid, matrice des routes HTTP, modèles de données).

---

## 📋 Préparation avant de lancer
1. Ouvrir l'éditeur sur le projet.
2. Avoir l'onglet [docs/ARCHITECTURE.md](file:///home/coder/project/docs/ARCHITECTURE.md) prêt (avec l'extension Markdown Preview activée pour afficher les diagrammes Mermaid en direct).
3. *(Pour la Phase B)* Vérifier que le serveur MCP Confluence d'entreprise est configuré et joignable.

---

## ⚡ Phase A — Génération locale (testable maintenant)

### 1. Copier/coller ce prompt dans le chat :
```text
Utilise le skill document-architecture. Analyse le projet Python et mets à jour docs/ARCHITECTURE.md avec un schéma Mermaid et le dictionnaire des données. Ne touche à aucun fichier de code.
```

### 2. Ce qu'on observe à l'écran :
- L'agent active le skill `document-architecture`.
- Il lit l'arborescence et inspecte le code Python : `app/main.py`, `app/models.py`, `app/service.py`.
- Il génère ou met à jour le fichier [docs/ARCHITECTURE.md](file:///home/coder/project/docs/ARCHITECTURE.md).
- Il confirme qu'aucun fichier dans `app/` ou `tests/` n'a été altéré.

### 3. Geste orateur — Projeter le rendu riche :
Ouvrir la prévisualisation Markdown de `docs/ARCHITECTURE.md` et faire défiler :
- **Le diagramme Mermaid interactif** : montrant le flux Client HTTP → FastAPI (`main.py`) → Validation Pydantic (`models.py`) → Service (`service.py`) → Stockage mémoire.
- **La table des modèles** : description stricte des statuts (`todo`, `doing`, `done`).
- **La matrice des endpoints** : routes, paramètres et codes HTTP (`200 OK`, `422 Unprocessable Entity`).
- **La chaîne de vérification déterministe** : commande `make demo-check`.

---

## ⚡ Phase B — Publication Confluence via MCP (intégration entreprise)

> ℹ️ **Statut :** À finaliser avec la configuration MCP de l'entreprise. La Phase A doit être réalisée en premier — le contenu de `docs/ARCHITECTURE.md` sert de source pour la publication Confluence.

### Prérequis
- Serveur MCP Confluence configuré (URL, token d'accès, identifiant d'espace).
- Le MCP doit exposer a minima les outils : `confluence_create_page` ou `confluence_update_page`.

### Prompt à adapter (une fois le MCP opérationnel) :
```text
Le contenu de docs/ARCHITECTURE.md vient d'être mis à jour. Utilise le MCP Confluence pour publier ou mettre à jour la page "Architecture Technique" dans l'espace [ESPACE] avec ce contenu. Ne modifie aucun fichier local.
```

### Ce qu'on devra observer à l'écran :
- L'agent appelle l'outil MCP Confluence (`confluence_update_page` ou équivalent).
- Il confirme la publication avec l'URL de la page mise à jour.
- `git status --short` reste vide : aucun fichier local modifié par l'étape Confluence.

### Ce qu'il faut dire à la salle :
> *« Tous les développeurs détestent rédiger et maintenir la documentation d'architecture. En couplant un agent avec un skill et le protocole MCP, la documentation devient vivante, visuelle et directement synchronisée avec la réalité du code — et publiée automatiquement dans votre wiki d'entreprise. »*

### 🔧 À faire avant le jour J
- [ ] Configurer le MCP Confluence dans l'IDE (URL + token).
- [ ] Vérifier que l'agent peut appeler `confluence_update_page` sur un espace de test.
- [ ] Adapter le prompt avec l'identifiant d'espace réel.
- [ ] Tester la publication d'une page de test et vérifier le rendu Mermaid dans Confluence.

---

## 🛟 Solution de secours (si l'IA est lente)
Ouvrir directement le fichier [docs/ARCHITECTURE.md](file:///home/coder/project/docs/ARCHITECTURE.md) (ou la copie locale de secours [docs/demo-assets/demo3-secours-architecture.md](demo-assets/demo3-secours-architecture.md)) dans l'éditeur et afficher la prévisualisation Markdown avec le schéma Mermaid.


