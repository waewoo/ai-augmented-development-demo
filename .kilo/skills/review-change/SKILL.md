---
name: review-change
description: Perform a read-only review by comparing the request, approved plan, project rules, final diff, and actual validation results; classify findings by severity and state clearly whether a blocking problem remains.
---

# Review a change

Use this skill after implementation and deterministic checks have produced a diff.

## Procedure

1. Read the initial request and the approved plan.
2. Read the rules that apply to the changed files.
3. Inspect the complete diff, not only the agent summary.
4. Verify the reported test and lint results against the available evidence.
5. Check every acceptance criterion, including preserved behavior and invalid input handling.
6. Classify observations as `Blocker`, `Important`, `Minor`, or `None`.
7. Call out missing tests, unverified assumptions, security concerns, and scope drift.

## Hard boundary

Do not modify any file. Do not fix findings during this review. If no blocking problem exists, say so explicitly and distinguish that statement from a claim of perfection.

## Expected output

Use these headings: `Scope reviewed`, `Findings`, `Acceptance criteria`, `Evidence`, `Risks`, and `Conclusion`.
