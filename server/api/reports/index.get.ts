import { listReports } from '../../utils/reports'

export default defineEventHandler(async () => {
  return listReports()
})
