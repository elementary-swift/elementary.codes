import { installCustomElementHook } from "./elementary-components";

// TODO: move to elementary-ui-browser-runtime
installCustomElementHook();

if (!import.meta.env.SSR) {
  import("virtual:swift-wasm?js").then(i => i.init());
}
