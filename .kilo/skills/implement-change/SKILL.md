---
name: implement-change
description: Implement an explicitly approved repository plan with the smallest safe change, add or update tests, run deterministic project checks, and report evidence without claiming unexecuted checks.
---

# Implement an approved change

Use this skill only after a human has approved a concrete plan.

## Procedure

1. Restate the approved plan and confirm the acceptance criteria.
2. Read the applicable project rules before editing.
3. Make the smallest coherent implementation that satisfies the plan.
4. Add or update focused tests while preserving existing behavior.
5. Run `make check`, or run each command it contains if the Make target is unavailable.
6. Inspect the final diff for unrelated changes, secrets, and missing tests.
7. Report files changed, commands actually run, results, risks, and any skipped check.

## Hard boundaries

- Do not expand scope without asking for approval.
- Do not claim a check passed unless it was executed and its output supports that claim.
- Do not hide a failing check behind a summary.
- Do not use destructive commands or external services for this local demo.
