import ElementaryUI
import JavaScriptKit
import Reactivity

let instanceId = Int.random(in: 0...Int.max)

func registerComponent<V: View>(
    name: String,
    view: V,
    attributes: [String] = []
) {
    let bridge = JSObject.global[JSSymbol.for(key: "elementary-ui.bridge")].object!
    let defineCustomElement = bridge.defineCustomElement.function!

    let element = CustomElementClass(attributes: attributes, view: view)

    _ = defineCustomElement(name.jsValue, element.jsBridge())
}

/// Holds mounted state for a custom element instance
final class MountedElement<V: View> {
    let view: V
    var mountedApplication: MountedApplication?
    let attributes: HostAttributes

    init(view: V) {
        self.view = view
        self.attributes = HostAttributes()
    }
}

/// Pure Swift representation of a custom element class
final class CustomElementClass<V: View> {
    let observerAttributes: [String]
    let view: V

    private var mountedElements: [Int: MountedElement<V>] = [:]
    private var nextElementId = 0

    init(attributes: [String], view: V) {
        self.observerAttributes = attributes
        self.view = view
    }

    func onConstruct(element: JSObject) {
        // Create and store mounted state
        let mounted = MountedElement(view: view)
        nextElementId += 1
        element.__elementId = nextElementId
        mountedElements[nextElementId] = mounted
    }

    func onConnected(element: JSObject) {
        guard let elementId = element.__elementId,
            let mounted = mountedElements[elementId]
        else {
            fatalError("onConnected: element not found")
        }

        mounted.mountedApplication = Application(
            mounted.view.environment(mounted.attributes)
        )
        ._mount(in: element)
    }

    func onDisconnected(element: JSObject) {
        guard let elementId = element.__elementId,
            let mounted = mountedElements[elementId]
        else {
            fatalError("onDisconnected: element not found")
        }

        mounted.mountedApplication.take()?.unmount()
    }

    func onAttributeChanged(element: JSObject, name: String, oldValue: String?, newValue: String?) {
        guard let elementId = element.__elementId,
            let mounted = mountedElements[elementId]
        else {
            fatalError("onAttributeChanged: element not found")
        }

        mounted.attributes.setAttribute(name: name, value: newValue)
    }

    func onDestruct(element: JSObject) {
        guard let elementId = element.__elementId else {
            fatalError("onDestruct: element not found")
        }

        mountedElements.removeValue(forKey: elementId)
    }
}

extension CustomElementClass {
    func jsBridge() -> JSObject {
        [
            "observedAttributes": observerAttributes.jsValue,
            "onConstruct": JSClosure { args in
                guard args.count == 1, let element = args[0].object else {
                    print("Error: Invalid arguments for component factory")
                    return .undefined
                }
                self.onConstruct(element: element)
                return .undefined
            }.jsValue,
            "onConnected": JSClosure { args in
                guard args.count == 1, let element = args[0].object else {
                    print("Error: Invalid arguments for component factory")
                    return .undefined
                }
                self.onConnected(element: element)
                return .undefined
            }.jsValue,
            "onDisconnected": JSClosure { args in
                guard args.count == 1, let element = args[0].object else {
                    print("Error: Invalid arguments for component factory")
                    return .undefined
                }
                self.onDisconnected(element: element)
                return .undefined
            }.jsValue,
            "onAttributeChanged": JSClosure { args in
                guard args.count == 4, let element = args[0].object, let name = args[1].string
                else {
                    print("Error: Invalid arguments for component factory")
                    return .undefined
                }
                let oldValue = args[2].string
                let newValue = args[3].string

                self.onAttributeChanged(
                    element: element, name: name, oldValue: oldValue, newValue: newValue)
                return .undefined
            }.jsValue,
            "onDestruct": JSClosure { args in
                guard args.count == 1, let element = args[0].object else {
                    print("Error: Invalid arguments for component factory")
                    return .undefined
                }
                self.onDestruct(element: element)
                return .undefined
            }.jsValue,
        ]
    }
}

@Reactive
final class HostAttributes {
    @ReactiveIgnored var _attributes: [PropertyID: String?] = [:]

    init() {}

    func getAttribute(name: String) -> String? {
        self._$reactivity.access(PropertyID(name))
        return _attributes[PropertyID(name)] ?? nil
    }

    func setAttribute(name: String, value: String?) {
        self._$reactivity.willSet(PropertyID(name))
        self._attributes[PropertyID(name)] = value
        self._$reactivity.didSet(PropertyID(name))
    }
}

extension JSObject {
    fileprivate var __elementId: Int? {
        get {
            return self["__elementId"].number.flatMap(Int.init)
        }
        set {
            self["__elementId"] = newValue.jsValue
        }
    }
}
