<script setup lang="ts">
const steps = [
  {
    label: 'Cadrer',
    role: 'besoin & critères',
    human: true,
  },
  {
    label: 'Comprendre',
    role: 'contexte & lecture seule',
    human: false,
  },
  {
    label: 'Planifier',
    role: 'périmètre proposé',
    human: false,
  },
  {
    label: 'Approuver',
    role: 'signature humaine',
    human: true,
  },
  {
    label: 'Revoir, tester, corriger',
    role: 'diff, tests & corrections',
    human: false,
  },
  {
    label: 'Décider',
    role: 'valider ou relancer',
    human: true,
  },
]
</script>

<template>
  <div class="workflow-container">
    <div class="workflow">
      <div class="workflow__track" />
      <div class="workflow__plan-feedback"><span>↶</span> préciser le plan</div>
      <div class="workflow__decision-feedback"><span>↶</span> corriger</div>
      <div
        v-for="(step, index) in steps"
        :key="step.label"
        class="workflow__step"
        :class="{ 'workflow__step--human': step.human }"
      >
        <span v-if="step.human" class="workflow__badge">Humain</span>
        <span v-else class="workflow__badge workflow__badge--agent">Agent IA</span>
        <div class="workflow__circle">0{{ index + 1 }}</div>
        <strong>{{ step.label }}</strong>
        <span class="workflow__role">{{ step.role }}</span>
      </div>
      <div class="workflow__return-loop" aria-label="Boucle de retour vers le cadrage">
        <svg viewBox="0 0 1040 54" preserveAspectRatio="none" aria-hidden="true">
          <defs>
            <marker id="workflow-return-arrow" markerWidth="8" markerHeight="8" refX="7" refY="4" orient="auto">
              <path d="M0,0 L8,4 L0,8 Z" />
            </marker>
          </defs>
          <path d="M955 0 V26 H85 V0" marker-end="url(#workflow-return-arrow)" />
        </svg>
        <span>si le besoin change : recadrer et relancer</span>
      </div>
    </div>
  </div>
</template>


<style scoped>
.workflow-container {
  display: flex;
  flex-direction: column;
  gap: 12px;
  margin: 14px auto 0;
  max-width: 1040px;
  width: 100%;
}

.workflow {
  display: grid;
  flex: 1;
  gap: 12px;
  grid-template-columns: repeat(6, 1fr);
  grid-template-rows: minmax(0, 1fr) 54px;
  position: relative;
}

.workflow__track {
  background: #e2e8f0;
  height: 3px;
  left: 6%;
  position: absolute;
  right: 6%;
  top: 44px;
  z-index: 0;
}

.workflow__step {
  align-items: center;
  background: var(--surface);
  border: 1.5px solid var(--line);
  border-radius: 14px;
  box-shadow: 0 4px 12px rgba(15, 23, 42, 0.03);
  display: flex;
  flex-direction: column;
  gap: 2px;
  padding: 10px 8px 14px;
  position: relative;
  text-align: center;
  transition: all 0.15s ease;
  z-index: 1;
}

.workflow__plan-feedback {
  align-items: center;
  background: #eff6ff;
  border: 1px solid #bfdbfe;
  border-radius: 999px;
  color: #1e40af;
  display: inline-flex;
  font-size: 9.5px;
  font-weight: 800;
  gap: 4px;
  left: 50%;
  letter-spacing: 0.03em;
  padding: 3px 8px;
  position: absolute;
  text-transform: uppercase;
  top: -18px;
  transform: translateX(-50%);
  z-index: 3;
}

.workflow__plan-feedback span {
  color: var(--teal);
  font-size: 14px;
  line-height: 0.8;
}

.workflow__decision-feedback {
  align-items: center;
  background: #eff6ff;
  border: 1px solid #bfdbfe;
  border-radius: 999px;
  color: #1e40af;
  display: inline-flex;
  font-size: 9.5px;
  font-weight: 800;
  gap: 4px;
  letter-spacing: 0.03em;
  padding: 3px 8px;
  position: absolute;
  right: 13%;
  text-transform: uppercase;
  top: -18px;
  z-index: 3;
}

.workflow__decision-feedback span {
  color: var(--teal);
  font-size: 14px;
  line-height: 0.8;
}

.workflow__step:hover {
  border-color: #a5b4fc;
  box-shadow: 0 8px 20px rgba(30, 64, 175, 0.1);
  transform: translateY(-2px);
}

.workflow__step--human {
  border-color: #bfdbfe;
  box-shadow: 0 6px 18px rgba(30, 64, 175, 0.06);
}

.workflow__badge {
  background: #eff6ff;
  border: 1px solid #bfdbfe;
  border-radius: 999px;
  color: #1e40af;
  font-size: 9.5px;
  font-weight: 800;
  letter-spacing: 0.05em;
  margin-bottom: 6px;
  padding: 1.5px 7px;
  text-transform: uppercase;
}

.workflow__badge--agent {
  background: #f0fdf4;
  border-color: #bbf7d0;
  color: var(--teal);
}

.workflow__circle {
  align-items: center;
  background: #ffffff;
  border: 3px solid var(--teal);
  border-radius: 50%;
  color: var(--teal);
  display: flex;
  font-size: 14px;
  font-weight: 800;
  height: 44px;
  justify-content: center;
  width: 44px;
}

.workflow__step--human .workflow__circle {
  background: #1e40af !important;
  border-color: #1e40af !important;
  box-shadow: 0 0 0 4px rgba(30, 64, 175, 0.15) !important;
  color: #ffffff !important;
}

.workflow__step strong {
  color: var(--ink);
  font-size: 14.5px;
  line-height: 1.15;
  margin-top: 8px;
}

.workflow__role {
  color: var(--muted);
  font-size: 11px;
  line-height: 1.25;
  margin-top: 2px;
}

.workflow__return-loop {
  grid-column: 1 / -1;
  grid-row: 2;
  min-height: 54px;
  position: relative;
}

.workflow__return-loop svg {
  height: 100%;
  inset: 0;
  overflow: visible;
  position: absolute;
  width: 100%;
}

.workflow__return-loop path {
  fill: none;
  stroke: var(--teal);
  stroke-linecap: round;
  stroke-width: 2;
}

.workflow__return-loop marker path {
  fill: var(--teal);
}

.workflow__return-loop > span {
  background: var(--slide-bg);
  color: var(--teal-dark);
  font-size: 10px;
  font-weight: 750;
  left: 50%;
  padding: 2px 9px;
  position: absolute;
  text-transform: uppercase;
  top: 18px;
  transform: translateX(-50%);
  white-space: nowrap;
}
</style>
