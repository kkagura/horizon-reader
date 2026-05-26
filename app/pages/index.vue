<script setup lang="ts">
import EmptyState from '~/components/reports/EmptyState.vue'
import ReportList from '~/components/reports/ReportList.vue'
import ReportToolbar from '~/components/reports/ReportToolbar.vue'
import type { ReportListItem } from '~/types/reports'

const { data, status, error, refresh } = await useFetch<ReportListItem[]>('/api/reports', {
  default: () => [],
})

const reports = computed(() => data.value ?? [])
const {
  query,
  language,
  languages,
  visibleReports,
} = useReportsFilter(reports)
</script>

<template>
  <main class="page-shell home-page">
    <div class="page-inner">
      <header class="home-page__header">
        <div>
          <p class="home-page__eyebrow">
            Horizon Reader
          </p>
          <h1 class="home-page__title">
            AI 新闻日报
          </h1>
        </div>
        <button class="home-page__refresh" type="button" @click="refresh()">
          刷新
        </button>
      </header>

      <ReportToolbar
        v-model:query="query"
        v-model:language="language"
        :languages="languages"
        :total="visibleReports.length"
      />

      <p v-if="status === 'pending'" class="home-page__state">
        正在读取日报...
      </p>
      <p v-else-if="error" class="home-page__state home-page__state--error">
        读取日报失败：{{ error.message }}
      </p>
      <ReportList v-else-if="visibleReports.length" :reports="visibleReports" />
      <EmptyState v-else />
    </div>
  </main>
</template>

<style scoped>
.home-page {
  padding: 56px 0 80px;
}

.home-page__header {
  display: flex;
  align-items: end;
  justify-content: space-between;
  gap: 24px;
  padding-bottom: 34px;
}

.home-page__eyebrow {
  margin: 0 0 8px;
  color: var(--reader-warm);
  font-size: 14px;
  font-weight: 700;
  text-transform: uppercase;
}

.home-page__title {
  margin: 0;
  font-size: clamp(42px, 8vw, 92px);
  line-height: 0.95;
  letter-spacing: 0;
}

.home-page__refresh {
  min-width: 82px;
  min-height: 42px;
  border: 1px solid var(--reader-text);
  border-radius: 6px;
  background: var(--reader-text);
  color: var(--reader-surface);
  cursor: pointer;
}

.home-page__refresh:hover {
  background: var(--reader-accent-strong);
}

.home-page__state {
  margin: 28px 0 0;
  color: var(--reader-muted);
}

.home-page__state--error {
  color: #8f2c1f;
}

@media (max-width: 680px) {
  .home-page {
    padding-top: 34px;
  }

  .home-page__header {
    align-items: start;
    flex-direction: column;
  }
}
</style>
