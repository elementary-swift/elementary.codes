# Get Started

Go from zero to **_Swift in the Browser_** in minutes.

::: info Prerequisites
For any of the methods described below, you will need the following:

- [**Swift 6.3+**](https://www.swift.org/install/) with [**Swift SDK for WebAssembly**](https://www.swift.org/documentation/articles/wasm-getting-started.html)
- [**Node.js 22+**](https://nodejs.org/en/download) for Vite tooling
- [Optional] Binaryen `wasm-opt` ([Homebrew](https://formulae.brew.sh/formula/binaryen), [manual](https://github.com/WebAssembly/binaryen/releases))

:::

## Vite Starter Template

The easiest way to get going is by using the Vite Starter [template repository](https://github.com/elementary-swift/starter-vite).

You can use the [degit](https://github.com/Rich-Harris/degit) utility to scaffold a local project:

```sh
npx degit elementary-swift/starter-vite my-elementary-project
cd my-elementary-project
```

In your new project folder, you will find a Swift package and a Vite project already configured to work together.

Install package dependencies:
::: code-group

```sh [npm]
npm install
```

```sh [pnpm]
pnpm preinstall
pnpm install
```

:::

Start Vite dev mode:
::: code-group

```sh [npm]
npm run dev
```

```sh [pnpm]
pnpm dev
```

:::

**That's it!**  
After an initial build of your Swift package, any changes to the Swift source code will be _hot-reloaded_ automatically. Consult the [template README](https://github.com/elementary-swift/starter-vite/blob/main/README.md) for further information.

## Templates and Examples

Here is a list of starter and demo projects:

| Project                                                                           | Description                                                                                   |
| --------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------- |
| [**Minimal Vite Starter**](https://github.com/elementary-swift/starter-vite)      | Basic template for ElementaryUI.                                                              |
| [**Tailwind Starter**](https://github.com/elementary-swift/starter-vite-tailwind) | Starter template with [Tailwind CSS](https://tailwindcss.com) preconfigured.                  |
| [**Swiftle**](https://elementary-swift.github.io/elementary-ui/)                  | A tiny word game using [ElementaryFlow](https://github.com/elementary-swift/elementary-flow). |

## Manual Setup

Alternatively, you can set up a project from scratch with just a few steps.

### Swift Package

Create a Swift package with an executable target, and add [ElementaryUI](https://github.com/elementary-swift/elementary-ui) and [JavaScriptKit](https://github.com/swiftwasm/JavaScriptKit) as dependencies.

```sh
# Initialize a package
swift package init --type executable --name MyApp

# Add dependencies
swift package add-dependency https://github.com/swiftwasm/JavaScriptKit --from 0.56.0
swift package add-dependency https://github.com/elementary-swift/elementary-ui --from 0.6.0
swift package add-target-dependency ElementaryUI MyApp --package elementary-ui
```

Mount the application's root view in your Swift `@main` entrypoint. For macOS, add the platform requirement to your `Package.swift` file:

::: code-group

```swift:line-numbers [Sources/MyApp/MyApp.swift]
import ElementaryUI // [!code highlight]

@main
struct MyApp {
    static func main() {
        Application(h1 { "Hello, world!" }) // [!code highlight]
            .mount(in: .body) // [!code highlight]
    }
}
```

```swift:line-numbers=6 [Package.swift]
  let package = Package(
    name: "MyApp",
    platforms: [.macOS(.v15)], // [!code ++]
    dependencies: [
      .package(url: "https://github.com/swiftwasm/JavaScriptKit", from: "0.56.0"),
      .package(url: "https://github.com/elementary-swift/elementary-ui", from: "0.6.0")
```

:::

You can run a simple build to check that the Swift part is set up correctly.

```sh
# Make sure to use the Swift SDK matching your toolchain version
swift build --swift-sdk swift-6.3.3-RELEASE_wasm
```

### Web Setup

In order to run your Swift WebAssembly executable in the browser, you need an HTML page and a bit of JavaScript glue code. As most web projects will also require additional resources and assets (like CSS files, images, ...), this guide recommends [Vite](https://vite.dev/) as the web build tool.

Start with a simple `package.json` file:
::: code-group

```json:line-numbers [package.json]
{
  "type": "module"
}
```

:::

Install Vite and the [Vite plugin for Swift WebAssembly](https://www.npmjs.com/package/@elementary-swift/vite-plugin-swift-wasm) as dev dependencies, and the [WASI Shim](https://github.com/bjorn3/browser_wasi_shim), which the runtime glue code depends on.

::: code-group

```sh [npm]
npm install -D vite @elementary-swift/vite-plugin-swift-wasm
npm install @bjorn3/browser_wasi_shim@~0.4
```

```sh [pnpm]
pnpm add -D vite @elementary-swift/vite-plugin-swift-wasm
pnpm add @bjorn3/browser_wasi_shim@~0.4
```

:::

Create a Vite config and add the plugin. Adding a TypeScript config will enable type-checking and a better code editor experience.

::: code-group

```ts:line-numbers [vite.config.ts]
import { defineConfig } from "vite";
import swiftWasm from "@elementary-swift/vite-plugin-swift-wasm";

export default defineConfig({
  plugins: [swiftWasm({ useEmbeddedSDK: true })], // [!code highlight]
});
```

```jso:line-numbers [tsconfig.json]
{
  "compilerOptions": {
    "target": "ES2022",
    "module": "ESNext",
    "moduleResolution": "bundler",
    "lib": ["ES2022", "DOM"],
    "types": ["vite/client", "@elementary-swift/vite-plugin-swift-wasm/client"], // [!code highlight]
    "isolatedModules": true,
    "strict": true,
    "noEmit": true
  }
}
```

:::

Finally, add an `index.html` file with a short script that runs the WebAssembly application.

::: code-group

```html:line-numbers{9-12} [index.html]
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>MyApp</title>
  </head>
  <body>
    <script type="module">
      import { init } from "virtual:swift-wasm?js";
      await init()
    </script>
  </body>
</html>
```

:::

You can now use Vite to run a _dev server_ that watches your Swift source files and automatically hot-rebuilds your application. Use `vite build` to create a deployment bundle. See the [Vite plugin README](https://github.com/elementary-swift/vite-plugin-swift-wasm) for more configuration options.

::: code-group

```sh [npm]
npx vite --open
```

```sh [pnpm]
pnpm vite --open
```

:::
