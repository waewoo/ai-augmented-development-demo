# Présentation Slidev

`slides.md` est la source de vérité du support. Le PDF et le PPTX sont des exports contrôlés ; le fichier PowerPoint historique généré directement a été remplacé par l’export Slidev.

## Préparer

```bash
npm install
```

Node.js LTS récent est requis. La configuration déclarée vise Node `>=20.19.0`.

## Commandes

```bash
npm run dev                    # présentation web
npm run build                  # build web statique
npm run export:pdf             # exports/presentation.pdf
npm run export:pptx            # exports/presentation.pptx
npm run export:pptx-editable   # fallback documenté, si le PPTX existe
npm run export:png             # captures dans public/screenshots/
npm run check                  # build + contrôle du source Slidev
```

## MCP et skill Slidev

Le MCP est intégré à la CLI Slidev. Depuis la racine du dépôt, les équivalents Makefile sont :

```bash
make slides-mcp-install    # dépendances + rappel de configuration
make slides-mcp-info       # endpoint HTTP et commande stdio
make slides-mcp             # serveur MCP stdio au premier plan
```

Quand `make slides-dev` est actif, l’endpoint HTTP est `http://localhost:3030/__mcp`. Le skill officiel Slidev est installé dans l’environnement Codex ; pour un autre agent compatible avec `skills`, utiliser `npx skills add slidevjs/slidev`.

La version Slidev verrouillée dans `package.json` fournit également un export `pptx-editable`. Les scripts de diffusion génèrent une copie temporaire sans directives `v-click` afin que le PDF, le PPTX et les PNG restent à 18 pages ; la source `slides.md` conserve les animations pour la présentation web. Il reste conseillé de vérifier le rendu et le degré d’éditabilité dans PowerPoint ou LibreOffice avant diffusion.

## Revue visuelle

Utiliser Chrome/Chromium pour ouvrir la présentation web, puis `npm run export:png` pour produire une capture par slide. La planche contact et le contrôle individuel doivent être réalisés avant diffusion. Les artefacts d’export sont ignorés localement si leur taille devient importante ; ils peuvent être ajoutés explicitement lorsqu’ils sont nécessaires à une livraison.
