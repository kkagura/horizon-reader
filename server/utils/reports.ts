import { stat, readFile } from 'node:fs/promises'
import { resolve, basename, dirname, sep } from 'node:path'
import fg from 'fast-glob'
import { renderMarkdown } from './markdown'

export interface ReportMeta {
  slug: string
  title: string
  date: string
  lang: string
  excerpt?: string
  updatedAt: string
}

export interface ReportDetail extends ReportMeta {
  markdown: string
  html: string
}

const SLUG_PATTERN = /^[A-Za-z0-9._-]+$/

export async function listReports(): Promise<ReportMeta[]> {
  const reportsDir = getReportsDir()
  const entries = await fg('*.md', {
    cwd: reportsDir,
    onlyFiles: true,
    absolute: true,
  })

  const reports = await Promise.all(entries.map(file => readReportMeta(file)))

  return reports
    .filter((report): report is ReportMeta => report !== null)
    .sort((a, b) => {
      const byDate = b.date.localeCompare(a.date)
      if (byDate !== 0) {
        return byDate
      }
      return languageRank(a.lang) - languageRank(b.lang)
    })
}

export async function getReportBySlug(slug: string): Promise<ReportDetail | null> {
  if (!SLUG_PATTERN.test(slug)) {
    return null
  }

  const reportsDir = getReportsDir()
  const filePath = resolve(reportsDir, `${slug}.md`)

  if (!isInsideDirectory(filePath, reportsDir)) {
    return null
  }

  try {
    const markdown = await readFile(filePath, 'utf8')
    const meta = await buildMeta(filePath, markdown)
    const parsed = renderMarkdown(markdown)

    return {
      ...meta,
      markdown,
      html: parsed.html,
    }
  }
  catch {
    return null
  }
}

function getReportsDir(): string {
  const config = useRuntimeConfig()
  return resolve(process.cwd(), String(config.reportsDir || './reports'))
}

async function readReportMeta(filePath: string): Promise<ReportMeta | null> {
  try {
    const markdown = await readFile(filePath, 'utf8')
    return await buildMeta(filePath, markdown)
  }
  catch {
    return null
  }
}

async function buildMeta(filePath: string, markdown: string): Promise<ReportMeta> {
  const parsed = renderMarkdown(markdown)
  const file = basename(filePath, '.md')
  const inferred = inferFromSlug(file)
  const info = await stat(filePath)

  return {
    slug: file,
    title: getString(parsed.data.title) || getFirstHeading(parsed.content) || inferred.title,
    date: getString(parsed.data.date) || inferred.date,
    lang: getString(parsed.data.lang) || inferred.lang,
    excerpt: parsed.excerpt,
    updatedAt: info.mtime.toISOString(),
  }
}

function inferFromSlug(slug: string): Pick<ReportMeta, 'title' | 'date' | 'lang'> {
  const dateMatch = slug.match(/\d{4}-\d{2}-\d{2}/)
  const date = dateMatch?.[0] ?? 'unknown'
  const langMatch = slug.match(/[.-]([A-Za-z]{2,8})$/)
  const lang = langMatch?.[1] ?? 'unknown'
  const title = lang === 'zh' ? `${date} 中文日报` : `${date} Daily Report`

  return { title, date, lang }
}

function getFirstHeading(content: string): string | undefined {
  const heading = content.match(/^#\s+(.+)$/m)?.[1]?.trim()
  return heading || undefined
}

function getString(value: unknown): string | undefined {
  if (typeof value === 'string' && value.trim()) {
    return value.trim()
  }
  return undefined
}

function languageRank(lang: string): number {
  if (lang === 'zh') {
    return 0
  }
  if (lang === 'en') {
    return 1
  }
  return 2
}

function isInsideDirectory(filePath: string, directory: string): boolean {
  const resolvedFile = resolve(filePath)
  const resolvedDirectory = resolve(directory)
  return resolvedFile === resolvedDirectory || resolvedFile.startsWith(`${resolvedDirectory}${sep}`)
}
