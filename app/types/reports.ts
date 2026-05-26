export interface ReportListItem {
  slug: string
  title: string
  date: string
  lang: string
  excerpt?: string
  updatedAt: string
}

export interface ReportDetail extends ReportListItem {
  markdown: string
  html: string
}
