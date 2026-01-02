import { defineConfig } from "vitepress";
import swiftWasm from "@elementary-swift/vite-plugin-swift-wasm";
import sidebar from "./sidebar.mts";
import markdownSymbolLinks from "./markdown-symbol-links";

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "Elementary",
  description: "A Swift Frontent Framework",
  sitemap: {
    hostname: "https://elementary.codes",
  },
  head: [
    [
      "link",
      {
        rel: "icon",
        type: "image/svg+xml",
        href: "/favicon.svg",
      },
    ],
    [
      "link",
      {
        rel: "icon",
        type: "image/png",
        href: "/favicon-96x96.png",
        sizes: "96x96",
      },
    ],
    [
      "link",
      {
        rel: "shortcut icon",
        href: "/favicon.ico",
      },
    ],
    [
      "link",
      {
        rel: "apple-touch-icon",
        sizes: "180x180",
        href: "/apple-touch-icon.png",
      },
    ],
    [
      "meta",
      {
        name: "apple-mobile-web-app-title",
        content: "ElementaryUI",
      },
    ],
    [
      "link",
      {
        rel: "manifest",
        href: "/site.webmanifest",
      },
    ],
  ],
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
    logo: "/elementary-logo.svg",
    // https://vitepress.dev/reference/default-theme-config
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
    socialLinks: [
      {
        icon: "github",
        link: "https://github.com/elementary-swift/elementary-ui",
      },
      {
        icon: "discord",
        link: "https://discord.com/channels/780838335798706197/1449031857961435136",
      },
    ],
  },
});
