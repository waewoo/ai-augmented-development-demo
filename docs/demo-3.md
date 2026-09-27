# Fiche Démo 3 — De l'approbation au code : implémentation chirurgicale

- **Slide associée :** Slide 12
- **Durée cible :** 4 minutes
- **Objectif :** Démontrer le passage du plan approuvé à l'écriture minimale de code avec le skill `implement-change`. L'agent modifie uniquement les fichiers prévus au plan (`app/service.py`, `app/main.py`), respecte `TaskStatus` et préserve les tests existants.

---

## 📋 Préparation avant de lancer
1. S'assurer que le plan de la Démo 2 a bien été généré et affiché à l'écran.
2. Garder la conversation ouverte (ou en ouvrir une nouvelle en rappelant le plan approuvé).
3. Avoir le fichier de secours [`docs/demo-assets/demo4-secours-diff.md`](demo-assets/demo4-secours-diff.md) sous la main.

---

## ⚡ Déroulement de la démonstration

### 1. Copier/coller ce prompt dans le chat :
```text
J'approuve le plan. Utilise le skill implement-change pour implémenter le filtre status sur GET /tasks. Respecte TaskStatus, garantis le rejet 422 pour les statuts invalides et préserve le comportement sans filtre.
```

### 2. Ce qu'on observe à l'écran :
1. **Écriture chirurgicale :**
   - L'agent active le skill `implement-change`.
   - Il applique une modification minimale sur `app/service.py` et `app/main.py`.
   - Zéro dépendance externe ajoutée.
2. **Preuve machine immédiate (Terminal) :**
   - Lancer dans le terminal local :
     ```bash
     make demo-check
     ```
   - On observe les 4 tests `pytest` verts, `ruff` sans erreur et `mypy` strict validé.
   - Message vert de conclusion : `✅ Tous les contrôles déterministes sont validés à 100% !`
3. **Inspection du diff Git :**
   - Un `git diff` rapide montre 5 lignes modifiées au total.

### 3. Ce qu'il faut dire à la salle :
> *« L'agent a produit son code en quelques secondes, dans un périmètre chirurgical dicté par le plan. Et comme on l'a vu sur la slide précédente : on ne le croit pas sur parole, on a immédiatement lancé make demo-check. C'est vert à 100 %. Maintenant que notre code local est solide, comment connecte-t-on l'agent à nos outils d'entreprise ? »*

---

## 🛟 Solution de secours (si l'IA est lente)
Ouvrir directement [`docs/demo-assets/demo4-secours-diff.md`](demo-assets/demo4-secours-diff.md) et [`docs/demo-assets/demo4-secours-checks.md`](demo-assets/demo4-secours-checks.md).
