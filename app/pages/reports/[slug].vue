<script setup lang="ts">
import ReportViewer from '~/components/reports/ReportViewer.vue'
import type { ReportDetail } from '~/types/reports'

const route = useRoute()
const slug = computed(() => String(route.params.slug ?? ''))

const { data, status, error } = await useFetch<ReportDetail>(() => `/api/reports/${slug.value}`)
</script>

<template>
  <main class="page-shell detail-page">
    <div class="page-inner detail-page__inner">
      <NuxtLink class="detail-page__back" to="/">
        返回列表
      </NuxtLink>

      <p v-if="status === 'pending'" class="detail-page__state">
        正在读取日报...
      </p>
      <p v-else-if="error" class="detail-page__state detail-page__state--error">
        读取日报失败：{{ error.message }}
      </p>

      <template v-else-if="data">
        <header class="detail-page__header">
          <div class="detail-page__meta">
            <time :datetime="data.date">{{ data.date }}</time>
            <span>{{ data.lang }}</span>
          </div>
          <h1 class="detail-page__title">
            {{ data.title }}
          </h1>
        </header>

        <ReportViewer :html="data.html" />
      </template>
    </div>
  </main>
</template>

<style scoped>
.detail-page {
  padding: 36px 0 90px;
}

.detail-page__inner {
  max-width: 860px;
}

.detail-page__back {
  display: inline-flex;
  margin-bottom: 42px;
  color: var(--reader-accent-strong);
  font-size: 15px;
  text-decoration-thickness: 1px;
  text-underline-offset: 3px;
}

.detail-page__header {
  margin-bottom: 34px;
  padding-bottom: 28px;
  border-bottom: 1px solid var(--reader-line);
}

.detail-page__meta {
  display: flex;
  gap: 12px;
  margin-bottom: 14px;
  color: var(--reader-muted);
  font-size: 14px;
}

.detail-page__title {
  margin: 0;
  font-size: clamp(34px, 6vw, 64px);
  line-height: 1.02;
  letter-spacing: 0;
}

.detail-page__state {
  color: var(--reader-muted);
}

.detail-page__state--error {
  color: #8f2c1f;
}
</style>
