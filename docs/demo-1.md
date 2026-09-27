# Fiche Démo 1 — Le choc des Rules : Avec vs Sans `AGENTS.md`

- **Slide associée :** Slide 08
- **Durée cible :** 3 minutes
- **Objectif :** Montrer le contraste saisissant entre une demande brute sans rules (l'agent modifie du code à l'aveugle et invente des conventions) et une demande cadrée par `AGENTS.md` (l'agent refuse d'écrire sans plan, respecte le typage strict et impose les vérifications).

---

## 🧭 Étape 0 — Le "Tour du cockpit" de l'IDE (30 secondes)

Avant de lancer le premier prompt, prenez 30 secondes pour orienter la salle dans l'interface de Kilo Code (ou de votre IDE) afin d'éviter toute distraction :

1. **À gauche — Le projet :** Pointez l'arborescence standard (`app/`, `tests/`, `Makefile`) et la présence de `AGENTS.md` à la racine.
2. **Au centre — L'espace d'exécution :** L'éditeur de code et le terminal local où tournent nos commandes réelles (`make demo-check`).
3. **À droite — L'agent :** Le panneau de conversation outillé qui dispose d'autorisations pour inspecter les fichiers et lancer des outils.
4. **La phrase clé d'ingénieur :**
   > *« Nous utilisons ici Kilo Code pour la démo, mais cette tripartition (fichiers, terminal, panneau d'agent) est identique dans Cursor, Copilot Edits ou Claude Code en terminal. La méthode que nous allons voir est 100 % universelle. »*

---

## ⚡ Déroulement recommandé (Fluide & sans risque d'aléa)

### 1. Illustrer la dérive "Sans rules" (20 secondes)
Plutôt que de perdre 3 minutes à masquer des fichiers et vider les caches de l'IDE en direct, appuyez-vous sur la Slide 08 (`magic-move`) ou projetez en 10 secondes le fichier préparé [`docs/demo-assets/demo1-secours-sans-rules.md`](demo-assets/demo1-secours-sans-rules.md) :
> *« Sans consigne explicite, que fait un modèle ? Il se fie à ses probabilités : il modifie 4 fichiers d'un coup, invente un paramètre non typé, ignore notre code d'erreur HTTP 422 et prétend avec assurance que tout marche. C'est le piège classique du vibe coding. »*

### 2. Lancer la demande en direct "Avec rules" (Chat de l'agent)
Copier/coller ce prompt dans le chat :
```text
Ajoute un filtre optionnel status sur GET /tasks.
```

### 3. Ce qu'on observe immédiatement à l'écran :
- L'agent commence par **lire `AGENTS.md`**.
- Il applique la règle d'or : **lecture seule par défaut**, et refuse de modifier le moindre fichier sans plan préalable.
- Il rappelle les contraintes strictes du projet :
  - Utilisation de l'énumération fermée `TaskStatus` de Pydantic.
  - Rejet des statuts inconnus avec code **HTTP 422**.
  - Exécution obligatoire de **`make demo-check`**.

### 4. Ce qu'il faut dire à la salle :
> *« Regardez : même prompt, même modèle. Mais cette fois, le simple fichier AGENTS.md a posé le cadre. L'agent ne touche à aucun fichier et exige une étape de cadrage et de planification. L'IA n'est plus un stagiaire imprévisible, elle devient un collaborateur discipliné. »*

---

## 🏗️ Note d'architecture : `AGENTS.md` vs `.agents/rules/`

Profitez de cette étape ou de la Slide 07 pour poser la distinction d'échelle :
- **Petit projet / Démarrage :** Un fichier unique `AGENTS.md` à la racine (4 à 10 lignes). C'est simple, lisible, versionné et universel.
- **Gros projet d'équipe / Multi-stacks :** Quand le dépôt mélange du backend Python, du frontend React et du Terraform, un seul fichier deviendrait indigeste. On utilise alors un répertoire modulaire de règles (`.agents/rules/`, `.cursor/rules/`, `.kilo/rules/`) avec des fichiers ciblés (`api.md`, `db.md`, `git.md`) associés à des motifs de fichiers (`**/*.py`).

---

## 🛟 Solution de secours (si le réseau ou le modèle ralentit)
Ouvrir les deux fichiers préparés dans le dossier `docs/demo-assets/` :
1. [`docs/demo-assets/demo1-secours-sans-rules.md`](demo-assets/demo1-secours-sans-rules.md) (la dérive non cadrée).
2. [`docs/demo-assets/demo1-secours-avec-rules.md`](demo-assets/demo1-secours-avec-rules.md) (la réponse cadrée et rigoureuse).
