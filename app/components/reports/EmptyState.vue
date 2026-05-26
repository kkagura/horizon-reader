<template>
  <section class="empty-state">
    <h2 class="empty-state__title">
      暂无可阅读日报
    </h2>
    <p class="empty-state__text">
      请确认 Horizon 已经生成 Markdown，并且 Nuxt 的 REPORTS_DIR 指向正确目录。
    </p>
  </section>
</template>

<style scoped>
.empty-state {
  padding: 54px 0;
  color: var(--reader-muted);
}

.empty-state__title {
  margin: 0 0 10px;
  color: var(--reader-text);
  font-size: 24px;
}

.empty-state__text {
  max-width: 560px;
  margin: 0;
  line-height: 1.7;
}
</style>
