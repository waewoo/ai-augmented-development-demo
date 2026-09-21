# Fichiers de Secours pour les Démonstrations (`docs/demo-assets/`)

Ce dossier contient les fichiers de secours (fallback) à afficher en direct si le réseau, l'éditeur ou le modèle IA rencontre un ralentissement ou une défaillance pendant la présentation.

Chaque fichier correspond directement à l'une des 4 démonstrations :

---

### 🛡️ Démo 1 — Le choc des Rules (`AGENTS.md`)
- **[`demo1-secours-sans-rules.md`](demo1-secours-sans-rules.md)** : Exemple de réponse floue d'un agent codant à l'aveugle sans consignes projet (dispersion, absence de validation 422).
- **[`demo1-secours-avec-rules.md`](demo1-secours-avec-rules.md)** : Réponse cadrée obtenue avec `AGENTS.md` (refus de coder sans plan approuvé, rappel du rejet 422).

---

### 🛡️ Démo 2 — Dans le ventre d'un Skill (`plan-change`)
- **[`demo2-secours-plan.md`](demo2-secours-plan.md)** : Plan d'action complet et structuré généré par le skill `plan-change` (critères, fichiers cibles, tests de non-régression, risques).

---

### 🛡️ Démo 3 — Skill + MCP Confluence (`document-architecture`)
- **[`demo3-secours-architecture.md`](demo3-secours-architecture.md)** : Documentation d'architecture complète avec schéma Mermaid interactif, matrice des routes HTTP (200/422) et modèles Pydantic.

---

### 🛡️ Démo 4 — L'Agent Reviewer (`review-change`)
- **[`demo4-secours-diff.md`](demo4-secours-diff.md)** : Diff Git minimal et propre de l'implémentation.
- **[`demo4-secours-checks.md`](demo4-secours-checks.md)** : Preuve d'exécution de `make demo-check` (tests pytest, ruff, mypy 100 % verts).
- **[`demo4-secours-review.md`](demo4-secours-review.md)** : Rapport d'audit impartial généré par le second agent Reviewer avec classification par sévérité.
