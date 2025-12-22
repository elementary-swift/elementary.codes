// TODO: move this to ElementaryUI package once components support stabilizes

export function installCustomElementHook() {
  const bridgeKey = Symbol.for("elementary-ui.bridge");
  if (!(globalThis as any)[bridgeKey]) {
    (globalThis as any)[bridgeKey] = {
      defineCustomElement,
    };
  }
}

type CustomElementImplementation = {
  observedAttributes: string[];
  onConstruct: (element: HTMLElement) => void;
  onDestruct: (element: HTMLElement) => void;
  onConnected: (element: HTMLElement) => void;
  onDisconnected: (element: HTMLElement) => void;
  onConnectedMove: (element: HTMLElement) => void;
  onAttributeChanged: (
    element: HTMLElement,
    name: string,
    oldValue: string | null,
    newValue: string | null
  ) => void;
};

function defineCustomElement(
  name: string,
  implementation: CustomElementImplementation
) {
  const existing = customElements.get(name);
  if (import.meta.hot) {
    if (existing) {
      console.info(
        `Elementary HMR: Component ${name} already defined, replacing implementation`
      );

      const oldImplementation = (existing as any)._implementation;

      // Find all existing instances of this element
      const instances = document.querySelectorAll(name);

      // Clean up old implementation for each instance
      instances.forEach((element) => {
        if (element instanceof HTMLElement) {
          oldImplementation.onDestruct(element);
        }
      });
      // Replace the implementation on the prototype
      existing.prototype._implementation = implementation;

      // Re-initialize with new implementation
      instances.forEach((element) => {
        if (element instanceof HTMLElement) {
          implementation.onConstruct(element);
        }
      });

      return;
    }
  }
  customElements.define(name, makeComponent(implementation));
}

function makeComponent(implementation: CustomElementImplementation) {
  return class NewElement extends HTMLElement {
    static _implementation = implementation;
    static get observedAttributes() {
      return implementation.observedAttributes;
    }

    constructor() {
      super();
      implementation.onConstruct(this);
    }

    destructor() {}

    connectedCallback() {
      NewElement._implementation.onConnected(this);
    }

    disconnectedCallback() {
      NewElement._implementation.onDisconnected(this);
    }

    connectedCallbackMove() {
      NewElement._implementation.onConnectedMove(this);
    }

    attributeChangedCallback(
      name: string,
      oldValue: string | null,
      newValue: string | null
    ) {
      NewElement._implementation.onAttributeChanged(
        this,
        name,
        oldValue,
        newValue
      );
    }
  };
}
