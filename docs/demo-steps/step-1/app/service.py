from app.models import Task, TaskStatus

TASKS = [
    Task(id=1, title="Lire le brief", status=TaskStatus.DONE),
    Task(id=2, title="Préparer le plan", status=TaskStatus.DOING),
    Task(id=3, title="Répéter la démonstration", status=TaskStatus.TODO),
]


def list_tasks() -> list[Task]:
    """Return the current in-memory task list."""

    return TASKS.copy()
