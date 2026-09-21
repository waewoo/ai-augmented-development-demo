<script setup lang="ts">
// Celebratory AI companion robot hero for the closing/thank-you slide
</script>

<template>
  <div class="closing-hero-container">
    <div class="robot-stage">
      <!-- Floating keyword badge -->
      <div class="floating-badge badge--thanks">
        <span class="badge-icon">💬</span>
        <span class="badge-text">Questions ?</span>
      </div>

      <!-- Friendly Celebratory AI Robot SVG -->
      <div class="robot-graphic">
        <svg viewBox="0 0 220 220" width="200" height="200" fill="none" xmlns="http://www.w3.org/2000/svg">
          <!-- Soft glow behind robot -->
          <circle cx="110" cy="115" r="88" fill="#e6f7ef" opacity="0.8" />
          <circle cx="110" cy="115" r="68" fill="#d1fae5" opacity="0.6" />

          <!-- Antenna -->
          <line x1="110" y1="42" x2="110" y2="20" stroke="#64748b" stroke-width="4" stroke-linecap="round" />
          <circle cx="110" cy="16" r="8" fill="#00875a" />
          <circle cx="110" cy="16" r="4" fill="#6ee7b7" />
          <!-- Star sparkle next to antenna -->
          <path d="M125 12 L128 18 L134 19 L129 23 L131 29 L125 25 L119 29 L121 23 L116 19 L122 18 Z" fill="#f59e0b" opacity="0.85" />

          <!-- Robot Ears/Headphones -->
          <rect x="36" y="66" width="10" height="26" rx="5" fill="#00875a" />
          <rect x="174" y="66" width="10" height="26" rx="5" fill="#00875a" />

          <!-- Robot Head -->
          <rect x="42" y="42" width="136" height="74" rx="22" fill="#ffffff" stroke="#cbd5e1" stroke-width="3" />

          <!-- Screen / Visor -->
          <rect x="52" y="52" width="116" height="54" rx="14" fill="#0f172a" />

          <!-- Smiling Digital Eyes (joyful arcs) -->
          <path d="M70 80 C70 68, 90 68, 90 80" stroke="#34d399" stroke-width="5" stroke-linecap="round" fill="none" />
          <path d="M130 80 C130 68, 150 68, 150 80" stroke="#34d399" stroke-width="5" stroke-linecap="round" fill="none" />

          <!-- Cheeks blush -->
          <ellipse cx="66" cy="91" rx="6.5" ry="4" fill="#f43f5e" opacity="0.5" />
          <ellipse cx="154" cy="91" rx="6.5" ry="4" fill="#f43f5e" opacity="0.5" />

          <!-- Broad cheerful smile -->
          <path d="M102 88 Q110 96 118 88" stroke="#6ee7b7" stroke-width="3" stroke-linecap="round" fill="none" />

          <!-- Neck -->
          <rect x="96" y="116" width="28" height="12" rx="3" fill="#94a3b8" />

          <!-- Robot Body -->
          <rect x="54" y="128" width="112" height="76" rx="20" fill="#ffffff" stroke="#cbd5e1" stroke-width="3" />

          <!-- Chest Screen -->
          <rect x="72" y="139" width="76" height="38" rx="10" fill="#0f172a" />

          <!-- Heart / Star in Chest -->
          <path d="M110 162 C110 162, 98 154, 98 147 C98 143.5, 101 141, 104.5 141 C107.5 141, 109.5 143, 110 144 C110.5 143, 112.5 141, 115.5 141 C119 141, 122 143.5, 122 147 C122 154, 110 162, 110 162 Z" fill="#f43f5e" />

          <!-- Status dots below chest screen -->
          <circle cx="94" cy="191" r="3.5" fill="#3b82f6" />
          <circle cx="110" cy="191" r="3.5" fill="#00875a" />
          <circle cx="126" cy="191" r="3.5" fill="#f59e0b" />

          <!-- Arms both waving enthusiastically! -->
          <!-- Left Arm waving up -->
          <path d="M54 144 C36 138, 26 122, 34 110" stroke="#cbd5e1" stroke-width="7" stroke-linecap="round" fill="none" />
          <circle cx="34" cy="106" r="7" fill="#00875a" />

          <!-- Right Arm waving up -->
          <path d="M166 144 C184 138, 194 122, 186 110" stroke="#cbd5e1" stroke-width="7" stroke-linecap="round" fill="none" />
          <circle cx="186" cy="106" r="7" fill="#00875a" />
        </svg>
      </div>
    </div>
  </div>
</template>

<style scoped>
.closing-hero-container {
  align-items: center;
  display: flex;
  flex-direction: column;
  max-width: 360px;
  position: relative;
  width: 100%;
}

.robot-stage {
  align-items: center;
  background: #ffffff;
  border: 1.5px solid #e2e8f0;
  border-radius: 20px;
  box-shadow: 0 12px 32px rgba(15, 23, 42, 0.08);
  display: flex;
  flex-direction: column;
  padding: 24px 20px 20px;
  position: relative;
  width: 100%;
}

.robot-graphic {
  align-items: center;
  display: flex;
  justify-content: center;
}

/* Floating Badge */
.floating-badge {
  align-items: center;
  border-radius: 999px;
  box-shadow: 0 4px 12px rgba(15, 23, 42, 0.08);
  display: flex;
  font-size: 11px;
  font-weight: 750;
  gap: 5px;
  padding: 4px 10px;
  position: absolute;
  z-index: 10;
}

.badge-icon {
  font-size: 12px;
}

.badge--thanks {
  background: #f0fdf4;
  border: 1px solid #86efac;
  color: #166534;
  left: -12px;
  top: 14px;
}
</style>

