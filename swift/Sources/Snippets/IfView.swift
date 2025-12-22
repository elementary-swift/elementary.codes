import ElementaryUI

// #region snippet
@View
struct IfView {
    @State var shouldShow = false

    var body: some View {
        button { "Toggle" }
            .onClick { shouldShow.toggle() }

        if shouldShow {
            span { " Hello, world!" }
        }
    }
}
// #endregion snippet

extension IfView: SnippetContentView {
    static var file: SnippetFile { "IfView" }
}
