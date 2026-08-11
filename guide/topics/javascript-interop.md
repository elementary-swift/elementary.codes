# JavaScript Interop

ElementaryUI interfaces with JavaScript using the [JavaScriptKit](https://swiftpackageindex.com/swiftwasm/JavaScriptKit/main/documentation/javascriptkit) package. JavaScriptKit can be used to access JavaScript objects and functions at runtime, convert between Swift and JavaScript data types, and bridge JavaScript Promises and Swift's structured concurrency.

## JSObject

`JSObject` represents a JavaScript object in Swift. It supports dynamic member lookup, so accesses like `object.foo` will dynamically request the corresponding JavaScript member `foo` on the object. You can use `JSObject.global` as an entry point for web APIs.

```swift
let console = JSObject.global.console.object!
let document = JSObject.global.document.object!
let window = JSObject.global.window.object!
```

To construct new JavaScript objects, `JSObject` provides a specialized `new` call to call the associated constructor.

```swift
// Create a new URLSearchParams instance
let URLSearchParams = JSObject.global.URLSearchParams.object!
let params = URLSearchParams.new(window.location.search)
```

This type also supports `callAsFunction` in Swift, allowing you to call JavaScript functions in a similar manner.

```swift
// Find the `?language=` query parameter for the page
let query = params.get?("language")
```

## JSValue

`JSValue` represents a single value in JavaScript. It can be used to convert values from Swift to JavaScript. 

```swift
// Extract the JavaScript value
let languageJS: JSValue = query?.jsValue
// Convert the query into a Swift String
let language: String? = query?.jsValue.string
```

Types conforming to `ConvertibleToJSValue` and `ConstructibleFromJSValue` can be converted to and from their corresponding JavaScript type. Most standard Swift types conform to `ConvertibleToJSValue` and `ConstructibleFromJSValue`. The [JavaScriptKit Documentation](https://swiftpackageindex.com/swiftwasm/javascriptkit/main/documentation/javascriptkit/javascript-interop-cheat-sheet#Convert-Between-Swift-and-JavaScript) has a detailed map of each Swift and JavaScript type conversion.

## JSClosure

This type represents a JavaScript closure whose function is written in Swift. It can be passed as a callback handler to JavaScript functions. 

```swift
let button = document.createElement!("button").object!
let handler = JSClosure { args in
    console.log!("Clicked", args[0])
    return .undefined
}
button.addEventListener!("click", handler)
```

For async closures, use the `JSClosure.async` static method to bridge the async Swift function to a JavaScript promise.

```swift
let asyncHandler = JSClosure.async { _ async throws(JSException) -> JSValue in
    try! await Task.sleep(nanoseconds: 1_000_000)
    console.log!("Async closure finished")
    return .undefined
}
```

## Example

A short example calling `setTimeout` in ElementaryUI to build a game to determine how fast you can click.

<<< @/swift/Sources/Snippets/ClickRace.swift#snippet

<elementary-snippet file="ClickRace" />