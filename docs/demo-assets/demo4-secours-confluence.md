# Simulation de réponse MCP Confluence · Secours Démo 4

Ce fichier sert de preuve ou de repli si le réseau ou les identifiants Confluence réels ne sont pas accessibles le jour J.

---

## 1. Appel d'outil MCP émis par l'agent
```json
{
  "tool": "confluence_update_page",
  "server": "mcp-server-confluence",
  "parameters": {
    "space": "TECH-ARCHITECTURE",
    "title": "API FastAPI Tasks — Architecture & Endpoints",
    "content_format": "storage_format",
    "body_source": "docs/ARCHITECTURE.md",
    "version_comment": "Mise à jour automatique suite à l'ajout du filtre query status (FastAPI v1.2)"
  }
}
```

---

## 2. Réponse du serveur MCP Confluence
```json
{
  "status": "success",
  "page_id": "184920481",
  "url": "https://confluence.entreprise.internal/pages/viewpage.action?pageId=184920481",
  "title": "API FastAPI Tasks — Architecture & Endpoints",
  "version": 4,
  "updated_at": "2026-09-27T17:20:00Z",
  "message": "Page mise à jour avec succès : diagramme Mermaid interactif et matrice des 3 endpoints synchronisés."
}
```

---

## 3. Rendu visuel dans Confluence
- **Titre de page :** `API FastAPI Tasks — Architecture & Endpoints (v1.2)`
- **Macro Mermaid :** Rendu vectoriel du flux `Client -> FastAPI -> Pydantic -> Service -> TASKS`
- **Tableau des routes :**
  - `GET /tasks` -> 200 OK (Toutes les tâches)
  - `GET /tasks?status=done` -> 200 OK (Tâches filtrées)
  - `GET /tasks?status=invalide` -> 422 Unprocessable Entity (Rejet automatique Pydantic)
- **Chaîne de vérification :** `make demo-check` (pytest, ruff, mypy)
