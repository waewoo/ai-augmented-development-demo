# Fiche Démo 1 — Le choc des Rules : Avec vs Sans `AGENTS.md`

- **Slide associée :** Slide 07
- **Durée cible :** 3 minutes
- **Objectif :** Montrer le contraste saisissant sur un même prompt envoyé sans rules (l'agent modifie du code à l'aveugle), puis avec rules (l'agent refuse de coder sans plan et impose les contraintes).

---

## 📋 Préparation avant de lancer
1. Ouvrir votre éditeur / IDE (ex: Kilo Code / Cursor / VS Code).
2. Pour la phase A, masquer temporairement le fichier de règles **avant d'ouvrir une nouvelle conversation** :
   ```bash
   mv AGENTS.md AGENTS.md.bak
   ```
   *(ou si vous utilisez un outil avec toggle de rules, désactivez-le).*

   > ⚠️ **Timing critique :** `AGENTS.md` est chargé dans le contexte système **au démarrage de la session**, pas à chaque message. Le masquer en cours de conversation ne change rien au comportement de l'agent pour cette session. Il faut ouvrir la conversation **après** avoir masqué le fichier. **À répéter à blanc avec l'IDE cible avant le jour J.**

## 🧪 Test réel effectué (répétition générale — 22 sept. 2026)

L'effet d'`AGENTS.md` a été vérifié en conditions réelles sur l'agent d'audit :

| Condition | Comportement observé |
|---|---|
| **Sans `AGENTS.md`** (simulé) | L'agent modifie `app/main.py` directement avec `status: str \| None`, sans type fermé, sans mention de `make demo-check`, sans demander d'approbation. |
| **Avec `AGENTS.md`** (règles actives) | L'agent cite `AGENTS.md`, active le skill `plan-change`, explore le code en lecture seule, s'arrête et attend l'approbation humaine avant toute modification. |

**Conclusion :** le contraste est réel et reproductible — le changement de comportement vient du fichier de règles, pas du modèle ou du prompt.

---

## ⚡ Étape A — Sans rules (L'agent en roue libre)

### 1. Copier/coller ce prompt dans le chat de l'agent :
```text
Ajoute un filtre optionnel status sur GET /tasks.
```

### 2. Ce qu'on observe à l'écran :
- L'agent commence immédiatement à modifier du code dans plusieurs fichiers.
- Il invente des types sans rigueur, oublie la gestion de l'erreur `422` et prétend que « tout fonctionne ».

### 3. Ce qu'il faut dire à la salle :
> *« Regardez : sans consigne projet, l'agent est comme un stagiaire surpuissant mais imprévisible. Il modifie du code sans plan, sans vérifier l'existant, et peut casser la prod. »*

---

## ⚡ Étape B — Avec rules (L'agent discipliné)

### 1. Restaurer `AGENTS.md` :
```bash
mv AGENTS.md.bak AGENTS.md
```

### 2. Copier/coller EXACTEMENT le même prompt dans une nouvelle conversation :
```text
Ajoute un filtre optionnel status sur GET /tasks.
```

### 3. Ce qu'on observe à l'écran :
- L'agent cite `AGENTS.md`.
- Il applique la règle : **lecture seule par défaut**, refuse de modifier du code sans plan préalable.
- Il rappelle la contrainte du projet : rejet strict avec **HTTP 422**.
- Il mentionne la commande de validation obligatoire : `make demo-check`.

### 4. Ce qu'il faut dire à la salle :
> *« Même prompt, même modèle. Mais cette fois, le fichier AGENTS.md a posé le cadre. L'agent ne touche à aucun fichier et exige une étape de cadrage. »*

---

## 🛟 Solution de secours (si l'IA est lente)
Ouvrir les deux fichiers d'exemple préparés dans le dossier `docs/demo-assets/` :
1. [`docs/demo-assets/demo1-secours-sans-rules.md`](demo-assets/demo1-secours-sans-rules.md) (montrer la réponse floue et non cadrée).
2. [`docs/demo-assets/demo1-secours-avec-rules.md`](demo-assets/demo1-secours-avec-rules.md) (montrer la réponse cadrée et rigoureuse).

