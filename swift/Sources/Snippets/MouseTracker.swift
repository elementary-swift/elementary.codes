import ElementaryUI

@View
struct MouseTracker: SnippetContentView {
    static let file: SnippetFile = "MouseTracker"
    // #region snippet
    @State var x = 0.0
    @State var y = 0.0

    var body: some View {
        div {
            p { "Move your mouse over this area" }
            p { "X: \(x), Y: \(y)" }
        }
        .onMouseMove { event in
            x = event.offsetX
            y = event.offsetY
        }
    }
    // #endregion snippet
}
