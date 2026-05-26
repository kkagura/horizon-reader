import type { ReportListItem } from '~/types/reports'

export function useReportsFilter(reports: Ref<ReportListItem[]>) {
  const query = shallowRef('')
  const language = shallowRef('all')

  const languages = computed(() => {
    const values = new Set(reports.value.map(report => report.lang).filter(Boolean))
    return ['all', ...Array.from(values).sort()]
  })

  const visibleReports = computed(() => {
    const normalizedQuery = query.value.trim().toLowerCase()

    return reports.value.filter((report) => {
      const matchesLanguage = language.value === 'all' || report.lang === language.value
      const text = `${report.title} ${report.date} ${report.excerpt ?? ''}`.toLowerCase()
      const matchesQuery = !normalizedQuery || text.includes(normalizedQuery)

      return matchesLanguage && matchesQuery
    })
  })

  return {
    query,
    language,
    languages,
    visibleReports,
  }
}
