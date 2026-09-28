# 🎬 Guide & Conducteur Complet des Démonstrations en Direct (`DEMOS.md`)

> **Fiche unique de référence pour l'orateur**  
> Ce document rassemble l'intégralité du scénario des démonstrations en direct réparties sur les 17 slides de la présentation (45 minutes d'exposé/démos + 15 min échanges), les commandes de bascule déterministes, les options en direct (*avec vs sans rules*), et la gestion des imprévus.  
> **Un seul onglet à garder ouvert à côté de votre IDE.**

---

## 📑 Sommaire interactif (TOC)

1. [⚡ Les Commandes Clés du Makefile](#commandes-makefile)
2. [📋 Préparation avant la session (2 minutes)](#preparation-session)
3. [🧭 Étape 0 — Le "Tour du cockpit" de l'IDE (30 s)](#cockpit)
4. [🟢 ACTE 1 (Slide 06) — Le duo Rules + Skills : Cadrer & Planifier (4 min)](#acte-1)
   - [Option A — Le Choc en direct (Sans Rules puis Avec Rules)](#acte-1-option-a)
   - [Option B — L'Option Express (Alternative 45 s)](#acte-1-option-b)
   - [Ce qu'on observe à l'écran](#acte-1-obs)
   - [Ce qu'il faut dire à la salle](#acte-1-talk)
   - [Solutions de secours](#acte-1-secours)
5. [🟠 ACTE 2 (Slide 10) — De l'approbation au code : Implémentation chirurgicale (4 min 30)](#acte-2)
   - [Le prompt d'approbation](#acte-2-prompt)
   - [Vérification déterministe par la machine](#acte-2-check)
   - [Ce qu'il faut dire à la salle](#acte-2-talk)
   - [Solution de secours rapide](#acte-2-secours)
6. [🟣 ACTE 3 (Slide 12) — Documentation vivante & Synchronisation Confluence via MCP (4 min 30)](#acte-3)
   - [Le prompt d'actualisation et sync](#acte-3-prompt)
   - [Ce qu'on observe à l'écran](#acte-3-obs)
   - [Ce qu'il faut dire à la salle](#acte-3-talk)
   - [Solution de secours](#acte-3-secours)
7. [🛡️ Règles d'or de l'orateur en direct](#regles-or)
8. [🔄 Réinitialisation & Restauration](#reset)

---

<a id="commandes-makefile"></a>
## ⚡ 1. Les Commandes Clés du Makefile

Pendant la présentation, restez sur votre session habituelle : **aucun switch Git complexe n'est nécessaire**, Slidev continue de tourner sans interruption.

### Commandes de bascule des états de Démo

| Commande | Action immédiate | Rôle & Correspondance |
| :--- | :--- | :--- |
| **`make demo-step1`** *(ou `demo-rules`)* | Charge le code initial sans filtre et active `AGENTS.md` + `kilo.jsonc` | **Acte 1 (Rules & Skills)** : prêt pour lancer le prompt brut et observer le blocage en lecture seule. |
| **`make demo-step1-sans-rules`** *(ou `demo-norules`)* | Masque temporairement `AGENTS.md` et `kilo.jsonc` (en `.disabled`) | **Acte 1 (Variante Choc)** : montre la dérive immédiate en *vibe coding* sans règles. |
| **`make demo-step2`** | Injecte le code implémenté avec le filtre `status` et les 4 tests validés | **Acte 2 (Secours Implémentation)** : injecte en 1 clic le code final si l'agent tarde en live. |
| **`make demo-step3`** | Injecte le code complet + `docs/ARCHITECTURE.md` à jour avec les schémas Mermaid | **Acte 3 (Secours Doc & MCP)** : charge la documentation finale si MCP ou le réseau tarde. |

### Commandes d'exécution et de contrôle

| Commande | Rôle |
| :--- | :--- |
| **`make demo-check`** | Lance la validation déterministe (`pytest`, `ruff check`, `ruff format`, `mypy`) — Preuve machine 100 % verte |
| **`make demo-run-api`** | Démarre l'API FastAPI locale (`http://127.0.0.1:8000/docs`) avec rechargement à chaud |
| **`make demo-swagger`** | Ouvre directement la documentation Swagger interactive dans le navigateur par défaut |
| **`make slides-dev`** | Démarre le serveur web Slidev (`http://localhost:3030`) |

---

<a id="preparation-session"></a>
## 📋 2. Préparation avant la session (2 minutes)

1. **Initialiser l'environnement sur la Démo 1 :**
   ```bash
   make demo-step1
   make demo-check
   ```
   *(Confirme 1 test vert, 0 erreur de lint et 0 erreur de typage).*

2. **Démarrer la présentation Slidev :**
   ```bash
   make slides-dev
   ```

3. **Préparer les onglets utiles dans l'IDE :**
   - Le guide conducteur : [`docs/DEMOS.md`](file:///home/coder/project/docs/DEMOS.md) *(cet onglet)*
   - La constitution du projet : [`AGENTS.md`](file:///home/coder/project/AGENTS.md)
   - L'exemple de méthode : [`.agents/skills/plan-change/SKILL.md`](file:///home/coder/project/.agents/skills/plan-change/SKILL.md)
   - Le point d'entrée API : [`app/main.py`](file:///home/coder/project/app/main.py)

4. **Visibilité & confort :** Désactiver les notifications système et zoomer la taille de police (`Ctrl +` / `Cmd +`) pour la salle.

---

<a id="cockpit"></a>
## 🧭 3. Étape 0 — Le "Tour du cockpit" de l'IDE (30 secondes)
*À présenter avant le premier prompt pour orienter l'auditoire :*

1. **À gauche — Le projet :** Pointez l'arborescence standard, la présence de [`AGENTS.md`](file:///home/coder/project/AGENTS.md) (le cadre passif permanent) et du dossier `.agents/skills/` (les méthodes outillées).
2. **Au centre — L'espace d'exécution :** L'éditeur de code (`app/main.py` sans filtre) et le terminal où tournent nos vérifications réelles (`make demo-check`).
3. **À droite — L'agent :** Le panneau de conversation outillé.
4. **La phrase clé d'ingénieur :**
   > *« Nous utilisons ici Kilo Code pour la démo, mais cette tripartition (fichiers, terminal, panneau d'agent) est identique dans Cursor, Copilot Edits ou Claude Code en terminal. La méthode que nous allons voir est 100 % universelle. »*

<br>

================================================================================
<a id="acte-1"></a>
# 🟢 ACTE 1 (Slide 06) — Le duo Rules + Skills : Cadrer & Planifier
================================================================================

- **Slide associée :** Slide 06 (minute 8m30 à 12m30)
- **Durée cible :** 4 minutes
- **Objectif :** Démontrer l'impact immédiat du duo Rules + Skills face à un prompt direct et impératif : l'agent refuse d'écrire du code à l'aveugle grâce à `AGENTS.md` (la Rule), active le skill `plan-change` (le Skill) et produit un plan de cadrage rigoureux en demandant l'approbation humaine.

---

<a id="acte-1-option-a"></a>
### Option A — Le Choc en direct (Recommandé · 1 min 30)

#### 1. Étape Sans Rules (Observation de la dérive)
Dans le terminal :
```bash
make demo-step1-sans-rules
```
*(Masque `AGENTS.md` et `kilo.jsonc` en 1 seconde).*  
Dans le chat de l'agent, envoyez :
```text
Ajoute un filtre optionnel status sur GET /tasks.
```
👉 **Ce qu'on observe :** L'agent part immédiatement coder, modifie 3 ou 4 fichiers en vrac sans rien demander. C'est le piège classique du *vibe coding*.

#### 2. Étape Avec Rules & Skills (Discipline et méthode)
Dans le terminal, réactivez le cadre :
```bash
make demo-step1
```
*(Restaure `AGENTS.md` et remet le code initial propre en 1 seconde).*  
Dans un **nouveau chat**, renvoyez exactement le même prompt brut :
```text
Ajoute un filtre optionnel status sur GET /tasks.
```

---

<a id="acte-1-option-b"></a>
### Option B — L'Option Express (Alternative 45 secondes)
Si vous manquez de temps pour le va-et-vient, projetez en 10 secondes le fichier préparé [`docs/demo-assets/demo1-secours-sans-rules.md`](demo-assets/demo1-secours-sans-rules.md) pour commenter la dérive sans rules, puis lancez directement le prompt avec rules (`make demo-step1`).

---

<a id="acte-1-obs"></a>
### Ce qu'on observe immédiatement à l'écran
1. **La Rule agit :** L'agent commence par *« The constitution requires read-only planning first »* et refuse catégoriquement de modifier le moindre fichier de code applicatif (`app/`, `tests/`).
2. **Le Skill agit & consigne le plan :** L'agent active le skill `plan-change` :
   - Il crée le plan complet dans le sous-dossier daté dédié [`plans/2026-09-27-status-filter/PLAN.md`](plans/2026-09-27-status-filter/PLAN.md) (Compréhension, Critères d'acceptation, Fichiers ciblés, Stratégie de tests, Risques et Checklist `- [ ]`).
   - Il affiche dans le chat Kilo Code un résumé exécutif ainsi qu'un **lien cliquable direct** :  
     `📄 [Consulter le plan : plans/2026-09-27-status-filter/PLAN.md](plans/2026-09-27-status-filter/PLAN.md)`.
3. **Le réflexe d'ingénieur en direct :**
   👉 **Cliquez sur le lien dans le chat Kilo Code** : le fichier [`plans/2026-09-27-status-filter/PLAN.md`](plans/2026-09-27-status-filter/PLAN.md) s'ouvre instantanément dans l'éditeur sous les yeux du public, matérialisant le sous-dossier daté et le cadrage rigoureux avant toute écriture.
4. **L'Humain pilote :** L'agent s'arrête net et demande votre validation formelle :
   > *« Approbation humaine requise : Confirmez-vous l'approbation de ce plan pour que j'applique les changements ? »*

<a id="acte-1-talk"></a>
### 💬 Ce qu'il faut dire à la salle
> *« Regardez : même prompt direct à l'impératif. Sans rules, l'IA fonce modifier le code n'importe comment. Avec le duo AGENTS.md et le skill plan-change, la Rule a sanctuarisé le code source et le Skill a rédigé le plan dans plans/2026-09-27-status-filter/PLAN.md avec un lien direct cliquable dans Kilo Code. L'IA n'est plus un stagiaire imprévisible, elle devient un collaborateur discipliné sous notre contrôle. »*

<a id="acte-1-secours"></a>
### 🛟 Solutions de secours Acte 1
- Si besoin d'illustrer la dérive sans rules hors-ligne : [`docs/demo-assets/demo1-secours-sans-rules.md`](demo-assets/demo1-secours-sans-rules.md)
- Si l'agent tarde à générer le plan : projetez [`docs/demo-assets/demo2-secours-plan.md`](demo-assets/demo2-secours-plan.md) ou ouvrez [`docs/demo-steps/step-2/plans/2026-09-27-status-filter/PLAN.md`](demo-steps/step-2/plans/2026-09-27-status-filter/PLAN.md).

<br>

================================================================================
<a id="acte-2"></a>
# 🟠 ACTE 2 (Slide 10) — De l'approbation au code : Implémentation chirurgicale
================================================================================

- **Slide associée :** Slide 10 (minute 18m30 à 23m00)
- **Durée cible :** 4 minutes 30
- **Objectif :** Démontrer le passage du plan approuvé à l'écriture minimale de code avec le skill `implement-change`. L'agent modifie uniquement le périmètre convenu, consigne son suivi dans `plans/2026-09-27-status-filter/AVANCEMENT.md`, puis on valide immédiatement le résultat avec l'oracle déterministe (`make demo-check`).

### 1. Préparation
Gardez la conversation de l'Acte 1 ouverte dans l'IDE.

<a id="acte-2-prompt"></a>
### 2. Le prompt à copier/coller dans le chat
```text
J'approuve le plan. Utilise le skill implement-change pour implémenter le filtre status sur GET /tasks. Respecte TaskStatus, garantis le rejet 422 pour les statuts invalides et préserve le comportement sans filtre.
```

### 3. Ce qu'on observe en direct à l'écran
1. **Écriture chirurgicale :**
   - L'agent active le skill `implement-change`.
   - Il modifie `app/service.py` (filtrage pur sans dépendance HTTP) et `app/main.py` (délégation avec typage strict).
   - Zéro dépendance externe inutile.
2. **Traçabilité & Avancement :**
   - L'agent crée / met à jour [`plans/2026-09-27-status-filter/AVANCEMENT.md`](plans/2026-09-27-status-filter/AVANCEMENT.md) avec les étapes cochées (`- [x]`) et les résultats de vérification.
   - Il fournit le lien direct cliquable dans Kilo Code : `📋 [Consulter l'avancement : plans/2026-09-27-status-filter/AVANCEMENT.md](plans/2026-09-27-status-filter/AVANCEMENT.md)`.
   👉 **Cliquez sur le lien dans Kilo Code** pour afficher le journal de bord d'implémentation dans l'éditeur.

<a id="acte-2-check"></a>
### 4. Preuve machine immédiate (dans le terminal)
Lancez la commande déterministe sous les yeux du public :
```bash
make demo-check
```
- `pytest` : 4 tests verts (nominal, par défaut, et 422).
- `ruff` : 0 erreur de lint et conformité du formatage.
- `mypy` : typage strict validé à 100 %.
- Message vert de conclusion : `✅ Tous les contrôles déterministes sont validés à 100% !`

### 5. Inspection du diff Git
Un `git diff` rapide montre que seules les lignes convenues ont été modifiées.

<a id="acte-2-talk"></a>
### 💬 Ce qu'il faut dire à la salle
> *« L'agent a produit son code en quelques secondes, dans un périmètre chirurgical dicté par le plan, et a tracé son avancement dans plans/2026-09-27-status-filter/AVANCEMENT.md. Et comme on l'a vu sur la slide précédente : on ne le croit pas sur parole, on a immédiatement lancé make demo-check. C'est vert à 100 %. Le code est prouvé par la machine, pas par un sentiment. »*

<a id="acte-2-secours"></a>
### 🛟 Solution de secours Acte 2 (si besoin d'accélérer)
Dans le terminal :
```bash
make demo-step2
make demo-check
```
*(Charge instantanément le code implémenté, les fichiers dans `plans/` et valide les 4 tests verts en direct).*  
Fichiers d'inspection statique : [`docs/demo-assets/demo4-secours-diff.md`](demo-assets/demo4-secours-diff.md) et [`docs/demo-assets/demo4-secours-checks.md`](demo-assets/demo4-secours-checks.md).

<br>

================================================================================
<a id="acte-3"></a>
# 🟣 ACTE 3 (Slide 12) — Documentation vivante & Synchronisation Confluence via MCP
================================================================================

- **Slide associée :** Slide 12 (minute 25m00 à 29m30)
- **Durée cible :** 4 minutes 30
- **Objectif :** Démontrer l'intégration de l'agent au système d'entreprise grâce au protocole MCP : mise à jour automatique de la documentation d'architecture avec des schémas Mermaid et synchronisation en direct avec la page Confluence d'équipe, sans aucun copier-coller.

### 1. Préparation
Le code de l'Acte 2 est en place et validé par les tests.

<a id="acte-3-prompt"></a>
### 2. Le prompt à copier/coller dans le chat
```text
Le filtre status est validé par les tests. Utilise le skill document-architecture pour mettre à jour docs/ARCHITECTURE.md avec les nouveaux flux et le diagramme Mermaid. Puis utilise le connecteur MCP Confluence pour synchroniser la page d'architecture de l'espace TECH. Ne modifie aucun fichier hors périmètre.
```

<a id="acte-3-obs"></a>
### 3. Ce qu'on observe en direct à l'écran
1. **Cartographie vivante (`document-architecture`) :**
   - L'agent inspecte le code réel et met à jour [`docs/ARCHITECTURE.md`](file:///home/coder/project/docs/ARCHITECTURE.md).
   - Le diagramme de flux Mermaid est régénéré pour refléter le filtre `status`.
2. **Appel d'outil MCP Confluence :**
   - L'agent appelle l'outil `confluence_update_page` exposé par le serveur MCP Confluence.
   - Il transmet le contenu formaté et le diagramme Mermaid directement vers le wiki d'entreprise.
3. **Confirmation :**
   - L'agent affiche le statut `200 OK — Page Confluence synchronisée avec succès` et le lien de la page.

<a id="acte-3-talk"></a>
### 💬 Ce qu'il faut dire à la salle
> *« Maintenir la documentation technique et les wikis d'entreprise à jour est une corvée souvent délaissée. Grâce au protocole MCP et aux skills, votre documentation devient vivante, visuelle et directement synchronisée avec la réalité du code en 30 secondes, sans jamais quitter l'IDE. »*

<a id="acte-3-secours"></a>
### 🛟 Solution de secours Acte 3 (si Confluence n'est pas joignable)
Dans le terminal :
```bash
make demo-step3
```
Puis ouvrez [`docs/ARCHITECTURE.md`](file:///home/coder/project/docs/ARCHITECTURE.md) et affichez la prévisualisation Markdown avec le schéma Mermaid interactif.  
Fiche de secours JSON MCP : [`docs/demo-assets/demo4-secours-confluence.md`](demo-assets/demo4-secours-confluence.md).

---

<a id="regles-or"></a>
## 🛡️ 7. Règles d'or de l'orateur en direct

1. **Zéro manipulation Git manuelle en direct :** Utilisez exclusivement `make demo-step1`, `make demo-step2`, `make demo-step3` au lieu de `git checkout` ou de bascules de branches.
2. **Lecture seule par défaut :** Toujours exiger que l'agent présente un plan avant de toucher au code.
3. **Preuves réelles, jamais de confiance aveugle :** Montrer systématiquement les commandes machine (`make demo-check`) et le diff Git (`git diff`).
4. **Gestion du temps (règle des 20 secondes) :** Si une réponse IA tarde plus de 20 secondes, ne laissez pas de temps mort : lancez immédiatement la commande de secours (`make demo-step2` ou `make demo-step3`) et commentez le résultat.

---

<a id="reset"></a>
## 🔄 8. Réinitialisation & Restauration

- **Pour rejouer la démo depuis le début :**
  ```bash
  make demo-step1
  ```
- **Pour remettre le projet dans son état final complet (après session) :**
  ```bash
  make demo-step3
  make demo-check
  ```
- **Pour forcer une réinitialisation Git propre :**
  ```bash
  git reset --hard && git switch --detach demo/start
  ```
