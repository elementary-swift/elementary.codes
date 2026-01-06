import ElementaryUI

@View
struct AnimateLayoutView {
    // #region snippet
    @State var items: [Int] = []
    @State var next = 1

    func addItem() {
        items.append(next)
        next += 1
    }

    var body: some View {
        button { "Add" }
            .onClick { addItem() }

        button { "Shuffle" }
            .onClick { items.shuffle() }

        ul {
            ForEach(items.enumerated(), key: { "\($0.element)" }) { (index, item) in
                li { "Item \(item)" }
                    .onClick { items.remove(at: index) }
            }
        }
        .animateContainerLayout()  // [!code highlight]
        .animation(.snappy, value: items)  // [!code highlight]
    }
    // #endregion snippet
}

extension AnimateLayoutView: SnippetContentView {
    static var file: SnippetFile { "AnimateLayoutView" }
}
