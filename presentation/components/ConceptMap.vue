<template>
  <div class="concept-map">
    <article class="concept-card concept-card--why">
      <div class="concept-card__badge">01 · Pourquoi ?</div>
      <strong>Intention & critères</strong>
      <p>Comprendre le besoin réel, les critères d’acceptation et le comportement attendu avant tout changement.</p>
      <div class="concept-card__tag">Demande claire</div>
    </article>

    <article class="concept-card concept-card--where">
      <div class="concept-card__badge">02 · Où ?</div>
      <strong>Code & architecture</strong>
      <p>Identifier le point d’entrée, les modules existants, les types de données et l’organisation du projet.</p>
      <div class="concept-card__tag">Point d’ancrage</div>
    </article>

    <article class="concept-card concept-card--how">
      <div class="concept-card__badge">03 · Comment ?</div>
      <strong>Rules & conventions</strong>
      <p>Appliquer les choix d’architecture, les normes de style, les consignes de sécurité et de restitution.</p>
      <div class="concept-card__tag">Attentes projet</div>
    </article>

    <article class="concept-card concept-card--limit">
      <div class="concept-card__badge">04 · Jusqu’où ?</div>
      <strong>Garde-fous & preuves</strong>
      <p>Poser les limites d’action, les permissions d’outils et s’appuyer sur la suite de tests existante.</p>
      <div class="concept-card__tag">Périmètre borné</div>
    </article>

    <div class="concept-map__question">
      <SlideQuestion
        variant="emerald"
        question="Si on injecte l'intégralité du code et de la doc dans le contexte, le résultat est-il meilleur ?"
        answer="Non ! Le surplus d'informations noie l'attention du modèle et augmente le risque d'hallucinations ou d'oubli des consignes."
      />
    </div>
  </div>
</template>

<style scoped>
.concept-map {
  display: grid;
  gap: 12px;
  grid-template-columns: repeat(2, 1fr);
  margin: 10px auto 0;
  max-width: 1040px;
}

.concept-card {
  background: var(--surface);
  border: 1px solid var(--line);
  border-left: 5px solid var(--violet);
  border-radius: 12px;
  box-shadow: 0 4px 16px rgba(15, 23, 42, 0.04);
  display: flex;
  flex-direction: column;
  padding: 12px 18px;
  position: relative;
  transition: all 0.15s ease;
}

.concept-card:hover {
  border-color: #a5b4fc;
  box-shadow: 0 8px 22px rgba(30, 64, 175, 0.08);
  transform: translateY(-2px);
}

.concept-card--where {
  border-left-color: var(--teal);
}

.concept-card--how {
  border-left-color: var(--warning);
}

.concept-card--limit {
  border-left-color: #8b5cf6;
}

.concept-card__badge {
  color: var(--violet);
  font-size: 11px;
  font-weight: 800;
  letter-spacing: 0.08em;
  text-transform: uppercase;
}

.concept-card--where .concept-card__badge {
  color: var(--teal);
}

.concept-card--how .concept-card__badge {
  color: var(--warning);
}

.concept-card--limit .concept-card__badge {
  color: #8b5cf6;
}

.concept-card strong {
  color: var(--ink);
  font-size: 17px;
  line-height: 1.2;
  margin-top: 4px;
}

.concept-card p {
  color: var(--muted);
  font-size: 13px;
  line-height: 1.35;
  margin: 4px 0 0;
}

.concept-card__tag {
  background: var(--slide-bg);
  border: 1px solid var(--line);
  border-radius: 999px;
  color: var(--muted);
  font-size: 11px;
  font-weight: 700;
  margin-top: 8px;
  padding: 2px 10px;
  width: fit-content;
}

.concept-map__question {
  grid-column: 1 / -1;
  margin-top: 4px;
}
</style>
