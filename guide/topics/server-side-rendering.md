# Server-Side Rendering

ElementaryUI is designed to run in the browser and keep the DOM in sync with your view hierarchy.
But the lower-level building blocks it stands on — all HTML types and the `@HTMLBuilder` for composition — come from the [`Elementary`](https://github.com/elementary-swift/elementary) package, which focuses on **server-side rendering (SSR)**.

This chapter explains how SSR works in Elementary today, how it relates to ElementaryUI, and what patterns are practical while a _hydration_ feature is still evolving.

## Elementary vs ElementaryUI

- **Elementary** - An HTML rendering library. It renders values that conform to `HTML` directly to text (either as a `String` or as a streamed sequence of chunks). It is framework-agnostic and meant to fit into server apps, and it does so without any extra dependencies or macros.

- **ElementaryUI** - A reactive UI framework for the browser. It builds on the same HTML types to produce and update real DOM nodes. It depends on Elementary, JavaScriptKit and Swift macros.

The goal is for these two worlds to one day be fully integrated in a combined `ElementaryUI` framework, however, the details of how exactly this will happen are not yet decided. It will most likely involve package traits or similar for conditional compilation.

## SSR + ElementaryUI (what works today)

ElementaryUI does not yet ship with a complete “render on the server and hydrate on the client” pipeline.
However, you can still combine SSR and interactivity using an **islands** approach:

- Use **Elementary** to render the full HTML page (or most of it).
- Add placeholders like `<div id="comments"></div>` where you want interactivity.
- In the browser, mount one or more **ElementaryUI** applications into those placeholders using `Application(...).mount(in:)`.

This gives you:

- fast, indexable HTML from SSR
- isolated interactive widgets without needing full hydration

You can read more about mounting multiple apps in the [Application](../essentials/application.md#multiple-applications) chapter.

It is also planned to have out-of-the-box support for defining **Web Components** (custom elements) in ElementaryUI. In fact, this website already uses custom elements for its interactive snippets (look for `elementary-snippet`).

## Hydration (the direction)

The long-term plan is to unify the SSR and browser runtimes so that the same view code can:

- render to HTML on the server
- and then **hydrate** on the client (attaching behavior to the already-rendered markup)

Until that integration lands, prefer **SSR + islands** for progressively-enhanced pages, and **full CSR** for highly interactive apps.
