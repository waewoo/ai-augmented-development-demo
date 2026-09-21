from app.main import app
from fastapi.testclient import TestClient

client = TestClient(app)


def test_list_tasks_returns_all_tasks() -> None:
    response = client.get("/tasks")

    assert response.status_code == 200
    assert len(response.json()) == 3
