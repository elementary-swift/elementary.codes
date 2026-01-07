import { defineConfig } from "vitepress";
import swiftWasm from "@elementary-swift/vite-plugin-swift-wasm";
import sidebar from "./sidebar.mts";
import markdownSymbolLinks from "./markdown-symbol-links";
import head from "./head.mts";

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "ElementaryUI",
  description: "A Swift frontend framework that runs in the browser",
  sitemap: {
    hostname: "https://elementary.codes",
  },
  head,
  markdown: {
    config: (md) => {
      md.use(markdownSymbolLinks);
    },
  },
  vite: {
    plugins: [
      swiftWasm({
        packagePath: "./swift",
        useEmbeddedSDK: true,
      }),
    ],
  },
  vue: {
    template: {
      compilerOptions: {
        isCustomElement: (tag) => {
          return tag.startsWith("elementary-");
        },
      },
    },
  },
  appearance: "dark",
  themeConfig: {
    // https://vitepress.dev/reference/default-theme-config
    logo: "/elementary-logo.svg",
    nav: [
      { text: "Guide", link: "/guide/introduction" },
      {
        text: "API Reference",
        link: "https://swiftpackageindex.com/elementary-swift/elementary-ui/documentation",
      },
    ],
    sidebar: sidebar,
    search: {
      provider: "local",
      options: {
        detailedView: true,
      },
    },
    editLink: {
      pattern:
        "https://github.com/elementary-swift/elementary.codes/edit/main/:path",
    },
    socialLinks: [
      {
        icon: "github",
        link: "https://github.com/elementary-swift/elementary-ui",
      },
      {
        icon: "bluesky",
        link: "https://bsky.app/profile/elementary.codes",
      },
      {
        icon: "discord",
        link: "https://discord.com/channels/780838335798706197/1449031857961435136",
      },
    ],
  },
});
