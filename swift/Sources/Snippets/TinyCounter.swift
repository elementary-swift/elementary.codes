import ElementaryUI

// #region snippet
@View
struct TinyCounter {
    @State var count = 1

    var body: some View {
        button { "Count: \(count)" }
            .onClick { count += 1 }
    }
}
// #endregion snippet

extension TinyCounter: SnippetContentView {
    static var file: SnippetFile { "TinyCounter" }
}
