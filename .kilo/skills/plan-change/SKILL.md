---
name: plan-change
description: Explore a small repository change, read applicable project rules, reformulate acceptance criteria, identify files and tests, surface risks, and produce a read-only implementation plan before human approval.
---

# Plan a change

Use this skill when a request should be understood and planned before any file is changed.

## Procedure

1. Explore the repository structure and identify the relevant entry points.
2. Read the applicable rules in `.kilo/rules/` before proposing a solution.
3. Read the existing implementation and tests that constrain the request.
4. Reformulate the request as observable acceptance criteria, including unchanged behavior.
5. Identify the smallest set of files likely to change.
6. Propose tests for success, edge cases, and validation errors where relevant.
7. List risks, assumptions, and information that is still missing.
8. Present the plan in a numbered sequence and stop.

## Hard boundary

Do not create, edit, delete, or format files. Do not run commands that modify the repository. Wait for explicit human approval before implementation.

## Expected output

Use these headings: `Understanding`, `Acceptance criteria`, `Files`, `Tests`, `Risks`, `Plan`, and `Approval needed`.
