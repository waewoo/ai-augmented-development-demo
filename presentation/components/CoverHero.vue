<script setup lang="ts">
// Interactive/visual hero for cover slide: cute AI companion robot with safety badges
</script>

<template>
  <div class="cover-hero-container">
    <!-- Main visual card with Robot and orbiting keywords -->
    <div class="robot-stage">
      <!-- Floating keyword badges (harmoniously distributed in 4 tiers around the robot) -->
      <!-- Tier 1: Cadrage (Top) -->
      <div class="floating-badge badge--context">
        <span class="badge-icon">📂</span>
        <span class="badge-text">Contexte</span>
      </div>

      <div class="floating-badge badge--rules">
        <span class="badge-icon">📜</span>
        <span class="badge-text">AGENTS.md</span>
      </div>

      <!-- Tier 2: Garde-fous & Connexions (Upper sides) -->
      <div class="floating-badge badge--hooks">
        <span class="badge-icon">↪</span>
        <span class="badge-text">Hooks</span>
      </div>

      <div class="floating-badge badge--mcp">
        <span class="badge-icon">🔌</span>
        <span class="badge-text">MCP</span>
      </div>

      <!-- Tier 3: Méthode & Processus (Lower sides) -->
      <div class="floating-badge badge--skills">
        <span class="badge-icon">⚡</span>
        <span class="badge-text">Skills</span>
      </div>

      <div class="floating-badge badge--workflow">
        <span class="badge-icon">↻</span>
        <span class="badge-text">Workflow</span>
      </div>

      <!-- Tier 4: Validation & Déterminisme (Bottom) -->
      <div class="floating-badge badge--checks">
        <span class="badge-icon">✓</span>
        <span class="badge-text">Tests</span>
      </div>

      <div class="floating-badge badge--deterministic">
        <span class="badge-icon">◆</span>
        <span class="badge-text">Déterministe</span>
      </div>

      <!-- Cute Friendly AI Robot SVG -->
      <div class="robot-graphic">
        <svg viewBox="0 0 220 220" width="200" height="200" fill="none" xmlns="http://www.w3.org/2000/svg">
          <!-- Soft glow behind robot -->
          <circle cx="110" cy="115" r="88" fill="#e6f7ef" opacity="0.8" />
          <circle cx="110" cy="115" r="68" fill="#d1fae5" opacity="0.6" />

          <!-- Antenna -->
          <line x1="110" y1="42" x2="110" y2="20" stroke="#64748b" stroke-width="4" stroke-linecap="round" />
          <circle cx="110" cy="16" r="8" fill="#00875a" />
          <circle cx="110" cy="16" r="4" fill="#6ee7b7" />
          <!-- Antenna signal rings -->
          <path d="M100 10 C104 4, 116 4, 120 10" stroke="#00875a" stroke-width="2" stroke-linecap="round" opacity="0.7" />
          <path d="M95 6 C102 -2, 118 -2, 125 6" stroke="#00875a" stroke-width="2" stroke-linecap="round" opacity="0.4" />

          <!-- Robot Ears/Headphones -->
          <rect x="36" y="66" width="10" height="26" rx="5" fill="#00875a" />
          <rect x="174" y="66" width="10" height="26" rx="5" fill="#00875a" />

          <!-- Robot Head -->
          <rect x="42" y="42" width="136" height="74" rx="22" fill="#ffffff" stroke="#cbd5e1" stroke-width="3" />

          <!-- Screen / Visor -->
          <rect x="52" y="52" width="116" height="54" rx="14" fill="#0f172a" />

          <!-- Smiling Digital Eyes (arc shapes) -->
          <!-- Left Eye: happy crescent -->
          <path d="M72 78 C72 69, 88 69, 88 78" stroke="#34d399" stroke-width="4.5" stroke-linecap="round" fill="none" />
          <!-- Right Eye: happy crescent -->
          <path d="M132 78 C132 69, 148 69, 148 78" stroke="#34d399" stroke-width="4.5" stroke-linecap="round" fill="none" />

          <!-- Cheeks blush -->
          <ellipse cx="68" cy="90" rx="6" ry="3.5" fill="#f43f5e" opacity="0.4" />
          <ellipse cx="152" cy="90" rx="6" ry="3.5" fill="#f43f5e" opacity="0.4" />

          <!-- Little smiling digital mouth -->
          <path d="M104 88 Q110 93 116 88" stroke="#6ee7b7" stroke-width="2.5" stroke-linecap="round" fill="none" />

          <!-- Neck -->
          <rect x="96" y="116" width="28" height="12" rx="3" fill="#94a3b8" />

          <!-- Robot Body -->
          <rect x="54" y="128" width="112" height="76" rx="20" fill="#ffffff" stroke="#cbd5e1" stroke-width="3" />

          <!-- Chest Visor / Shield Screen -->
          <rect x="72" y="139" width="76" height="38" rx="10" fill="#0f172a" />

          <!-- Shield & Checkmark in Chest -->
          <path d="M110 145 L124 149 C124 160, 110 167, 110 167 C110 167, 96 160, 96 149 Z" fill="#00875a" opacity="0.9" />
          <path d="M104 156 L108 160 L116 152" stroke="#ffffff" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" />

          <!-- Status dots below chest screen -->
          <circle cx="94" cy="191" r="3.5" fill="#3b82f6" />
          <circle cx="110" cy="191" r="3.5" fill="#00875a" />
          <circle cx="126" cy="191" r="3.5" fill="#f59e0b" />

          <!-- Arms -->
          <!-- Left Arm holding coffee -->
          <path d="M54 144 C34 148, 30 170, 46 178" stroke="#cbd5e1" stroke-width="7" stroke-linecap="round" fill="none" />
          <!-- Coffee Mug -->
          <rect x="36" y="168" width="16" height="18" rx="3" fill="#1e40af" />
          <path d="M36 172 C30 172, 30 180, 36 180" stroke="#1e40af" stroke-width="2" fill="none" />
          <!-- Coffee steam -->
          <path d="M41 164 Q43 160 41 156" stroke="#94a3b8" stroke-width="1.5" stroke-linecap="round" fill="none" />
          <path d="M46 164 Q48 160 46 156" stroke="#94a3b8" stroke-width="1.5" stroke-linecap="round" fill="none" />

          <!-- Right Arm waving -->
          <path d="M166 144 C184 140, 194 125, 186 112" stroke="#cbd5e1" stroke-width="7" stroke-linecap="round" fill="none" />
          <circle cx="186" cy="108" r="7" fill="#00875a" />
        </svg>
      </div>
    </div>
  </div>
</template>

<style scoped>
.cover-hero-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  position: relative;
  width: 100%;
  max-width: 390px;
}

/* Robot Stage */
.robot-stage {
  background: #ffffff;
  border: 1.5px solid #e2e8f0;
  border-radius: 22px;
  box-shadow: 0 12px 32px rgba(15, 23, 42, 0.08);
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: 22px 16px 18px;
  position: relative;
  width: 100%;
  min-height: 268px;
}

.robot-graphic {
  display: flex;
  justify-content: center;
  align-items: center;
}

.robot-graphic svg {
  height: 180px;
  width: 180px;
}

/* Orbiting badges */
.floating-badge {
  position: absolute;
  display: flex;
  align-items: center;
  gap: 5px;
  background: #ffffff;
  border: 1px solid #cbd5e1;
  border-radius: 999px;
  box-shadow: 0 3px 10px rgba(15, 23, 42, 0.06);
  padding: 4px 10px;
  font-size: 11px;
  font-weight: 700;
  color: #1e293b;
  white-space: nowrap;
  z-index: 2;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.floating-badge:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 16px rgba(15, 23, 42, 0.1);
}

.floating-badge .badge-icon {
  font-size: 12px;
}

/* Tier 1: Cadrage (Top) */
.badge--context {
  top: 14px;
  left: 18px;
  background: #f8fafc;
  border-color: #cbd5e1;
  color: #334155;
}

.badge--rules {
  top: 14px;
  right: 18px;
  background: #f8fafc;
  border-color: #93c5fd;
  color: #1e40af;
}

/* Tier 2: Garde-fous & Connexions (Upper sides) */
.badge--hooks {
  top: 80px;
  left: 12px;
  background: #f5f3ff;
  border-color: #ddd6fe;
  color: #6d28d9;
}

.badge--mcp {
  top: 80px;
  right: 12px;
  background: #eff6ff;
  border-color: #bfdbfe;
  color: #1d4ed8;
}

/* Tier 3: Méthode & Processus (Lower sides) */
.badge--skills {
  top: 146px;
  left: 12px;
  background: #fefce8;
  border-color: #fde047;
  color: #854d0e;
}

.badge--workflow {
  top: 146px;
  right: 12px;
  background: #f0fdf4;
  border-color: #a7f3d0;
  color: #047857;
}

/* Tier 4: Validation & Déterminisme (Bottom) */
.badge--checks {
  bottom: 16px;
  left: 18px;
  background: #f0fdf4;
  border-color: #a7f3d0;
  color: #047857;
}

.badge--deterministic {
  bottom: 16px;
  right: 18px;
  background: #fff7ed;
  border-color: #fed7aa;
  color: #c2410c;
}
</style>
