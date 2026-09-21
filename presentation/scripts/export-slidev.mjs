import { existsSync } from 'node:fs'
import { cp, mkdir, mkdtemp, readFile, readdir, rm, writeFile } from 'node:fs/promises'
import { execFile } from 'node:child_process'
import { promisify } from 'node:util'
import { tmpdir } from 'node:os'
import { join, resolve } from 'node:path'

const run = promisify(execFile)
const mode = process.argv[2]
const formats = {
  pdf: ['pdf', 'exports/presentation.pdf'],
  pptx: ['pptx', 'exports/presentation.pptx'],
  'pptx-editable': ['pptx-editable', 'exports/presentation-editable.pptx'],
  png: ['png', 'public/screenshots'],
}

if (!formats[mode]) throw new Error(`Unknown export mode: ${mode}`)
await mkdir(mode === 'png' ? 'public/screenshots' : 'exports', { recursive: true })

const [format, output] = formats[mode]
const tempProject = await mkdtemp(join(tmpdir(), 'slidev-static-'))
const stripClicks = (content) => content.replace(/\s+v-click(?:="[^"]*"|'[^']*')?/g, '')

await writeFile(join(tempProject, 'slides.md'), stripClicks(await readFile('slides.md', 'utf8')))
await cp('components', join(tempProject, 'components'), { recursive: true })
for (const file of await readdir('components')) {
  if (!file.endsWith('.vue')) continue
  const source = join('components', file)
  await writeFile(join(tempProject, 'components', file), stripClicks(await readFile(source, 'utf8')))
}
await cp('styles', join(tempProject, 'styles'), { recursive: true })

const args = [resolve('node_modules/.bin/slidev'), 'export', 'slides.md', '--format', format, '--output', resolve(output)]
if (existsSync('/usr/bin/google-chrome')) args.push('--executable-path', '/usr/bin/google-chrome')
try {
  await run(args[0], args.slice(1), { cwd: tempProject, stdio: 'inherit', maxBuffer: 50 * 1024 * 1024 })
} finally {
  await rm(tempProject, { recursive: true, force: true })
}
