# Web Components

ElementaryUI views can be registered as browser [custom elements](https://developer.mozilla.org/en-US/docs/Web/API/Web_components/Using_custom_elements), making them available as HTML tags on any page. Each element has its own view instance, state, and lifecycle. This supports interactive components in server-rendered pages and integration with other frontend frameworks.

The `ElementaryWebComponents` module provides this functionality. Add its product to your Swift target alongside `ElementaryUI`:

```swift
dependencies: [
    .product(name: "ElementaryUI", package: "elementary-ui"),
    .product(name: "ElementaryWebComponents", package: "elementary-ui"),
],
```

## Defining and registering elements

`ElementaryWebComponents.@CustomElement` defines a custom element with a view body. It includes the behavior of `@View`, including composition, `@State`, and event handlers. `ElementaryWebComponents.Attribute` exposes typed properties through HTML attributes.

<<< @/swift/Sources/Snippets/WonkyLabel.swift#snippet

Register the type from your application's entry point with `ElementaryWebComponents.CustomElements.define(_:_:shadow:)`:

```swift
import ElementaryWebComponents

try CustomElements.define("wonky-label", WonkyLabel.self, shadow: .open)
```

The tag name must be a valid custom element name, including a hyphen. The Swift type must support initialization without arguments.

Here, `shadow: .open` mounts the view inside an open [Shadow DOM](https://developer.mozilla.org/en-US/docs/Web/API/Web_components/Using_shadow_DOM) root, isolating its internal markup and styles from the page.

```html
<wonky-label wobble="30">Look, Mom, so wonky!</wonky-label>
```

<wonky-label wobble="30">Look, Mom, so wonky!</wonky-label>

Once the Swift application loads and registers the element, matching tags mount and unmount automatically, including those already on the page. No explicit `Application.mount(in:)` call is needed.

## Typed attributes

`@Attribute` properties react to changes in the host's HTML attributes. Swift property names become lowercase kebab case: `stepSize` maps to `step-size`. An explicit name overrides this mapping:

```swift
@Attribute("step-size") var step = 1
@Attribute var label: String?
```

Non-optional properties require a default value; optional properties default to `nil`. Removing an attribute restores its initial Swift value. Invalid values leave the current value unchanged and log a warning.

Changes from HTML or JavaScript update the view:

```js
document.querySelector("wonky-label").setAttribute("wobble", "20");
```

Supported types include strings, integers, floating-point numbers, booleans, and optionals. Booleans use the strings `"true"` and `"false"`, rather than attribute presence. Custom types can adopt `ElementaryWebComponents.ExpressibleByAttributeValue`; string-backed enums receive decoding automatically:

```swift
enum Theme: String, ExpressibleByAttributeValue {
    case system
    case light
    case dark
}
```

## Shadow DOM and styling

With `shadow: .open`, the component's content is rendered in a shadow root. Slots place host-provided content within that view; named slots match a `slot(.name("label"))` to a child's `slot="label"` attribute.

Page styles do not directly select elements inside the shadow root, though inherited properties and CSS custom properties can flow in from the host. For custom component stylesheets, see `ElementaryWebComponents.CustomElementStyleSheet` and `ElementaryWebComponents.CustomElements.ShadowRootOptions`.

Omitting `shadow` mounts the view directly inside the host element, after any existing children. In this mode, page styles apply normally and slots do not distribute content.

## Lifecycle

The view mounts when its host connects to the document and unmounts when it disconnects. The usual [lifecycle modifiers](../essentials/lifecycle-events.md) apply. Removing and reinserting the element recreates its view and resets its state.

For the full API, see [ElementaryWebComponents](https://swiftpackageindex.com/elementary-swift/elementary-ui/documentation/elementarywebcomponents).
