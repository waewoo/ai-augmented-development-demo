---
theme: default
title: Premiers pas vers le développement augmenté par l’IA
info: Une méthode concrète pour travailler avec des agents de code
highlighter: shiki
transition: fade
mdc: true
---

<div class="cover-shell">
  <div class="cover-orbit"></div>
  <div class="slide-kicker" style="color:#8f93ff">Développement augmenté · initiation</div>
  <h1 style="font-size:58px;max-width:780px;margin-top:30px">Premiers pas vers<br />le développement<br />augmenté par l’IA</h1>
  <p style="color:#c8d0df;font-size:25px;margin-top:30px;max-width:720px">Une méthode concrète pour travailler avec des agents de code</p>
  <div class="cover-flow">
    <span class="cover-node">demande</span><span class="cover-arrow">→</span>
    <span class="cover-node">changement</span><span class="cover-arrow">→</span>
    <span class="cover-node">vérification</span>
  </div>
</div>

<!--
Durée : 1 minute.
Message principal : la session donne une méthode, des garde-fous et un exemple reproductible.
Formulation suggérée : « En une heure, vous ne deviendrez pas expert des agents de code. Vous repartirez avec une méthode que vous pourrez essayer dès demain. »
Action : annoncer que Kilo Code sera visible pendant la démonstration, mais que les principes sont transposables.
Point à ne pas oublier : pas de catalogue de technologies sur la couverture.
Transition : « Commençons par la promesse et ses limites. »
Si la démonstration ralentit : aucune action sur cette slide ; elle reste autonome.
-->

---

<div class="slide-shell" style="--progress:7%">
  <div class="slide-kicker">Promesse</div>
  <h1 class="slide-title">Une heure pour repartir avec une méthode</h1>
  <div style="margin-top:70px;max-width:960px">
    <div v-click class="quote">En une heure, vous ne deviendrez pas expert des agents de code.</div>
    <div v-click class="quote" style="margin-top:42px;border-left-color:var(--teal)">Vous repartirez avec une méthode que vous pourrez essayer dès demain.</div>
  </div>
  <div class="footer"><span>Ce que la session permet — et ne permet pas</span><span>02 · 2 min</span></div>
</div>

<!--
Durée : 2 minutes.
Message principal : donner une promesse réaliste, sans vendre une transformation instantanée.
Formulation suggérée : « Nous allons voir une méthode concrète : contexte, rules, skills, approbation et contrôles. »
Action : faire apparaître les deux phrases successivement avec un clic.
Point à ne pas oublier : la session ne transforme pas les participants en experts.
Transition : « Pour comprendre cette méthode, distinguons modèle, assistant et agent. »
Si la démonstration ralentit : rester sur les deux phrases ; aucune dépendance externe.
-->

---

<div class="slide-shell" style="--progress:14%">
  <div class="slide-kicker">Vocabulaire</div>
  <h1 class="slide-title">Modèle, assistant, agent</h1>
  <div class="three-column" style="margin-top:62px">
    <div v-click class="p-6 bg-white border rounded-xl">
      <div class="small-label">Modèle</div><h2 style="margin-top:18px">Répond</h2><p class="muted" style="margin-top:20px">Produit une réponse à partir des informations reçues.</p>
    </div>
    <div v-click class="p-6 bg-white border rounded-xl" style="border-color:#c9c9fa">
      <div class="small-label">Assistant</div><h2 style="margin-top:18px">Suggère</h2><p class="muted" style="margin-top:20px">Aide dans l’éditeur, le chat ou le terminal.</p>
    </div>
    <div v-click class="p-6 bg-white border rounded-xl" style="border-color:#9bd9d0">
      <div class="small-label">Agent</div><h2 style="margin-top:18px">Agit</h2><p class="muted" style="margin-top:20px">Explore, utilise des outils, modifie et vérifie.</p>
    </div>
  </div>
  <p class="after-demo">Un agent n’est ni autonome au sens absolu, ni infaillible.</p>
  <div class="footer"><span>Outils · MCP · hooks · sous-agents : des capacités à encadrer</span><span>03 · 3 min</span></div>
</div>

<!--
Durée : 3 minutes.
Message principal : la portée augmente de la réponse vers l’action, donc le besoin de contrôle augmente aussi.
Formulation suggérée : « L’agent peut explorer le dépôt, modifier plusieurs fichiers et exécuter les tests. Le développeur doit contrôler son périmètre et vérifier le résultat. »
Action : révéler les trois compositions successivement.
Point à ne pas oublier : MCP expose des outils ou sources de façon standardisée ; un hook déclenche une action avant ou après un événement ; un sous-agent ajoute coordination et coût.
Alternatives : Continue, OpenCode et IBM Bob existent également ; Kilo Code n’est qu’un exemple choisi pour la démonstration.
Transition : « Comment rendre ces actions visibles et contrôlables ? »
Si la démonstration ralentit : lire les trois définitions sans dépendre d’un agent.
-->

---

<div class="slide-shell" style="--progress:21%">
  <div class="slide-kicker">Workflow</div>
  <h1 class="slide-title">Les étapes importantes restent visibles</h1>
  <WorkflowDiagram />
  <p class="quote" style="margin:55px auto 0;max-width:980px">Le plan est un point de contrôle humain, pas une formalité.</p>
  <div class="footer"><span>Comprendre → planifier → approuver → agir → vérifier → revoir</span><span>04 · 2 min</span></div>
</div>

<!--
Durée : 2 minutes.
Message principal : le workflow sépare compréhension, action et preuve.
Formulation suggérée : « Je ne donne pas à l’agent une autorisation implicite de tout modifier. Je rends les étapes observables. »
Action : faire apparaître le diagramme étape par étape.
Point à ne pas oublier : l’approbation peut réduire le périmètre avant le coût de l’implémentation.
Transition : « La première étape — comprendre — dépend du contexte disponible. »
Si la démonstration ralentit : montrer le diagramme statique, qui possède un fallback lisible.
-->

---

<div class="slide-shell" style="--progress:28%">
  <div class="slide-kicker">Contexte</div>
  <h1 class="slide-title">La qualité de la réponse dépend du contexte disponible</h1>
  <ConceptMap />
  <div class="footer"><span>05 · 3 min</span></div>
</div>

<!--
Durée : 3 minutes.
Message principal : le contexte est le premier facteur de qualité.
Formulation suggérée : « Je donne d’abord à l’agent les moyens de comprendre le projet : code, demande, architecture, conventions, tests, commandes et contraintes de sécurité. »
Action : révéler les nœuds de la carte progressivement.
Point à ne pas oublier : l’historique utile peut aider ; charger tout le dépôt n’est pas automatiquement meilleur.
Transition : « Testons cette découverte sans modifier un seul fichier. »
Si la démonstration ralentit : la carte et la phrase de synthèse sont suffisantes.
-->

---

<div class="demo-slide">
  <DemoCue number="1" title="comprendre avant de modifier" :minutes="4" result="architecture, point d’entrée, tests, commandes, rules et skills identifiés" />
</div>

<!--
LIVE DEMO
Durée maximale : 4 minutes.
Résultat attendu : l’agent décrit le dépôt sans modifier de fichier.
Action : basculer vers Kilo Code en mode planification/lecture seule et saisir le prompt d’exploration de docs/demo-prompts.md.
Message principal : « Je donne d’abord à l’agent les moyens de comprendre le projet. »
Retour : revenir vers Slidev après deux ou trois observations utiles, sans lire la réponse ligne par ligne.
Solution de secours : afficher demo-assets/expected-plan.md ou docs/demo-runbook.md.
Transition : « Certaines attentes ne doivent pas être répétées à chaque demande : ce sont les rules. »
-->

---

<div class="slide-shell" style="--progress:42%">
  <div class="slide-kicker">Rules</div>
  <h1 class="slide-title">Les rules rendent les attentes persistantes</h1>
  <RulesComparison />
  <p class="after-demo">Une rule oriente le comportement. Elle ne remplace ni permissions, ni CI, ni tests, ni revue.</p>
  <div class="footer"><span>Ce que le projet exige</span><span>07 · 2 min</span></div>
</div>

<!--
Durée : 2 minutes.
Message principal : une rule fixe ce qui doit être respecté ; elle est lisible et auditable mais appliquée au mieux par le modèle.
Formulation suggérée : « Les rules donnent les contraintes propres au projet. »
Action : faire apparaître l’avant/après ; montrer ensuite kilo.jsonc et .kilo/rules/.
Point à ne pas oublier : ne pas présenter les rules comme une barrière de sécurité.
Transition : « La différence se voit déjà dans un plan, sans faire deux implémentations. »
Si la démonstration ralentit : ouvrir plan-without-rules.md et plan-with-rules.md localement.
-->

---

<div class="slide-shell" style="--progress:49%">
  <div class="slide-kicker">Skills</div>
  <h1 class="slide-title">Une rule dit quoi respecter. Un skill décrit comment agir.</h1>
  <div class="two-column" style="margin-top:62px">
    <div class="p-7 bg-white border rounded-xl"><div class="small-label">Rule</div><div class="quote" style="font-size:28px;margin-top:24px">Ce que le projet exige</div><p class="muted" style="margin-top:28px">Architecture · tests · sécurité · restitution</p></div>
    <div class="p-7 bg-white border rounded-xl" style="border-color:#9bd9d0"><div class="small-label">Skill</div><div class="quote" style="font-size:28px;border-left-color:var(--teal);margin-top:24px">Comment réaliser une tâche</div><p class="muted" style="margin-top:28px">Lire · planifier · implémenter · contrôler · rendre compte</p></div>
  </div>
  <div class="three-column" style="margin-top:34px;text-align:center">
    <div class="mono">plan-change</div><div class="mono">implement-change</div><div class="mono">review-change</div>
  </div>
  <div class="footer"><span>Les skills encapsulent une méthode réutilisable</span><span>08 · 2 min</span></div>
</div>

<!--
Durée : 2 minutes.
Message principal : les skills rendent une procédure répétable et évitent de réécrire un long prompt.
Formulation suggérée : « Le skill rend la méthode répétable. »
Action : pointer les trois skills du dépôt et leur frontmatter name/description.
Point à ne pas oublier : un skill n’est pas une permission ; il décrit une procédure.
Transition : « Demandons maintenant un plan avant de demander du code. »
Si la démonstration ralentit : afficher directement les trois fichiers SKILL.md.
-->

---

<div class="demo-slide">
  <DemoCue number="2" title="obtenir un plan avant d’obtenir du code" :minutes="4" result="critères, fichiers, tests, risques et point d’approbation humaine" />
</div>

<!--
LIVE DEMO
Durée maximale : 4 minutes.
Résultat attendu : un plan en lecture seule pour le filtre optionnel status sur GET /tasks.
Action : basculer vers Kilo Code, utiliser plan-change, puis revenir vers Slidev avec le plan affiché.
Message principal : « Le plan est un point de contrôle humain, pas une formalité. »
Point d’approbation : demander au présentateur de lire le plan et de l’approuver explicitement avant toute écriture.
Solution de secours : afficher demo-assets/expected-plan.md.
Transition : « Le plan est approuvé ; l’agent peut maintenant agir dans un périmètre connu. »
-->

---

<div class="slide-shell" style="--progress:63%">
  <div class="slide-kicker">Implémentation contrôlée</div>
  <h1 class="slide-title">Un petit changement, visible avant et après</h1>
  <CodeEvolution />
  <div class="footer"><span>Le code n’est qu’une étape : tests, diff et décision suivent</span><span>10 · 4 min</span></div>
</div>

<!--
LIVE DEMO
Durée maximale : 4 minutes.
Résultat attendu : le filtre optionnel est implémenté avec tests, sans changement hors périmètre.
Action : basculer vers Kilo Code, saisir le prompt implement-change après approbation, puis revenir vers Slidev pour montrer l’évolution.
Message principal : l’agent propose et exécute ; le développeur reste responsable.
Point à ne pas oublier : conserver le comportement sans filtre et obtenir 422 pour un statut invalide.
Solution de secours : afficher demo-assets/expected-diff.md puis ouvrir le tag demo/implemented.
Transition : « Une modification crédible doit être suivie de contrôles déterministes. »
-->

---

<div class="slide-shell" style="--progress:70%">
  <div class="slide-kicker">Contrôles déterministes</div>
  <h1 class="slide-title">Le résumé de l’agent ne remplace pas les contrôles</h1>
  <div class="code-block" style="margin-top:58px;max-width:760px">
    <div><span class="success">✓</span> pytest</div>
    <div><span class="success">✓</span> ruff check .</div>
    <div><span class="success">✓</span> ruff format --check .</div>
    <div><span class="success">✓</span> mypy app</div>
  </div>
  <div class="two-column" style="margin-top:30px;max-width:900px">
    <div><span class="success">Contrôle réussi</span><p class="muted" style="font-size:18px;margin-top:7px">Une sortie réellement exécutée.</p></div>
    <div><span class="warning">Non exécuté ≠ réussi</span><p class="muted" style="font-size:18px;margin-top:7px">Un manque de preuve reste une limite.</p></div>
  </div>
  <div class="footer"><span>La preuve vient des commandes et du diff</span><span>11 · 4 min</span></div>
</div>

<!--
Durée : 4 minutes.
Message principal : la validation est déterministe et vérifiable.
Formulation suggérée : « J’accepte le résultat parce que les contrôles sont verts, pas parce que l’agent dit “terminé”. »
Action : révéler les commandes puis montrer leur sortie réelle dans le terminal.
Point à ne pas oublier : montrer aussi le diff et les quatre comportements API.
Transition : « L’ensemble de ces règles, outils, tests et permissions forme le harnais. »
Si un test échoue : ne pas masquer l’échec ; afficher expected-checks.md et expliquer ce qui reste ouvert.
Solution de secours : demo-assets/expected-checks.md.
-->

---

<div class="slide-shell" style="--progress:77%">
  <div class="slide-kicker">Harnais</div>
  <h1 class="slide-title">Plus l’agent peut agir, plus le harnais doit être explicite</h1>
  <HarnessDiagram />
  <div class="footer"><span>12 · 3 min</span></div>
</div>

<!--
Durée : 3 minutes.
Message principal : le harnais encadre les capacités, les permissions et les boucles de validation.
Formulation suggérée : « Le harnais est l’ensemble du contexte, des règles, outils, tests, permissions et boucles de validation qui encadrent l’agent. »
Action : faire apparaître les couches successivement, du contexte à la revue humaine.
Point à ne pas oublier : hooks et CI sont des éléments d’automatisation, pas des garanties magiques.
Transition : « Une dernière passe compare le résultat à la demande initiale. »
Si la démonstration ralentit : lire la pile de couches statique.
-->

---

<div class="demo-slide">
  <DemoCue number="4" title="comparer le résultat à la demande" :minutes="3" result="demande, plan, rules, diff et résultats comparés sans modifier de fichier" />
</div>

<!--
LIVE DEMO
Durée maximale : 3 minutes.
Résultat attendu : observations classées par sévérité et conclusion explicite sur les problèmes bloquants.
Action : basculer vers Kilo Code, utiliser review-change en lecture seule, puis revenir vers Slidev.
Message principal : « Je regarde le diff et les contrôles, pas uniquement le résumé de l’agent. »
Point à ne pas oublier : le skill de revue ne modifie aucun fichier.
Solution de secours : utiliser demo-assets/expected-diff.md et demo-assets/expected-checks.md comme revue guidée.
Transition : « Si l’on veut plus de structure, des frameworks existent — sans remplacer le jugement. »
-->

---

<div class="slide-shell" style="--progress:91%">
  <div class="slide-kicker">Frameworks</div>
  <h1 class="slide-title">Un framework formalise un workflow</h1>
  <div class="four-column" style="margin-top:62px">
    <div class="p-5 bg-white border rounded-xl"><div class="small-label">Spec Kit</div><p style="margin-top:18px">spec → plan → tasks → implement / converge</p><p class="muted" style="font-size:17px;margin-top:18px">Pour structurer l’intention.</p></div>
    <div class="p-5 bg-white border rounded-xl"><div class="small-label">OpenSpec</div><p style="margin-top:18px">explore → propose → apply → archive</p><p class="muted" style="font-size:17px;margin-top:18px">Pour aligner avant de construire.</p></div>
    <div class="p-5 bg-white border rounded-xl"><div class="small-label">BMAD Method</div><p style="margin-top:18px">Workflows adaptatifs par rôles</p><p class="muted" style="font-size:17px;margin-top:18px">Pour industrialiser progressivement.</p></div>
    <div class="p-5 bg-white border rounded-xl"><div class="small-label">AIDD</div><p style="margin-top:18px">Cycle logiciel plus large</p><p class="muted" style="font-size:17px;margin-top:18px">Skills, agents, règles et revue.</p></div>
  </div>
  <p class="quote" style="margin:54px auto 0;max-width:1040px;font-size:25px">Aucun framework ne remplace le contexte, le jugement ou les contrôles.</p>
  <div class="footer"><span>Accélérateur facultatif, pas prérequis</span><span>14 · 3 min</span></div>
</div>

<!--
Durée : 3 minutes.
Message principal : les frameworks sont des accélérateurs facultatifs, pas un passage obligatoire.
Formulation suggérée : « On peut commencer avec quelques rules et skills simples avant d’adopter un framework complet. »
Action : présenter chaque framework par sa logique principale et son niveau d’abstraction, sans matrice complexe.
Point à ne pas oublier : mentionner Spec Kit, OpenSpec, BMAD Method et AIDD sans comparaison partisane.
Transition : « Ce qui reste constant, quel que soit l’outil, ce sont les cinq gestes suivants. »
Si la démonstration ralentit : cette slide ne dépend d’aucun service en ligne.
-->

---

<div class="slide-shell" style="--progress:100%">
  <div class="slide-kicker">Synthèse</div>
  <h1 class="slide-title">Commencer petit. Renforcer progressivement le harnais.</h1>
  <div class="five-steps" style="display:grid;grid-template-columns:repeat(5,1fr);gap:16px;margin-top:62px">
    <div v-click class="p-4 bg-white border rounded-xl"><strong>01</strong><p style="margin-top:18px">Donner du contexte</p></div>
    <div v-click class="p-4 bg-white border rounded-xl"><strong>02</strong><p style="margin-top:18px">Écrire les rules</p></div>
    <div v-click class="p-4 bg-white border rounded-xl"><strong>03</strong><p style="margin-top:18px">Utiliser des skills</p></div>
    <div v-click class="p-4 bg-white border rounded-xl"><strong>04</strong><p style="margin-top:18px">Approuver le plan</p></div>
    <div v-click class="p-4 bg-white border rounded-xl"><strong>05</strong><p style="margin-top:18px">Vérifier le résultat</p></div>
  </div>
  <p class="quote" style="margin:34px auto 0;max-width:1000px;font-size:24px;border-left-color:var(--teal)">L’agent propose et exécute ; le développeur reste responsable.</p>
  <p class="muted" style="margin-top:18px;font-size:17px">8 min formations existantes · 10 min questions · TDD : piste intéressante, pas obligation</p>
  <div class="footer"><span>15 · 4 min</span></div>
</div>

<!--
Durée : 4 minutes.
Message principal : cinq gestes simples et une responsabilité humaine constante.
Formulation suggérée : « Le TDD semble fournir une boucle particulièrement lisible pour l’agent. C’est une piste intéressante, mais ce n’est ni obligatoire ni une pratique que je prétends aujourd’hui maîtriser avec l’IA. »
Action : révéler les cinq gestes progressivement, puis passer la parole.
Point à ne pas oublier : ne jamais placer de secret dans prompts, rules, logs ou fichiers ; limiter les permissions ; travailler sur branche ou worktree ; examiner le diff ; ne pas donner accès à la production.
Transition : passer 8 minutes à l’intervenant formation, puis réserver 10 minutes aux questions.
Si la démonstration échoue : rappeler que le dépôt contient plan, diff, contrôles et tags de secours.
-->
