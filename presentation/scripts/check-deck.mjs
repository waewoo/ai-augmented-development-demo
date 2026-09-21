import { access, readdir, readFile } from 'node:fs/promises'

const slides = await readFile('slides.md', 'utf8')
const slideCount = (slides.match(/^---$/gm) ?? []).length - 1
if (slideCount > 19) throw new Error(`Too many slides: ${slideCount}`)
if (slideCount !== 19) throw new Error(`Expected 19 slides, got ${slideCount}`)

for (const component of [
  'CoverSlide.vue', 'CoverHero.vue', 'ModelClientMatrix.vue', 'VibeCodingComparison.vue', 'WorkflowDiagram.vue', 'HarnessDiagram.vue', 'RulesComparison.vue',
  'SkillAnatomy.vue', 'ConceptMap.vue', 'CodeEvolution.vue', 'DemoCue.vue', 'PitfallsCards.vue', 'ActionPlan.vue',
  'ResourceQr.vue', 'ClosingSlide.vue', 'ClosingHero.vue',
]) {
  await access(`components/${component}`)
}

for (const marker of ['LIVE DEMO', 'Durée :', 'Transition :', 'Solution de secours']) {
  if (!slides.includes(marker)) throw new Error(`Missing speaker-note marker: ${marker}`)
}

await access('styles/index.css')
console.log(`Slidev source OK: ${slideCount} slides, components, styles and notes present`)

const screenshots = await readdir('public/screenshots').catch(() => [])
if (screenshots.length) console.log(`PNG screenshots present: ${screenshots.length}`)
