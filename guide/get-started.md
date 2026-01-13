# Get Started

Go from zero to **_Swift in the Browser_** in minutes.

::: info Prerequisites
For any of the methods described below you will need the following:

- [**Swift 6.2+**](https://www.swift.org/install/) with [**SwiftSDK for WebAssembly**](https://www.swift.org/documentation/articles/wasm-getting-started.html)
- [**Node.js 22+**](https://nodejs.org/en/download) for Vite tooling
- [Optional] Binaryen `wasm-opt` ([homebrew](https://formulae.brew.sh/formula/binaryen), [manual](https://github.com/WebAssembly/binaryen/releases))

:::

## Vite Starter Template

The easiest way to get going is by using the Vite Starter [template repository](https://github.com/elementary-swift/starter-vite).

You can use the [degit](https://github.com/Rich-Harris/degit) utility to scaffold a local project:

```sh
npx degit elementary-swift/starter-vite my-elementary-project
cd my-elementary-project
```

In your new project folder you will find a Swift package and a Vite project already configured to work together.

Install package dependencies
::: code-group

```sh [npm]
$ npm install
```

```sh [pnpm]
$ pnpm preinstall
$ pnpm install
```

:::

Start Vite dev mode
::: code-group

```sh [npm]
$ npm run dev
```

```sh [pnpm]
$ pnpm dev
```

:::

**That's it!**  
After an initial build of your Swift package, any changes to the Swift source code will be _hot-reloaded_ automatically. Consult the [template README](https://github.com/elementary-swift/starter-vite/blob/main/README.md) for further information.

## Templates and Examples

Here is a list of starter and demo projects:

| Project                                                                           | Description                                                                  |
| --------------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| [**Minimal Vite Starter**](https://github.com/elementary-swift/starter-vite)      | Basic template for ElementaryUI.                                             |
| [**Tailwind Starter**](https://github.com/elementary-swift/starter-vite-tailwind) | Starter template with [Tailwind CSS](https://tailwindcss.com) preconfigured. |

## Manual Setup

Alternatively, you can also set up a project from scratch with just a few steps.

### Swift Package

Create a Swift package with an executable target, and add _ElementaryUI_ as a dependency.

```sh
# Initialize a package
swift package init --type executable --name MyApp

# Add dependency
swift package add-dependency https://github.com/elementary-swift/elementary-ui --from 0.1.0
swift package add-target-dependency ElementaryUI MyApp --package elementary-ui
```

Mount the application's root view in your Swift `@main` entrypoint. For _macOS_, add the platform requirement to your _Package.swift_ file:

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
      .package(url: "https://github.com/elementary-swift/elementary-ui", from: "0.1.0")
```

:::

You can run a simple build to check that the Swift part is set up correctly.

```sh
# Make sure to use the Swift SDK matching your toolchain version
swift build --swift-sdk swift-6.2.3-RELEASE_wasm
```

### Web Setup

In order to run your Swift WebAssembly executable in the browser you need an HTML page and a bit of JavaScript glue code. As most web projects will also require additional resources and assets (like CSS files, images, ...) this guide recommends [Vite](https://vite.dev/) as the web build tool.

Install Vite and the [Vite plugin for Swift WebAssembly](https://www.npmjs.com/package/@elementary-swift/vite-plugin-swift-wasm).

::: code-group

```sh [npm]
npm install -D vite @elementary-swift/vite-plugin-swift-wasm
```

```sh [pnpm]
pnpm add -D vite @elementary-swift/vite-plugin-swift-wasm
```

:::

Create a Vite config and add the plugin. Adding a TypeScript config will enable type-checking and a better code editor experience.

::: code-group

```ts [vite.config.ts]
import { defineConfig } from "vite";
import swiftWasm from "@elementary-swift/vite-plugin-swift-wasm";

export default defineConfig({
  plugins: [swiftWasm()],
});
```

```json [tsconfig.json]
{
  "compilerOptions": {
    "target": "ES2022",
    "module": "ESNext",
    "moduleResolution": "bundler",
    "lib": ["ES2022", "DOM"],
    "types": ["vite/client", "@elementary-swift/vite-plugin-swift-wasm/client"],
    "isolatedModules": true,
    "strict": true,
    "noEmit": true
  }
}
```

:::

The `elementary-ui` Swift package comes bundled with a _BrowserRuntime_ JavaScript module that
contains all the glue code you need to run a WebAssembly application.

Currently, this includes the [JavaScriptKit Runtime](https://github.com/swiftwasm/JavaScriptKit) and a minimal
configuration of the [Browser WASI Shim](https://github.com/bjorn3/browser_wasi_shim). However, this may be extended in the future to contain additional bridging code for _ElementaryUI_ features.

::: code-group

```sh [npm]
swift package resolve
npm install @bjorn3/browser_wasi_shim@~0.4 ./.build/checkouts/elementary-ui/BrowserRuntime
```

```sh [pnpm]
swift package resolve
pnpm add @bjorn3/browser_wasi_shim@~0.4 ./.build/checkouts/elementary-ui/BrowserRuntime
```

:::

Finally, add an `index.html` file and a few lines of TypeScript code that run the WebAssembly application.

::: code-group

```html [index.html]
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>MyApp</title>
  </head>
  <body>
    <!-- [!code highlight] -->
    <script type="module" src="./index.ts"></script>
  </body>
</html>
```

```ts [index.ts]
import { runApplication } from "elementary-ui-browser-runtime";
import appInit from "virtual:swift-wasm?init";

await runApplication(appInit);
```

:::

You can now use Vite to run a _dev server_ that watches your Swift source files and automatically hot-rebuilds your application. Use `vite build` to create a deployment bundle and see the [Vite Plugin README](https://github.com/elementary-swift/vite-plugin-swift-wasm) for more configuration options.

::: code-group

```sh [npm]
npx vite --open
```

```sh [pnpm]
pnpm vite --open
```

:::
