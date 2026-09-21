# Fiche Démo 4 — L'Agent Reviewer : séparation des pouvoirs

- **Slide associée :** Slide 13
- **Durée cible :** 4 minutes
- **Objectif :** Démontrer le duel d'agents et la séparation des pouvoirs : un agent a implémenté du code, un second agent (Reviewer) indépendant audite le diff Git sans complaisance pour détecter les régressions ou oublis de conformité.

---

## 📋 Préparation avant de lancer
1. Disposer d'un diff Git dans le dépôt (soit l'implémentation du filtre `status` réalisée en amont, soit basculer sur l'état préparé : `git switch --detach demo/implemented` ou avoir un diff en cours).
2. Avoir le chat de l'agent Reviewer prêt (ou le rapport de secours [`docs/demo-assets/demo4-secours-review.md`](demo-assets/demo4-secours-review.md) sous la main).
3. *(Optionnel mais recommandé)* **Ouvrir une nouvelle conversation avec un LLM différent** de celui qui a implémenté le code — par exemple, changer le modèle dans les paramètres de l'IDE avant de lancer le Reviewer.

   > 💡 **Pourquoi changer de LLM ?** Cela renforce concrètement le message "séparation des pouvoirs" : le Reviewer n'est pas seulement un agent distinct, c'est un modèle distinct. La salle voit que l'impartialité n'est pas qu'une promesse — elle est structurelle. Si votre IDE le permet, montrez le changement de modèle à l'écran avant d'envoyer le prompt.

---

## ⚡ Lancement de la démonstration

### 1. Copier/coller ce prompt dans le chat :
```text
Utilise le skill review-change. Ne modifie aucun fichier. Compare la demande initiale, le plan approuvé, les rules, le diff Git et les résultats des contrôles. Classe tes observations par niveau de sévérité (Bloquant, Important, Suggestion).
```

### 2. Ce qu'on observe à l'écran :
- L'agent active le skill `review-change`.
- Il inspecte le diff Git réel (`git diff`) et les consignes du projet (`AGENTS.md`).
- Il produit un rapport de revue structuré :
  - **Statut global :** Accepté sous conditions / En attente.
  - **Points bloquants :** Vérification du code d'erreur HTTP 422 pour statuts invalides.
  - **Points importants :** Présence des 4 tests de validation et non-régression.
  - **Conformité des règles :** Respect de `make demo-check` (zéro régression de typage mypy).
- L'agent ne valide rien de manière arbitraire : il conclut par une recommandation claire destinée à l'humain.

### 3. Ce qu'il faut dire à la salle :
> *« En entreprise, on ne laisse jamais un développeur valider sa propre Pull Request sans relecture. Avec les agents IA, c'est la même règle ! L'agent qui code a un biais de complaisance : il affirme toujours que son code est parfait. En faisant intervenir un second agent Reviewer armé d'un skill d'audit, on obtient une critique neutre et impartiale. L'humain garde la décision finale. »*

---

## 🛟 Solution de secours (si l'IA est lente)
Ouvrir directement [docs/demo-assets/demo4-secours-diff.md](demo-assets/demo4-secours-diff.md), [docs/demo-assets/demo4-secours-checks.md](demo-assets/demo4-secours-checks.md) et le rapport de revue rédigé [docs/demo-assets/demo4-secours-review.md](demo-assets/demo4-secours-review.md).

