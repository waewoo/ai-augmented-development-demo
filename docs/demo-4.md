# Fiche Démo 4 — Génération automatique de documentation & Synchronisation Confluence via MCP

- **Slide associée :** Slide 14
- **Durée cible :** 4 minutes
- **Objectif :** Démontrer l'automatisation de la documentation vivante : une fois le code validé, l'agent utilise le skill `document-architecture` pour actualiser la cartographie technique (Mermaid) et appelle le connecteur MCP Confluence (`confluence_update_page`) pour publier la documentation d'équipe sans aucun copier-coller.

---

## 📋 Préparation avant de lancer

1. **Vérifier le code :** Le code doit contenir le filtre `status` et les 4 tests validés.
   - *Si vous arrivez de la Démo 3 :* Le code est déjà en place.
   - *Si vous démarrez directement à cette étape (ou pour initialiser) :* Exécutez simplement :
     ```bash
     make demo-step3
     make demo-check
     ```
2. Avoir le connecteur MCP Confluence activé (ou la simulation locale).
3. Avoir la commande de secours en tête : **`make demo-step4`** (charge directement le code et `docs/ARCHITECTURE.md` finalisé avec Mermaid).

---

## ⚡ Déroulement de la démonstration en direct

### 1. Copier/coller ce prompt dans le chat :
```text
Le filtre status est validé par les tests. Utilise le skill document-architecture pour mettre à jour docs/ARCHITECTURE.md avec les nouveaux flux et le diagramme Mermaid. Puis utilise le connecteur MCP Confluence pour synchroniser la page d'architecture de l'espace TECH. Ne modifie aucun fichier hors périmètre.
```

### 2. Ce qu'on observe à l'écran :
1. **Étape 1 — Cartographie vivante (`document-architecture`) :**
   - L'agent inspecte le code réel (`app/main.py`, `app/models.py`, `app/service.py`).
   - Il met à jour `docs/ARCHITECTURE.md` en intégrant le filtre `status: TaskStatus` dans la matrice des endpoints et le diagramme de flux Mermaid.
2. **Étape 2 — L'appel d'outil MCP Confluence :**
   - L'agent appelle l'outil `confluence_update_page` exposé par le serveur MCP Confluence.
   - Il transmet le contenu formaté et le diagramme Mermaid vers le wiki d'équipe.
3. **Étape 3 — Confirmation dans le chat :**
   - L'agent affiche le statut `200 OK — Page Confluence synchronisée avec succès` et l'URL directe de la page Confluence.

---

### 3. Ce qu'il faut dire à la salle :
> *« Rédiger et maintenir la documentation technique et les pages Confluence, c'est la tâche indispensable que toutes les équipes ont du mal à maintenir à jour. Ici, grâce au protocole MCP et aux skills, la doc devient vivante, visuelle avec ses diagrammes Mermaid, et synchronisée directement dans votre wiki d'entreprise en 30 secondes, sans jamais quitter l'IDE. »*

---

## 🛟 Solution de secours (si le réseau ou le token Confluence n'est pas accessible)

1. Dans le terminal, tapez :
   ```bash
   make demo-step4
   ```
   *(Cela charge instantanément la documentation [docs/ARCHITECTURE.md](file:///home/coder/project/docs/ARCHITECTURE.md) mise à jour avec le diagramme Mermaid).*
2. Ouvrez le fichier [docs/ARCHITECTURE.md](file:///home/coder/project/docs/ARCHITECTURE.md) dans l'éditeur et affichez la **prévisualisation Markdown avec le schéma Mermaid interactif**.
3. Montrez [`docs/demo-assets/demo4-secours-confluence.md`](demo-assets/demo4-secours-confluence.md) pour illustrer le payload JSON envoyé via MCP et la réponse de succès du serveur Confluence.
