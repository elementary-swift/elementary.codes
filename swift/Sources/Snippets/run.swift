import ElementaryUI
import JavaScriptKit
import Reactivity

@main
struct Run {
  static func main() {
    registerComponent(
      name: "elementary-snippet",
      view: SnippetContainerView(), attributes: ["file"]
    )
  }
}

@View
struct SnippetContainerView {
  @Environment(HostAttributes.self) var attributes

  var file: SnippetFile? {
    attributes.getAttribute(name: "file")
      .map(SnippetFile.init)
  }

  var body: some View {
    switch file {
    case LoveCounter.file:
      LoveCounter()
    case TinyCounter.file:
      TinyCounter()
    case IfView.file:
      IfView()
    case ListStrings.file:
      ListStrings()
    case ReactiveCounter.file:
      ReactiveCounterView()
    case BindingCounterButton.file:
      BindingCounterButton()
    case MouseTracker.file:
      MouseTracker()
    default:
      "Unknown snippet \(file?.value ?? "<none>")"
    }
  }
}

protocol SnippetContentView {
  static var file: SnippetFile { get }
}

struct SnippetFile: Equatable, ExpressibleByStringLiteral {
  var value: String

  init(stringLiteral value: String) {
    self.value = value
  }

  static func == (lhs: SnippetFile, rhs: SnippetFile) -> Bool {
    lhs.value.utf8.elementsEqual(rhs.value.utf8)
  }
}
