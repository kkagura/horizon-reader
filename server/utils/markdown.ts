import MarkdownIt from 'markdown-it'
import matter from 'gray-matter'

export interface ParsedMarkdown {
  data: Record<string, unknown>
  content: string
  html: string
  excerpt?: string
}

const markdown = new MarkdownIt({
  html: false,
  linkify: true,
  typographer: true,
})

const originalLinkOpen = markdown.renderer.rules.link_open

markdown.renderer.rules.link_open = (tokens, index, options, env, self) => {
  const token = tokens[index]
  const href = token.attrGet('href') ?? ''

  if (/^https?:\/\//.test(href)) {
    token.attrSet('target', '_blank')
    token.attrSet('rel', 'noopener noreferrer')
  }

  return originalLinkOpen
    ? originalLinkOpen(tokens, index, options, env, self)
    : self.renderToken(tokens, index, options)
}

export function renderMarkdown(input: string): ParsedMarkdown {
  const parsed = matter(input)
  const content = parsed.content.trim()

  return {
    data: parsed.data,
    content,
    html: markdown.render(content),
    excerpt: createExcerpt(content),
  }
}

function createExcerpt(content: string): string | undefined {
  const text = content
    .replace(/```[\s\S]*?```/g, ' ')
    .replace(/`([^`]+)`/g, '$1')
    .replace(/!\[[^\]]*]\([^)]+\)/g, ' ')
    .replace(/\[([^\]]+)]\([^)]+\)/g, '$1')
    .replace(/^#{1,6}\s+/gm, '')
    .replace(/[*_>#-]/g, ' ')
    .replace(/\s+/g, ' ')
    .trim()

  if (!text) {
    return undefined
  }

  return text.length > 180 ? `${text.slice(0, 180)}...` : text
}
