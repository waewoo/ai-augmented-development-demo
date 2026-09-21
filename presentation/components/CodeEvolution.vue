<script setup lang="ts">
const before = `@app.get("/tasks")\ndef list_tasks():\n    return tasks`
const after = `@app.get("/tasks")\ndef list_tasks(status: TaskStatus | None = None):\n    if status is None:\n        return tasks\n    return [task for task in tasks\n            if task.status == status]`
</script>

<template>
  <div class="code-evolution">
    <div><div class="small-label">Avant</div><pre class="code-block">{{ before }}</pre></div>
    <div class="code-evolution__arrow" v-click>→</div>
    <div v-click><div class="small-label">Après</div><pre class="code-block">{{ after }}</pre></div>
  </div>
</template>

<style scoped>
.code-evolution { align-items: center; display: grid; gap: 24px; grid-template-columns: 1fr 58px 1.25fr; margin-top: 34px; }
.code-evolution .small-label { margin-bottom: 11px; }
.code-evolution .code-block { font-size: 15px; line-height: 1.25; padding: 16px 18px; white-space: pre-wrap; word-break: break-word; }
.code-evolution__arrow { color: var(--teal); font-size: 36px; text-align: center; }
</style>
