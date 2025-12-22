import { installCustomElementHook } from "./elementary-components";

// TODO: move to elementary-ui-browser-runtime
installCustomElementHook();

if (!import.meta.env.SSR) {
  void (async () => {
    const [{ runApplication }, { default: swiftSnippets }] = await Promise.all([
      import("elementary-ui-browser-runtime"),
      import("virtual:swift-wasm?init"),
    ]);
    runApplication(swiftSnippets);
  })();
}
