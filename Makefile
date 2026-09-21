.PHONY: check test lint format-check types

check: test lint format-check types

test:
	pytest

lint:
	ruff check .

format-check:
	ruff format --check .

types:
	mypy app
