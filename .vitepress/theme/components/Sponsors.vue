<script setup lang="ts">
import { onBeforeUnmount, onMounted, ref, shallowRef } from "vue";
import url400 from "/sponsors/sponsors-400.svg?url";
import url600 from "/sponsors/sponsors-600.svg?url";
import url800 from "/sponsors/sponsors-800.svg?url";

type Variant = 400 | 600 | 800;

const urls: Record<Variant, string> = { 400: url400, 600: url600, 800: url800 };
const cache: Partial<Record<Variant, string>> = {};

const rootEl = ref<HTMLElement | null>(null);
const svgHtml = shallowRef("");

let current: Variant | null = null;
let observer: ResizeObserver | null = null;

function pickVariant(width: number): Variant {
  if (width <= 600) return 400;
  if (width <= 800) return 600;
  return 800;
}

async function load(variant: Variant) {
  current = variant;

  if (cache[variant]) {
    svgHtml.value = cache[variant];
    return;
  }

  const content = await fetch(urls[variant]).then((r) => r.text());
  cache[variant] = content;

  if (variant !== current) return; // stale

  svgHtml.value = content;
}

function update() {
  if (!rootEl.value) return;
  const variant = pickVariant(rootEl.value.clientWidth);
  if (variant !== current) load(variant);
}

onMounted(() => {
  observer = new ResizeObserver(update);
  observer.observe(rootEl.value!);
  update();
});

onBeforeUnmount(() => observer?.disconnect());
</script>

<template>
  <div ref="rootEl" class="sponsors" aria-label="Sponsors">
    <div class="sponsors-svg" v-html="svgHtml"></div>
  </div>
</template>

<style scoped>
.sponsors {
  display: flex;
  justify-content: center;
}

.sponsors-svg {
  width: 100%;
  display: flex;
  justify-content: center;
}
</style>
