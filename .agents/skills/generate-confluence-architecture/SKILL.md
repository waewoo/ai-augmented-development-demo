---
name: generate-confluence-architecture
description: Lire le document d'architecture docs/ARCHITECTURE.md, interagir avec l'utilisateur pour spécifier l'emplacement Confluence (espace, page parente, titre), et générer une page Confluence à fort impact visuel (« effet whaoo ») au format standard Confluence Storage Format (XHTML natif Atlassian avec layouts multi-colonnes, lozenges de statut, panneaux d'appel, expanders, blocs de code syntaxés et checklists).
---

# Générer une page Confluence d'architecture logicielle

Utiliser ce skill lorsqu'un utilisateur souhaite convertir la documentation d'architecture technique locale (`docs/ARCHITECTURE.md`) en une page Confluence professionnelle, ergonomique et visuellement percutante (« effet whaoo »), exploitant nativement les capacités avancées et les objets graphiques de Confluence.

---

## 1. Procédure étape par étape

### Étape 1 : Collecte interactive des informations de publication (Obligatoire)
Avant de générer le moindre contenu, l'agent **DOIT impérativement poser les questions suivantes à l'utilisateur** :
1. **Clé d'espace Confluence (*Space Key*)** : ex. `TECH`, `ARCH`, `DEV`, `PROJ`.
2. **Page parente (*Parent Page*)** : Titre ou ID de la page parente sous laquelle insérer cette documentation (ou indiquer s'il s'agit de la racine de l'espace).
3. **Titre de la page cible** : Proposer par défaut : `Architecture logicielle & Flux de données — Task Service`.
4. **Mode d'exportation souhaité** :
   - **Mode A (Recommandé - Fichier XHTML)** : Génération du fichier complet au format standard *Confluence Storage Format* (`docs/ARCHITECTURE_CONFLUENCE.xhtml`), prêt à être collé via le *Confluence Source Editor* ou téléversé.
   - **Mode B (Publication API REST automatisée)** : L'agent fournit le script Python ou la commande `curl` prête à l'emploi utilisant des variables d'environnement (`CONFLUENCE_URL`, `CONFLUENCE_USER`, `CONFLUENCE_API_TOKEN`).

### Étape 2 : Ingestion et analyse du document source
- Lire attentivement `/home/coder/project/docs/ARCHITECTURE.md`.
- Extraire :
  - La vue d'ensemble et le découplage des couches (API, Modèles, Métier, Tests).
  - Le diagramme Mermaid d'architecture logicielle.
  - Le dictionnaire de données (énumération `TaskStatus`, schéma Pydantic `Task`, état en mémoire).
  - Les spécifications des routes REST (méthode, URL, query params, codes `200` et `422`, payloads d'exemple).
  - La chaîne de vérification déterministe (`make demo-check`).
  - Les références croisées aux règles du projet.

### Étape 3 : Construction de la page Confluence à fort impact visuel (« Effet Whaoo »)
La page générée au format *Confluence Storage Format* (XHTML) doit intégrer les standards graphiques d'entreprise :

1. **Bannière d'en-tête & Cartouche Métadonnées** :
   - Layout multi-colonnes (`ac:layout`, `ac:layout-section`, `ac:layout-cell`).
   - Badges et *Lozenges* de statut natifs (`ac:structured-macro ac:name="status"`) :
     - Statut du document : `VALIDÉ` (couleur `Green`).
     - Environnement : `PRODUCTION` (couleur `Blue`) ou `DEMO` (couleur `Yellow`).
     - Version : `v1.0.0` (couleur `Grey`).
     - Espace cible et Page parente renseignés dynamiquement.
2. **Table des matières dynamique** :
   - Macro `toc` intégrée dans un panneau latéral ou en haut de document avec outline stylisé.
3. **Panneaux d'information visuels sémantiques** :
   - `ac:structured-macro ac:name="info"` : Vue d'ensemble du projet et principe architectural.
   - `ac:structured-macro ac:name="tip"` : Règle d'immutabilité défensive du service en mémoire.
   - `ac:structured-macro ac:name="warning"` : Rejet strict automatique Pydantic (`422 Unprocessable Entity`) pour les valeurs hors énumération.
   - `ac:structured-macro ac:name="note"` : Pipeline déterministe `make demo-check` obligatoire.
4. **Tableaux structurés & Stylisés** :
   - En-têtes contrastés (`<th>`).
   - Badges colorés dans les cellules pour les statuts (`TODO` en gris, `DOING` en jaune, `DONE` en vert) et pour les verbes HTTP (`GET` en bleu).
5. **Sections repliables (*Expanders*)** :
   - Macro `ac:structured-macro ac:name="expand"` pour dissimuler les longs exemples JSON (réponse nominale complète, exemple de payload d'erreur 422) afin de préserver la lisibilité de la page.
6. **Blocs de code syntaxés** :
   - Macro `ac:structured-macro ac:name="code"` avec coloration syntaxique (`json`, `python`, `bash`), numérotation des lignes et titre de bloc.
7. **Diagramme Mermaid & Architecture** :
   - Intégration du schéma dans un bloc de code Mermaid ou macro dédiée Confluence, avec une description textuelle claire des flux.
8. **Checklist interactive de validation** :
   - Macro de tâches interactives Confluence (`ac:task-list`, `ac:task`, `ac:task-status`).

### Étape 4 : Génération et restitution
- Écrire le fichier de sortie dans `docs/ARCHITECTURE_CONFLUENCE.xhtml`.
- Présenter à l'utilisateur :
  - Un résumé des éléments visuels intégrés.
  - Le lien direct vers le fichier généré : `[docs/ARCHITECTURE_CONFLUENCE.xhtml](docs/ARCHITECTURE_CONFLUENCE.xhtml)`.
  - Le guide d'importation dans Confluence (copier-coller via *Source Editor* ou injection via curl/Python).

---

## 2. Spécification des Objets Graphiques Confluence (Storage Format)

### Cartouche de métadonnées avec Lozenges
```xml
<ac:layout>
  <ac:layout-section ac:type="two_equal">
    <ac:layout-cell>
      <p><strong>Espace cible :</strong> <ac:structured-macro ac:name="status"><ac:parameter ac:name="title">SPACE_KEY</ac:parameter><ac:parameter ac:name="colour">Blue</ac:parameter></ac:structured-macro></p>
      <p><strong>Page parente :</strong> PARENT_PAGE</p>
    </ac:layout-cell>
    <ac:layout-cell>
      <p><strong>Statut :</strong> <ac:structured-macro ac:name="status"><ac:parameter ac:name="title">VALIDÉ</ac:parameter><ac:parameter ac:name="colour">Green</ac:parameter></ac:structured-macro></p>
      <p><strong>Dernière mise à jour :</strong> <time datetime="TODAY_ISO"/></p>
    </ac:layout-cell>
  </ac:layout-section>
</ac:layout>
```

### Panneaux d'appel colorés
```xml
<!-- Info Box -->
<ac:structured-macro ac:name="info">
  <ac:rich-text-body>
    <p>Texte informatif ou résumé de gouvernance.</p>
  </ac:rich-text-body>
</ac:structured-macro>

<!-- Tip Box -->
<ac:structured-macro ac:name="tip">
  <ac:rich-text-body>
    <p>Bonne pratique (ex. immutabilité défensive).</p>
  </ac:rich-text-body>
</ac:structured-macro>

<!-- Warning Box -->
<ac:structured-macro ac:name="warning">
  <ac:rich-text-body>
    <p>Avertissement sur la validation stricte et les erreurs 422.</p>
  </ac:rich-text-body>
</ac:structured-macro>
```

### Section repliable (*Expand*)
```xml
<ac:structured-macro ac:name="expand">
  <ac:parameter ac:name="title">Afficher l'exemple de payload JSON</ac:parameter>
  <ac:rich-text-body>
    <ac:structured-macro ac:name="code">
      <ac:parameter ac:name="language">json</ac:parameter>
      <ac:parameter ac:name="linenumbers">true</ac:parameter>
      <ac:plain-text-body><![CDATA[{
  "id": 1,
  "title": "Lire le brief",
  "status": "done"
}]]></ac:plain-text-body>
    </ac:structured-macro>
  </ac:rich-text-body>
</ac:structured-macro>
```

### Table des matières
```xml
<ac:structured-macro ac:name="toc">
  <ac:parameter ac:name="outline">true</ac:parameter>
  <ac:parameter ac:name="style">none</ac:parameter>
</ac:structured-macro>
```

---

## 3. Limites strictes

- **Code source sanctuarisé** : Ne modifier, créer ni supprimer aucun fichier de code applicatif ou de test (`app/`, `tests/`).
- **Gestion des secrets** : Ne jamais écrire en clair d'identifiants, tokens d'API Atlassian ou mots de passe dans les fichiers ou la conversation (se conformer à `.agents/rules/security.md`).
- **Périmètre d'écriture** : Le skill écrit exclusivement le fichier généré sous `docs/` (ex. `docs/ARCHITECTURE_CONFLUENCE.xhtml`).

---

## 4. Format de sortie attendu

Un fichier `docs/ARCHITECTURE_CONFLUENCE.xhtml` valide, bien indenté, contenant l'ensemble des balises *Confluence Storage Format*, prêt à être collé dans le *Confluence Source Editor* ou poussé par l'API REST Atlassian.
