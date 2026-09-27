from app.main import app
from fastapi.testclient import TestClient

client = TestClient(app)


def test_list_tasks_returns_all_tasks() -> None:
    response = client.get("/tasks")

    assert response.status_code == 200
    assert len(response.json()) == 3


def test_list_tasks_filters_by_status() -> None:
    response = client.get("/tasks?status=todo")

    assert response.status_code == 200
    assert response.json() == [
        {"id": 3, "title": "Répéter la démonstration", "status": "todo"}
    ]


def test_list_tasks_filters_done_tasks() -> None:
    response = client.get("/tasks?status=done")

    assert response.status_code == 200
    assert response.json()[0]["status"] == "done"


def test_list_tasks_rejects_unknown_status() -> None:
    response = client.get("/tasks?status=blocked")

    assert response.status_code == 422
