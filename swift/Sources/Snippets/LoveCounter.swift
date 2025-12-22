import ElementaryUI

// #region snippet
@View
struct LoveCounter {
    @State var count = 1

    var body: some View {
        p { String(repeating: "❤️", count: count) }

        if count < 10 {
            button { "More Love" }
                .onClick { count += 1 }
        } else {
            p { "Enough love for you!" }
            button { "Less Love" }
                .onClick { count = 1 }
        }
    }
}
// #endregion snippet

extension LoveCounter: SnippetContentView {
    static var file: SnippetFile { "LoveCounter" }
}
