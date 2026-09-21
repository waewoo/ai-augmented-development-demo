# Plan de présentation

## Cadre global

Titre : **Premiers pas vers le développement augmenté par l’IA**

Message d’ouverture : « En une heure, vous ne deviendrez pas développeur IA. Vous repartirez toutefois avec une méthode, des garde-fous et un exemple que vous pourrez reproduire. »

Audience : développeurs et profils techniques qui connaissent peu ou pas le développement assisté par des agents IA. Les notions de rules, skills, contexte, MCP, hooks et sous-agents sont introduites avant d’être utilisées.

Répartition impérative : **42 min de contenu principal + 8 min de formations existantes + 10 min de questions = 60 min**.

## Déroulé minuté

| # | Slide | Contenu clé | Durée | Démo |
|---:|---|---|---:|---|
| 1 | Titre et promesse | Ce que la session permet et ne permet pas | 1 min | — |
| 2 | Pourquoi maintenant ? | De la complétion aux agents ; responsabilité humaine | 2 min | — |
| 3 | Du modèle à l’agent | Observer, planifier, utiliser des outils, vérifier | 3 min | — |
| 4 | Workflow de référence | Comprendre → planifier → approuver → faire → vérifier → revoir | 2 min | — |
| 5 | Contexte : premier facteur de qualité | Code, demande, architecture, conventions, tests, sécurité | 3 min | — |
| 6 | Démonstration 1 | Exploration en lecture seule | 3 min | Oui |
| 7 | Rules | Instructions persistantes, limites et contrôles complémentaires | 2 min | — |
| 8 | Sans rules / avec rules | Comparaison de plans, pas deux implémentations | 2 min | Oui |
| 9 | Skills | Procédures réutilisables ; rule ≠ skill | 2 min | — |
| 10 | Démonstration 2 | `plan-change`, puis approbation humaine | 4 min | Oui |
| 11 | Démonstration 3 | `implement-change`, tests, diff et contrôles | 5 min | Oui |
| 12 | Harnais | Tests, lint, types, build, CI, permissions, hooks | 3 min | — |
| 13 | Démonstration 4 | `review-change` en lecture seule | 3 min | Oui |
| 14 | Frameworks existants | Spec Kit, OpenSpec, BMAD Method, AIDD | 3 min | — |
| 15 | Sécurité et conclusion | Garde-fous, TDD avec prudence, prochaines étapes | 4 min | — |
|  | **Contenu principal** |  | **42 min** |  |
|  | Intervention formations | Présentation des formations existantes | **8 min** |  |
|  | Questions / réponses | Échanges | **10 min** |  |
|  | **Total** |  | **60 min** |  |

## Promesse pédagogique

À la fin, les participants doivent pouvoir :

1. distinguer modèle, agent, rule, skill, outil, MCP, hook et sous-agent ;
2. donner un contexte pertinent et borné ;
3. demander un plan en lecture seule puis l’approuver explicitement ;
4. exiger des tests et des contrôles déterministes ;
5. revenir à un état de secours si la démonstration dévie.

Ils ne sont pas censés devenir experts en une heure.

## Points de vigilance

- Ne pas transformer la séquence en catalogue de produits.
- Kilo Code est l’outil de la démonstration, pas l’unique solution.
- Les rules orientent le comportement mais ne sont pas des barrières techniques.
- Le TDD est présenté comme une piste intéressante : « Le TDD semble fournir une boucle particulièrement lisible pour l’agent. C’est une piste intéressante, mais ce n’est ni obligatoire ni une pratique que je prétends aujourd’hui maîtriser avec l’IA. »
- Les frameworks sont des accélérateurs facultatifs, pas des prérequis.
