import { getReportBySlug } from '../../utils/reports'

export default defineEventHandler(async (event) => {
  const slug = getRouterParam(event, 'slug')

  if (!slug) {
    throw createError({
      statusCode: 400,
      statusMessage: 'Missing report slug',
    })
  }

  const report = await getReportBySlug(slug)

  if (!report) {
    throw createError({
      statusCode: 404,
      statusMessage: 'Report not found',
    })
  }

  return report
})
