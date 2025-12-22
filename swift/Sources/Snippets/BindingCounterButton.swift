import ElementaryUI

// #region snippet
@View
struct BindingCounterButton {
    @State var count = 0

    var body: some View {
        CounterButton(prefix: "Pirates:", count: $count)  // [!code highlight]
    }
}

@View
struct CounterButton {
    var prefix: String
    @Binding var count: Int  // [!code highlight]

    var body: some View {
        button { "\(prefix) \(count)" }
            .onClick { count += 1 }
    }
}
// #endregion snippet

extension BindingCounterButton: SnippetContentView {
    static var file: SnippetFile { "BindingCounterButton" }
}
