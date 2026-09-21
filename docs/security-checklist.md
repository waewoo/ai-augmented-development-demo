# Checklist de sécurité

- [ ] Aucun secret, token, identifiant ou donnée réelle dans le dépôt.
- [ ] Les prompts, rules, logs et captures ont été relus.
- [ ] Le modèle et les outils sont approuvés pour le contexte d’utilisation.
- [ ] Les commandes affichées ont été vérifiées et restent locales.
- [ ] Aucune commande destructive ou ambiguë dans le runbook.
- [ ] Les permissions de l’agent sont limitées au dépôt de démonstration.
- [ ] Aucune connexion à la production ou à un service externe.
- [ ] Le diff final a été inspecté par un humain.
- [ ] La CI est en lecture seule côté contenu (`contents: read`).
- [ ] Les rules sont présentées comme des instructions, pas comme des barrières techniques.
- [ ] Un état de secours local existe en cas de problème réseau ou de génération.
