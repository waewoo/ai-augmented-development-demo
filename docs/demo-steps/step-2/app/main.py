from fastapi import FastAPI

from app.models import Task
from app.service import list_tasks

app = FastAPI(
    title="AI-Augmented Development Demo",
    description="A deliberately small API for a controlled agent demonstration.",
    version="0.1.0",
)


@app.get("/tasks", response_model=list[Task])
def get_tasks() -> list[Task]:
    return list_tasks()
