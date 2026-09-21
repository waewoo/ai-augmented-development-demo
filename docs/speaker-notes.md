# Notes orateur

Ces notes reprennent les transitions, le message à faire passer et le minutage cible. Les durées totalisent 42 minutes pour le contenu principal ; l’intervention formation et les questions disposent ensuite de 8 et 10 minutes.

## 1 — Titre et promesse (1 min)

Dire : « En une heure, vous ne deviendrez pas développeur IA. Vous repartirez toutefois avec une méthode, des garde-fous et un exemple que vous pourrez reproduire. »

Annoncer le fil : contexte, rules, skills, workflow, frameworks, contrôles. Préciser que Kilo Code sera l’outil visible parce que le présentateur le maîtrise, mais que les principes sont transposables. Ne pas promettre de gain chiffré.

Transition : « Pour comprendre pourquoi cette méthode existe, regardons ce qui a changé. »

## 2 — Pourquoi maintenant ? (2 min)

La complétion aide sur une ligne ou une fonction. Un agent peut explorer un dépôt, proposer un plan, appeler des outils, modifier plusieurs fichiers et lancer des contrôles. Cela augmente la portée des erreurs aussi. Le développeur reste responsable du périmètre, des décisions et du résultat.

Transition : « La différence ne tient donc pas seulement au modèle. Elle tient à l’environnement de travail. »

## 3 — Du modèle à l’agent (3 min)

Comparer simplement : un modèle répond avec les informations reçues ; un agent observe un projet, choisit des étapes, utilise lecture/écriture/terminal/Git/tests, puis revient avec des éléments vérifiables. Dire explicitement qu’un agent n’est ni autonome au sens absolu ni infaillible.

Vocabulaire à poser : outils, MCP comme protocole standardisé pour exposer des outils ou sources, hooks comme actions avant/après événement, sous-agents comme délégation spécialisée avec coût et coordination.

Transition : « Pour garder cette capacité sous contrôle, on rend les étapes visibles. »

## 4 — Workflow de référence (2 min)

Parcourir : comprendre → planifier → faire approuver → implémenter → vérifier → revoir le diff. Insister sur le point d’approbation : ce n’est pas une formalité, c’est le moment où l’humain peut réduire le périmètre ou corriger une mauvaise interprétation.

Transition : « La première étape, comprendre, dépend de ce que l’agent peut réellement voir. »

## 5 — Contexte : premier facteur de qualité (3 min)

Le contexte utile rassemble code, documentation, demande, critères d’acceptation, architecture, conventions, historique pertinent, commandes de validation et contraintes de sécurité. Il ne s’agit pas de tout charger sans discernement : trop d’informations peut noyer le signal.

Phrase : « Je donne d’abord à l’agent les moyens de comprendre le projet. »

Transition : « Voyons cette découverte sur le dépôt, sans toucher à un fichier. »

## 6 — Démonstration 1 : découverte du dépôt (3 min)

Ouvrir le projet avec Kilo Code, rester en mode de planification/lecture seule et saisir le prompt d’exploration. Montrer la structure, `app/main.py`, `tests/test_tasks.py`, `make check`, `kilo.jsonc`, rules et skills. Ne pas lire la réponse ligne par ligne : relever deux ou trois observations.

Commenter : l’agent doit comprendre le terrain avant de produire du code. Si le réseau ou l’interface ralentit, afficher `demo-assets/expected-plan.md` ou `docs/demo-runbook.md`.

Transition : « Certaines attentes ne doivent pas être répétées à chaque demande : ce sont les rules. »

## 7 — Rules (2 min)

Une rule est une instruction persistante propre au projet ou à l’équipe : architecture, conventions, tests, sécurité, restitution. Elle dit principalement ce qui doit être respecté. Elle est lisible et auditable, mais appliquée au mieux par le modèle : permissions, CI, tests et revue restent nécessaires.

Montrer `kilo.jsonc` et les quatre fichiers de `.kilo/rules/`.

Transition : « Mesurons l’effet pédagogique d’une règle sans refaire toute la fonctionnalité. »

## 8 — Sans rules / avec rules (2 min)

Afficher côte à côte `demo-assets/plan-without-rules.md` et `demo-assets/plan-with-rules.md`. Le premier est générique et oublie des contraintes ; le second cible les fichiers, les tests et `make check`. Dire que la comparaison porte sur les plans, pas sur deux implémentations complètes.

Conclusion : les rules réduisent l’ambiguïté et rendent le comportement plus reproductible.

Transition : « Une rule dit surtout quoi respecter ; un skill décrit comment exécuter une tâche. »

## 9 — Skills (2 min)

Un skill est une procédure réutilisable : quoi lire, quelles étapes suivre, quels contrôles exécuter et quelle forme donner au résultat. Montrer le frontmatter `name`/`description`, puis le chemin `.kilo/skills/`. Les skills évitent de réécrire un long prompt de planification ou de revue.

Transition : « Utilisons `plan-change` sur une demande volontairement petite. »

## 10 — Démonstration 2 : planifier (4 min)

Saisir le prompt exact. Laisser l’agent lire le code, les tests et les rules. Attendre un plan avec critères, fichiers, tests et risques. Arrêter avant toute modification. Demander aux participants : « Qu’est-ce qui vous ferait approuver ou refuser ce plan ? »

Marquer explicitement : « Le plan est un point de contrôle humain, pas une formalité. » Puis approuver seulement le plan attendu, pas toute évolution future.

Solution de secours : afficher `demo-assets/expected-plan.md`.

Transition : « Le plan est approuvé ; l’agent peut maintenant agir dans un périmètre connu. »

## 11 — Démonstration 3 : implémenter et vérifier (5 min)

Saisir le prompt d’implémentation. Faire constater les fichiers touchés : modèle, service, route et tests selon le plan. Exécuter `make check`, puis montrer le diff. Vérifier les trois comportements : absence de filtre, filtre valide, valeur invalide 422.

Phrase : « Les tests et outils déterministes vérifient le résultat. » Puis : « Je regarde le diff et les contrôles, pas uniquement le résumé de l’agent. »

Solution de secours : afficher `demo-assets/expected-diff.md` et `demo-assets/expected-checks.md`, ou ouvrir le tag `demo/implemented` dans un worktree propre.

Transition : « Ce qui vient de protéger cette petite modification forme le harnais. »

## 12 — Le harnais (3 min)

Définir : « Le harnais est l’ensemble du contexte, des règles, outils, tests, permissions et boucles de validation qui encadrent l’agent. » Montrer la chaîne tests unitaires → intégration/API → lint → types → build/CI → revue du diff. Mentionner les hooks comme automatisations avant/après, sans les présenter comme magiques.

Message : « Plus l’agent peut agir, plus le harnais doit être explicite. »

Transition : « Il reste une question : le changement respecte-t-il réellement la demande ? »

## 13 — Démonstration 4 : revue (3 min)

Utiliser `review-change` en lecture seule. Lui faire comparer demande, plan, rules, diff et résultats. Relever une observation de conformité et demander une conclusion explicite sur les blockers. Rappeler qu’une revue n’autorise pas l’agent à corriger lui-même.

Solution de secours : utiliser `demo-assets/expected-checks.md` et le diff du tag.

Transition : « Si l’on veut plus de structure, des frameworks existent, mais ils ne sont pas obligatoires. »

## 14 — Frameworks existants (3 min)

Présenter comme des niveaux d’industrialisation : Spec Kit (spec → plan → tasks → implement/converge), OpenSpec (explore → propose → apply → archive), BMAD Method (méthode agile adaptative avec rôles/workflows) et AIDD (framework open source couvrant plus largement le cycle logiciel). Ne pas comparer de façon partisane ni évoquer une incompatibilité avec Kilo Code.

Dire : on peut commencer par quelques rules et skills simples, puis adopter un framework si le besoin de répétabilité et de gouvernance le justifie.

Transition : « Le dernier niveau n’est pas un outil : ce sont nos limites et notre responsabilité. »

## 15 — Sécurité et conclusion (4 min)

Rappeler : jamais de secrets dans prompts, rules, logs ou fichiers ; vérifier les commandes ; limiter les permissions ; travailler sur branche/worktree ; regarder le diff ; ne pas ouvrir production ou données sensibles ; ne pas confondre rules et barrières techniques.

Évoquer le TDD avec prudence : « Le TDD semble fournir une boucle particulièrement lisible pour l’agent. C’est une piste intéressante, mais ce n’est ni obligatoire ni une pratique que je prétends aujourd’hui maîtriser avec l’IA. »

Conclure en cinq gestes : donner du contexte, formaliser les rules, encapsuler les pratiques avec des skills, faire approuver le plan, vérifier avec un harnais déterministe. Passer ensuite la parole pour 8 minutes de formations, puis garder 10 minutes de questions.
