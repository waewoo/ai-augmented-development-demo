# Guide & Conducteur des Démonstrations (`DEMOS.md`)

Ce document unique centralise l'accès immédiat à votre démonstration filée en direct en 4 actes (cas pratique unique sur l'API FastAPI), ainsi que la préparation et le conducteur chronologique complet de la séance (50 minutes).

---

## 🚀 Accès direct aux 4 Fiches de Démo (Le cas filé en direct)

Pendant la présentation, ouvrez directement la fiche de la démo en cours. Chaque fiche contient l'objectif, les gestes à l'écran, le **prompt prêt à copier/coller en 1 clic** et les phrases clés à dire :

| Acte | Slide & Durée | Fiche détaillée | Objectif & Action clé |
| :--- | :--- | :--- | :--- |
| **Acte 1** | Slide 08 (3 min) | 📄 **[`docs/demo-1.md`](demo-1.md)** | **Le choc des Rules :** Vibe coding naïf sans rules vs avec `AGENTS.md` (refus d'écrire sans plan). |
| **Acte 2** | Slide 10 (4 min) | 📄 **[`docs/demo-2.md`](demo-2.md)** | **Cadrer & Planifier :** Skill `plan-change`, exploration en lecture seule et approbation explicite du plan. |
| **Acte 3** | Slide 12 (4 min) | 📄 **[`docs/demo-3.md`](demo-3.md)** | **Implémenter le plan :** Skill `implement-change`, modification chirurgicale sans dérive de périmètre. |
| **Acte 4** | Slide 14 (4 min) | 📄 **[`docs/demo-4.md`](demo-4.md)** | **Documentation & MCP :** Cartographie Mermaid via `document-architecture` et synchronisation Confluence via MCP. |

---

## 📋 Préparation avant la session

1. **Vérifier l'environnement :** S'assurer que votre éditeur (Kilo Code, Cursor, VS Code) est configuré et connecté à un modèle approuvé.
2. **Contrôle machine initial :** Exécuter `make demo-check` dans le terminal pour garantir un état de départ 100 % vert.
3. **Préparer les onglets utiles :**
   - Le présentoir de démo : [`docs/DEMOS.md`](DEMOS.md)
   - Le fichier de règles : [`AGENTS.md`](../AGENTS.md)
   - L'exemple de skill : [`.kilo/skills/plan-change/SKILL.md`](../.kilo/skills/plan-change/SKILL.md)
   - La doc d'architecture : [`docs/ARCHITECTURE.md`](ARCHITECTURE.md)
4. **Visibilité & confort :** Désactiver les notifications et agrandir la taille de police pour la projection.
5. **Option worktree isolé :** Si vous préférez travailler dans une copie temporaire sans risquer de salir votre dépôt :
   ```bash
   make demo-create-worktree
   ```

---

## 🛡️ Règles d’or en direct

1. **Zéro secret :** Ne saisir aucun mot de passe ou donnée confidentielle.
2. **Lecture seule par défaut :** Bloquer toute écriture non autorisée en phase d'exploration ou de planification.
3. **Preuves réelles :** Montrer les commandes machine (`make demo-check`) et le diff Git, jamais une simple affirmation textuelle de l'agent.
4. **Gestion du temps :** Si une réponse IA tarde (> 25 secondes), basculer immédiatement sur le fichier de secours correspondant dans [`docs/demo-assets/`](demo-assets/).

---

## 🛟 Fichiers de secours en cas de panne (`docs/demo-assets/`)

Si le réseau ou le modèle est ralenti, ouvrez simplement le fichier de secours correspondant :
- **Démo 1 :** [`docs/demo-assets/demo1-secours-sans-rules.md`](demo-assets/demo1-secours-sans-rules.md) et [`demo1-secours-avec-rules.md`](demo-assets/demo1-secours-avec-rules.md)
- **Démo 2 :** [`docs/demo-assets/demo2-secours-plan.md`](demo-assets/demo2-secours-plan.md)
- **Démo 3 :** [`docs/demo-assets/demo4-secours-diff.md`](demo-assets/demo4-secours-diff.md) et [`demo4-secours-checks.md`](demo-assets/demo4-secours-checks.md)
- **Démo 4 :** [`docs/demo-assets/demo3-secours-architecture.md`](demo-assets/demo3-secours-architecture.md) et [`demo4-secours-confluence.md`](demo-assets/demo4-secours-confluence.md)

---

## 🔄 Remise à zéro après la session

Pour remettre le dépôt dans son état de départ propre sans action destructive :
```bash
git status --short
# Si nécessaire :
git switch --detach demo/start
```
