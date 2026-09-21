# Fiche Démo 2 — Dans le ventre d'un Skill : anatomie & déclenchement

- **Slide associée :** Slide 09
- **Durée cible :** 3 minutes
- **Objectif :** Démystifier ce qu'est un skill (un simple fichier Markdown standard) et montrer comment l'agent le déclenche automatiquement par analyse sémantique de l'intention utilisateur.

---

## 📋 Préparation avant de lancer
1. S'assurer que le fichier `AGENTS.md` est bien présent à la racine.
2. Ouvrir l'onglet [.kilo/skills/plan-change/SKILL.md](file:///home/coder/project/.kilo/skills/plan-change/SKILL.md) dans l'éditeur.

---

## 🔍 Geste 1 — Montrer le code source du Skill (30 s)

1. Montrer le fichier à l'écran :
   - Le **frontmatter YAML** : `name: plan-change` et le champ `description:` qui contient les mots-clés sémantiques.
   - La **procédure** : étapes 1, 2, 3 que l'agent doit exécuter.
   - Les **garde-fous** : interdiction formelle de modifier le moindre fichier de code (`Hard boundary`).
2. Ce qu'il faut dire à la salle :
   > *« Un skill n'a rien de magique. Ce n'est ni un plugin compilé ni une boîte noire : c'est un fichier Markdown standard écrit par l'équipe qui documente une procédure opérationnelle. »*

---

## ⚡ Geste 2 — Déclenchement automatique par langage naturel

### 1. Copier/coller ce prompt dans le chat :
```text
Je voudrais préparer le plan pour ajouter un filtre optionnel status sur GET /tasks.
```

*(Remarquez : on ne mentionne PAS le nom du fichier `plan-change` ! L'agent doit le trouver seul).*

### 2. Ce qu'on observe à l'écran :
- L'agent indique qu'il active le skill `plan-change`.
- Il explore le code en lecture seule (`app/main.py`, `app/models.py`, `app/service.py`).
- Il génère un plan structuré :
  - Critères d'acceptation (filtre optionnel, erreur HTTP 422).
  - Fichiers cibles impactés.
  - Tests à ajouter.
  - Risques et commandes de vérification (`make demo-check`).
- **Aucun fichier de code n'est modifié.** L'agent s'arrête et demande l'approbation humaine.

### 3. Ce qu'il faut dire à la salle :
> *« Grâce au champ description du YAML, le modèle a immédiatement compris quel skill activer face à notre demande. Il applique la méthode de l'équipe sans qu'on ait besoin de lui réexpliquer. »*

---

## 🛟 Solution de secours (si l'IA est lente)
Ouvrir directement [.kilo/skills/plan-change/SKILL.md](file:///home/coder/project/.kilo/skills/plan-change/SKILL.md) puis [docs/demo-assets/demo2-secours-plan.md](demo-assets/demo2-secours-plan.md) pour projeter le plan attendu.

