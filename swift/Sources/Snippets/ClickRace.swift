import ElementaryUI
import JavaScriptKit

@View
struct ClickRace: SnippetContentView {
    static let file: SnippetFile = "ClickRace"
    // #region snippet
    @State var clicks: Int?
    @State var lastCount: Int?
    @State var startTimerValue: JSValue?

    var body: some View {
        div {
            p { "How fast can you click?" }
            button { clicks == nil ? "Start!" : "Click!" }
                .onClick { clicked() }
            div {
                if let clicks {
                    p { "Clicks: \(clicks)" }
                }
                if let lastCount {
                    p { "Your Record: \(Double(lastCount) / 3.0) clicks per second" }
                }
            }
        }
    }

    func clicked() {
        clicks = (clicks ?? 0) + 1
        guard startTimerValue == nil else { return }

        let callback = JSClosure { _ -> JSValue in
            if clicks ?? 0 > lastCount ?? 0 {
                lastCount = clicks
            }
            clicks = nil
            startTimerValue = nil
            return .undefined
        }

        startTimerValue = JSObject.global.setTimeout!(callback, 3000)
    }
    // #endregion snippet
}
