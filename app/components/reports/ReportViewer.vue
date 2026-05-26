<script setup lang="ts">
interface Props {
  html: string
}

defineProps<Props>()
</script>

<template>
  <article class="report-viewer" v-html="html" />
</template>

<style scoped>
.report-viewer {
  color: var(--reader-text);
  font-size: 18px;
  line-height: 1.78;
}

.report-viewer :deep(h1),
.report-viewer :deep(h2),
.report-viewer :deep(h3) {
  margin: 1.8em 0 0.6em;
  line-height: 1.2;
}

.report-viewer :deep(h1) {
  font-size: 34px;
}

.report-viewer :deep(h2) {
  padding-top: 12px;
  border-top: 1px solid var(--reader-line);
  font-size: 26px;
}

.report-viewer :deep(h3) {
  font-size: 21px;
}

.report-viewer :deep(p),
.report-viewer :deep(ul),
.report-viewer :deep(ol),
.report-viewer :deep(blockquote),
.report-viewer :deep(pre),
.report-viewer :deep(table) {
  margin: 0 0 1.1em;
}

.report-viewer :deep(a) {
  color: var(--reader-accent-strong);
  text-decoration-thickness: 1px;
  text-underline-offset: 3px;
}

.report-viewer :deep(blockquote) {
  padding: 2px 0 2px 18px;
  color: var(--reader-muted);
  border-left: 3px solid var(--reader-warm);
}

.report-viewer :deep(code) {
  padding: 2px 5px;
  border-radius: 4px;
  background: var(--reader-code-bg);
  font-family: ui-monospace, SFMono-Regular, Consolas, "Liberation Mono", monospace;
  font-size: 0.9em;
}

.report-viewer :deep(pre) {
  overflow-x: auto;
  padding: 16px;
  border-radius: 6px;
  background: #1f2523;
  color: #f6f4ef;
}

.report-viewer :deep(pre code) {
  padding: 0;
  background: transparent;
  color: inherit;
}

.report-viewer :deep(table) {
  width: 100%;
  border-collapse: collapse;
  font-size: 16px;
}

.report-viewer :deep(th),
.report-viewer :deep(td) {
  padding: 10px;
  border: 1px solid var(--reader-line);
  text-align: left;
}
</style>
