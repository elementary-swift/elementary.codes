if (!import.meta.env.SSR) {
  import("virtual:swift-wasm?js").then(i => i.init());
}
