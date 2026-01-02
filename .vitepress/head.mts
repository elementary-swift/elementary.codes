import { HeadConfig } from "vitepress";

export default [
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
  // Open Graph meta tags
  ["meta", { property: "og:type", content: "website" }],
  ["meta", { property: "og:site_name", content: "ElementaryUI" }],
  [
    "meta",
    {
      property: "og:title",
      content: "ElementaryUI - Swift, in the browser.",
    },
  ],
  [
    "meta",
    {
      property: "og:description",
      content:
        "A Swift frontend framework that runs in the browser with WebAssembly. SwiftUI-inspired APIs, built-in reactivity, tiny binaries.",
    },
  ],
  [
    "meta",
    {
      property: "og:image",
      content: "https://elementary.codes/og-image.png",
    },
  ],
  ["meta", { property: "og:url", content: "https://elementary.codes" }],
  // Twitter Card meta tags
  ["meta", { name: "twitter:card", content: "summary_large_image" }],
  [
    "meta",
    {
      name: "twitter:title",
      content: "ElementaryUI - Swift, in the browser.",
    },
  ],
  [
    "meta",
    {
      name: "twitter:description",
      content:
        "A Swift frontend framework that runs in the browser with WebAssembly. SwiftUI-inspired APIs, built-in reactivity, tiny binaries.",
    },
  ],
  [
    "meta",
    {
      name: "twitter:image",
      content: "https://elementary.codes/og-image.png",
    },
  ],
] satisfies HeadConfig[];
