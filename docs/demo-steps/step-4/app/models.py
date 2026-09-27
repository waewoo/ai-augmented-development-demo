from enum import Enum

from pydantic import BaseModel


class TaskStatus(str, Enum):
    """Statuses intentionally kept small so validation is visible in the demo."""

    TODO = "todo"
    DOING = "doing"
    DONE = "done"


class Task(BaseModel):
    id: int
    title: str
    status: TaskStatus
