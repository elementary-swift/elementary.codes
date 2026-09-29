import ElementaryUI

@View
struct TriggeredPhaseAnimatorView {
    // #region snippet
    enum Phase: CaseIterable {
        case initial, raise, left, right, settle

        var yOffset: Double { self == .initial ? 0 : -10 }

        var xOffset: Double {
            switch self {
            case .left: -3
            case .right: 3
            default: 0
            }
        }

        var animation: Animation {
            switch self {
            case .raise, .initial: .easeInOut(duration: 0.2)
            default: .bouncy(duration: 0.1)
            }
        }
    }

    @State var likeCount = 1

    var body: some View {
        p { String(repeating: "❤️", count: likeCount) }
            .phaseAnimator(Phase.allCases, trigger: likeCount) { content, phase in
                content.offset(x: phase.xOffset, y: phase.yOffset)
            } animation: { phase in
                phase.animation
            }
            .onClick { likeCount += 1 }
    }
    // #endregion snippet
}

extension TriggeredPhaseAnimatorView: SnippetContentView {
    static var file: SnippetFile { "TriggeredPhaseAnimatorView" }
}
