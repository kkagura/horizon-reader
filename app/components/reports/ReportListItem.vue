<script setup lang="ts">
import type { ReportListItem } from '~/types/reports'

interface Props {
  report: ReportListItem
}

defineProps<Props>()
</script>

<template>
  <NuxtLink class="report-list-item" :to="`/reports/${report.slug}`">
    <div class="report-list-item__meta">
      <time :datetime="report.date">{{ report.date }}</time>
      <span>{{ report.lang }}</span>
    </div>
    <h2 class="report-list-item__title">
      {{ report.title }}
    </h2>
    <p v-if="report.excerpt" class="report-list-item__excerpt">
      {{ report.excerpt }}
    </p>
  </NuxtLink>
</template>

<style scoped>
.report-list-item {
  display: grid;
  gap: 10px;
  padding: 22px 0;
  color: inherit;
  text-decoration: none;
  border-bottom: 1px solid var(--reader-line);
}

.report-list-item:hover .report-list-item__title {
  color: var(--reader-accent);
}

.report-list-item__meta {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  color: var(--reader-muted);
  font-size: 13px;
  letter-spacing: 0;
}

.report-list-item__title {
  margin: 0;
  font-size: clamp(22px, 2vw, 30px);
  line-height: 1.18;
  font-weight: 700;
  transition: color 160ms ease;
}

.report-list-item__excerpt {
  max-width: 760px;
  margin: 0;
  color: var(--reader-muted);
  font-size: 16px;
  line-height: 1.7;
}
</style>
