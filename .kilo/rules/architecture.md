# Architecture

- Keep this demonstration intentionally small and easy to explain.
- Keep the HTTP layer in `app/main.py`, data models in `app/models.py`, and task selection in `app/service.py`.
- Prefer a clear separation between API concerns and the small domain/service function.
- Do not add a dependency without a specific justification in the change summary.
- Preserve the in-memory data source; persistence is outside the scope of the demo.
