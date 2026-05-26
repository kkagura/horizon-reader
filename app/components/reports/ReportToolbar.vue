<script setup lang="ts">
interface Props {
  languages: string[]
  total: number
}

defineProps<Props>()

const query = defineModel<string>('query', { required: true })
const language = defineModel<string>('language', { required: true })
</script>

<template>
  <section class="report-toolbar" aria-label="日报筛选">
    <div class="report-toolbar__search">
      <label class="sr-only" for="report-search">搜索日报</label>
      <input
        id="report-search"
        v-model="query"
        class="report-toolbar__input"
        type="search"
        placeholder="搜索标题、摘要或日期"
      >
    </div>

    <div class="report-toolbar__filters">
      <label class="sr-only" for="report-language">语言</label>
      <select id="report-language" v-model="language" class="report-toolbar__select">
        <option v-for="item in languages" :key="item" :value="item">
          {{ item === 'all' ? '全部语言' : item }}
        </option>
      </select>
      <span class="report-toolbar__count">{{ total }} 篇</span>
    </div>
  </section>
</template>

<style scoped>
.report-toolbar {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 16px;
  padding: 18px 0;
  border-top: 1px solid var(--reader-line);
  border-bottom: 1px solid var(--reader-line);
}

.report-toolbar__search {
  flex: 1 1 auto;
}

.report-toolbar__input,
.report-toolbar__select {
  width: 100%;
  min-height: 42px;
  border: 1px solid var(--reader-line);
  border-radius: 6px;
  background: var(--reader-surface);
  color: var(--reader-text);
}

.report-toolbar__input {
  padding: 0 14px;
}

.report-toolbar__select {
  padding: 0 36px 0 12px;
}

.report-toolbar__filters {
  display: grid;
  grid-template-columns: minmax(120px, 160px) auto;
  align-items: center;
  gap: 12px;
}

.report-toolbar__count {
  color: var(--reader-muted);
  font-size: 14px;
  white-space: nowrap;
}

@media (max-width: 680px) {
  .report-toolbar {
    align-items: stretch;
    flex-direction: column;
  }

  .report-toolbar__filters {
    grid-template-columns: 1fr auto;
  }
}
</style>
