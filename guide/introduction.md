# What is ElementaryUI?

ElementaryUI is a **Swift frontend framework** that runs in the browser. It lets you build web applications in Swift instead of JavaScript, bringing Swift's safety and expressiveness to frontend development.

It takes inspiration from SwiftUI to provide an idiomatic way to describe state-driven user interfaces while firmly staying a web framework.

::: danger Caution, Hot!
ElementaryUI is an ambitious open-source project in its very early days. The foundation is starting to settle, but there is still a lot to build, invent, and improve.

**The mission is clear:**  
Make Swift a first-class option for web projects, and keep the project healthy for the long run.

Help us make it a reality by [contributing](https://github.com/elementary-swift) or [sponsoring](https://github.com/sponsors/sliemeobn)!
:::

Here is a tiny counter, the _Hello, world!_ of UI frameworks:

<<< @/swift/Sources/Snippets/TinyCounter.swift#snippet

<elementary-snippet file="TinyCounter" />

## So, SwiftUI for the web?

Not quite, but it rhymes.

ElementaryUI borrows concepts like `View` and `State` from SwiftUI to provide a familiar developer experience. However, unlike "thick" abstractions that try to hide the browser, ElementaryUI is web-native. Your building blocks are still HTML elements and CSS styles, giving you full control over the DOM while keeping Swift's safety.

Similar to SwiftUI, state changes are tracked with transactions and can be animated with one line of code.

**Key differences:**

- **Layout**: SwiftUI's layout system (`HStack`, `VStack`, etc.) does not map cleanly onto CSS-native layout primitives, so it's omitted.
- **Components**: High-level components (`Button`, `List`, etc.) don't have a clear web-native counterpart, so they are not included.
- **Design systems**: Any CSS framework or web design system works seamlessly with ElementaryUI.

## Embedded Swift

Another big difference to SwiftUI is that ElementaryUI does not use type reflection or runtime generics. The `@View` macro does some heavy-lifting at compile time, and the `@Reactive` macro provides a lean replacement for `@Observable`. This is primarily to stay compatible with [Embedded Swift](https://docs.swift.org/embedded/documentation/embedded/) and unlock the ability to produce tiny WebAssembly binaries.

Your application can still choose to use "full Swift", but the framework itself will remain _Embedded Swift_ compatible.

## The Road to 1.0

While official _Swift for WebAssembly_ SDKs are still new and Embedded Swift continues to evolve rapidly, the foundation is solidifying.
The core architecture — the reactive engine, the DOM mapping, and the animation system — are in place and ready to bear some load.

::: info Here are a few high-level topics that are still ahead

<div style="line-height: 1.1">

- Support for creating web components (custom elements)
- Fill in missing gaps for value bindings and event handlers
- Client-side router implementation (for route-based SPAs)
- Mechanism for fetching JSON data (embedded compatible)
- Web Storage APIs (local/session storage, embedded compatible)
- Complete transform and filter effects and built-in transitions
- Swift-native layout and style module (idiomatic APIs for CSS)
- Support more CSS properties in FLIP animations
- Investigate how to further reduce wasm binary size
- Server-side rendering and client-side hydration
- "Meta-Framework" features

</div>

:::

### Should you use it?

If you are building a production-critical banking dashboard today, maybe wait a bit. But if you are a Swift enthusiast looking to build a personal project, an internal tool, or a web component without touching JavaScript, **now is the perfect time to dive in.**

## Get involved

There is still plenty to do to make Swift a _first-class_ web technology. Join the discussion on [Discord](https://discord.com/channels/780838335798706197/1449031857961435136) or contribute on [GitHub](https://github.com/elementary-swift/elementary-ui).

**_Let's make Swift in the Browser a reality!_**
