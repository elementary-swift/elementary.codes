---
layout: home

hero:
  name: ElementaryUI
  text: Swift, in the browser.
  # tagline:
  image: /images/elementary-logo.svg

  actions:
    - theme: brand
      text: Get Started
      link: /guide/get-started
    - theme: alt
      text: What is it?
      link: /guide/introduction
    - theme: alt
      text: GitHub
      link: http://github.com/elementary-swift/elementary-ui

features:
  - icon: 🌐
    title: Swift in the Browser
    details: Run declarative Swift applications natively in the browser with WebAssembly
  - icon: 🎨
    title: SwiftUI-inspired APIs
    details: Familiar and intuitive syntax for building web UIs
  - icon: 💫
    title: Built-in Reactivity
    details: Automatic state management with @State, @Environment, and @Reactive
  - icon: 📦
    title: Tiny Binaries
    details: Full Embedded Swift support means kB-sized wasm bundles instead of MB
  - icon: ✨
    title: Magical Animations
    details: Powerful CSS-based animation system including automatic FLIP transitions
  - icon: 🚀
    title: Vite-Powered Development
    details: Fast dev server with hot reload for rapid iteration
---

<<< @/swift/Sources/Snippets/LoveCounter.swift#snippet

<elementary-snippet file="LoveCounter" />
