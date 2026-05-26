<script setup lang="ts">
import ReportListItem from './ReportListItem.vue'
import type { ReportListItem as ReportListItemData } from '~/types/reports'

interface Props {
  reports: ReportListItemData[]
}

defineProps<Props>()
</script>

<template>
  <section class="report-list" aria-label="日报列表">
    <ReportListItem
      v-for="report in reports"
      :key="report.slug"
      :report="report"
    />
  </section>
</template>

<style scoped>
.report-list {
  display: grid;
}
</style>
