from app.models import Task, TaskStatus

TASKS = [
    Task(id=1, title="Lire le brief", status=TaskStatus.DONE),
    Task(id=2, title="Préparer le plan", status=TaskStatus.DOING),
    Task(id=3, title="Répéter la démonstration", status=TaskStatus.TODO),
]


def list_tasks(status: TaskStatus | None = None) -> list[Task]:
    """Return all tasks, or only tasks matching the optional status."""

    if status is None:
        return TASKS.copy()
    return [task for task in TASKS if task.status == status]
