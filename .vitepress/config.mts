import { defineConfig } from "vitepress";
import swiftWasm from "@elementary-swift/vite-plugin-swift-wasm";
import sidebar from "./sidebar.mts";
import markdownSymbolLinks from "./markdown-symbol-links";

// https://vitepress.dev/reference/site-config
export default defineConfig({
  title: "Elementary",
  description: "A Swift Frontent Framework",
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
  themeConfig: {
    logo: "images/elementary-logo.svg",
    // https://vitepress.dev/reference/default-theme-config
    nav: [
      { text: "Guide", link: "/guide/introduction" },
      {
        text: "API Reference",
        link: "https://swiftpackageindex.com/elementary-swift/elementary-ui/documentation",
      },
    ],
    sidebar: sidebar,
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
        icon: "discord",
        link: "https://discord.com/channels/780838335798706197/1449031857961435136",
      },
    ],
  },
});
