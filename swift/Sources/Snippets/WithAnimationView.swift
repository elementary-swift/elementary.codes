import ElementaryUI

@View
struct WithAnimationView {
    // #region snippet
    @State var isOffset = false

    var body: some View {
        div {
            p { "🚀" }
                .offset(x: isOffset ? 190.0 : 0.0)
        }

        button { "Default" }
            .onClick {
                withAnimation {  // [!code highlight]
                    isOffset.toggle()
                }
            }

        button { "Bouncy" }
            .onClick {
                withAnimation(.bouncy.speed(0.5)) {  // [!code highlight]
                    isOffset.toggle()
                }
            }
    }
    // #endregion snippet
}

extension WithAnimationView: SnippetContentView {
    static var file: SnippetFile { "WithAnimationView" }
}
