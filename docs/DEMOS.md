# Guide & Conducteur des Démonstrations (`DEMOS.md`)

Ce document centralise l'accès immédiat à votre démonstration filée en direct en **4 actes** (cas pratique unique sur l'API FastAPI), ainsi que les commandes de bascule déterministes et la gestion du temps pour les 50 minutes de présentation.

---

## ⚡ Les 4 Commandes Démo (Makefile)

Pendant la présentation, restez sur votre session habituelle : **aucun switch Git n'est nécessaire**, Slidev continue de tourner sans aucune coupure.

Chaque acte dispose de sa commande dédiée :

| Commande | Action immédiate | Correspondance Démo & Rôle |
| :--- | :--- | :--- |
| **`make demo-step1`** | Charge le code initial sans filtre `status` | **Acte 1 (Choc des rules)** : montre le refus de coder sans plan avec `AGENTS.md`. |
| **`make demo-step2`** | Charge l'état initial en lecture seule | **Acte 2 (Cadrer & Planifier)** : prêt pour le déclenchement du skill `plan-change`. |
| **`make demo-step3`** | Charge le code avec filtre `status` + 4 tests | **Acte 3 (Implémenter le plan)** : **Secours direct** si l'agent tarde à coder en live. |
| **`make demo-step4`** | Charge le code + doc `ARCHITECTURE.md` Mermaid | **Acte 4 (Documentation & MCP)** : **Secours direct** si MCP ou la génération tarde. |

---

## 🛠️ Commandes de contrôle & d'exécution

| Commande | Rôle |
| :--- | :--- |
| **`make demo-check`** | Lance la validation déterministe (`pytest`, `ruff`, `mypy`) — Preuve machine 100 % verte |
| **`make demo-run-api`** | Démarre l'API FastAPI locale (`http://127.0.0.1:8000/docs`) |
| **`make demo-swagger`** | Ouvre la documentation Swagger interactive dans le navigateur |

---

## 🚀 Accès direct aux 4 Fiches de Démo

| Acte | Slide & Durée | Fiche détaillée | Commande de secours | Objectif & Action clé |
| :--- | :--- | :--- | :--- | :--- |
| **Acte 1** | Slide 08 (3 min) | 📄 **[`docs/demo-1.md`](demo-1.md)** | `make demo-step1` | **Le choc des Rules :** Vibe coding naïf sans rules vs avec `AGENTS.md`. |
| **Acte 2** | Slide 10 (4 min) | 📄 **[`docs/demo-2.md`](demo-2.md)** | `make demo-step2` | **Cadrer & Planifier :** Skill `plan-change`, exploration en lecture seule et approbation du plan. |
| **Acte 3** | Slide 12 (4 min) | 📄 **[`docs/demo-3.md`](demo-3.md)** | `make demo-step3` | **Implémenter le plan :** Skill `implement-change`, modification chirurgicale et `make demo-check`. |
| **Acte 4** | Slide 14 (4 min) | 📄 **[`docs/demo-4.md`](demo-4.md)** | `make demo-step4` | **Documentation & MCP :** Cartographie Mermaid via `document-architecture` et sync Confluence. |

---

## 📋 Préparation avant la session (2 minutes)

1. **Initialiser l'environnement sur la Démo 1 :**
   ```bash
   make demo-step1
   make demo-check
   ```
   *(Vous obtenez 1 test vert, 0 erreur de lint et 0 erreur de typage).*

2. **Démarrer Slidev (si ce n'est pas déjà fait) :**
   ```bash
   make slides-dev
   ```

3. **Préparer les onglets utiles dans l'IDE :**
   - Le présentoir de démo : [`docs/DEMOS.md`](DEMOS.md)
   - Le fichier de règles : [`AGENTS.md`](../AGENTS.md)
   - L'exemple de skill : [`.kilo/skills/plan-change/SKILL.md`](../.kilo/skills/plan-change/SKILL.md)
   - Le fichier cible de l'API : [`app/main.py`](../app/main.py)

4. **Visibilité & confort :** Désactiver les notifications et agrandir la taille de police pour la projection.

---

## 🛡️ Règles d’or en direct

1. **Zéro manipulation Git en direct :** Utilisez `make demo-step1` à `make demo-step4` au lieu de checkout/branches.
2. **Lecture seule par défaut :** Bloquer toute écriture non autorisée en phase d'exploration ou de planification.
3. **Preuves réelles :** Montrer les commandes machine (`make demo-check`) et le diff Git, jamais une simple affirmation textuelle de l'agent.
4. **Gestion du temps :** Si une réponse IA tarde (> 20 secondes), basculer immédiatement sur la commande de secours (`make demo-step3` ou `make demo-step4`) ou sur les fiches dans [`docs/demo-assets/`](demo-assets/).

---

## 🛟 Fichiers de secours en cas de panne (`docs/demo-assets/`)

- **Démo 1 :** [`docs/demo-assets/demo1-secours-sans-rules.md`](demo-assets/demo1-secours-sans-rules.md) et [`demo1-secours-avec-rules.md`](demo-assets/demo1-secours-avec-rules.md)
- **Démo 2 :** [`docs/demo-assets/demo2-secours-plan.md`](demo-assets/demo2-secours-plan.md)
- **Démo 3 :** Commande `make demo-step3`, ou [`docs/demo-assets/demo4-secours-diff.md`](demo-assets/demo4-secours-diff.md) et [`demo4-secours-checks.md`](demo-assets/demo4-secours-checks.md)
- **Démo 4 :** Commande `make demo-step4`, ou [`docs/demo-assets/demo3-secours-architecture.md`](demo-assets/demo3-secours-architecture.md) et [`demo4-secours-confluence.md`](demo-assets/demo4-secours-confluence.md)

---

## 🔄 Réinitialisation / Restauration après la séance

- Pour rejouer la démo depuis le début :
  ```bash
  make demo-step1
  ```
- Pour remettre le projet dans son état final complet :
  ```bash
  make demo-step4
  ```
