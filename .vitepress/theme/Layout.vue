<script setup>
import DefaultTheme from "vitepress/theme";
import IndexFooter from "./components/index-footer.vue";
import { useLayout } from "vitepress/theme";

const { Layout } = DefaultTheme;
const { hasSidebar } = useLayout();
</script>

<template>
  <Layout>
    <template #layout-bottom>
      <IndexFooter v-if="!hasSidebar" />
    </template>
  </Layout>
</template>
