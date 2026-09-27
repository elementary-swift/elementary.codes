// #region snippet
import ElementaryUI
import ElementaryWebComponents

@CustomElement
struct WonkyLabel {
    @Attribute var wobble = 0.0

    @State var yOffset = 0.0

    let xWobble = [0.0, 1, 0.4, 2]

    var body: some View {
        div { slot() }
            .offset(y: yOffset * wobble)
            .onClick {
                withAnimation {
                    yOffset = .random(in: -0.5...0.5)
                }
            }
            .phaseAnimator(xWobble) { content, phase in
                content.offset(x: phase * wobble)
            } animation: { _ in
                .bouncy
            }
    }
}
// #endregion snippet
