import ElementaryUI

@View
struct ContinuousPhaseAnimatorView {
    // #region snippet
    var body: some View {
        PhaseAnimator([false, true]) { highlighted in
            p { "💜" }
                .opacity(highlighted ? 1 : 0.4)
        } animation: { _ in
            .easeInOut(duration: 0.8)
        }
    }
    // #endregion snippet
}

extension ContinuousPhaseAnimatorView: SnippetContentView {
    static var file: SnippetFile { "ContinuousPhaseAnimatorView" }
}
