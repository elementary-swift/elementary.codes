import ElementaryUI
import ElementaryWebComponents
import JavaScriptKit
import Reactivity

@main
struct Run {
  static func main() throws {
    try CustomElements.define("elementary-snippet", SnippetContainerView.self)
  }
}

@CustomElement
struct SnippetContainerView {
  @Attribute var file: SnippetFile?

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
    case FocusStateForm.file:
      FocusStateForm()
    case WithAnimationView.file:
      WithAnimationView()
    case AnimateLayoutView.file:
      AnimateLayoutView()
    default:
      "Unknown snippet \(file?.value ?? "<none>")"
    }
  }
}

protocol SnippetContentView {
  static var file: SnippetFile { get }
}

struct SnippetFile: Equatable, ExpressibleByStringLiteral, ExpressibleByAttributeValue {
  var value: String

  init(stringLiteral value: String) {
    self.value = value
  }

  init(attributeValue value: String) {
    self.value = value
  }

  static func == (lhs: SnippetFile, rhs: SnippetFile) -> Bool {
    lhs.value.utf8.elementsEqual(rhs.value.utf8)
  }
}
