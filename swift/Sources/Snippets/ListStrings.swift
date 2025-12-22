import ElementaryUI

@View
struct ListStrings {
    // #region snippet
    @State var items = [String]()
    @State var next = 1

    var body: some View {
        button { "Add" }
            .onClick {
                items.insert("Item \(next)", at: 0)
                next += 1
            }

        ul {
            ForEach(items.enumerated(), key: { $0.element }) { item in
                li { item.element }
                    .onClick {
                        items.remove(at: item.offset)
                    }

            }
        }
    }
    // #endregion snippet
}

extension ListStrings: SnippetContentView {
    static var file: SnippetFile { "ListStrings" }
}
