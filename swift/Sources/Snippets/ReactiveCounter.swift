import ElementaryUI
import Reactivity

// #region snippet
@Reactive
final class CounterModel {
    private var count = 0

    var label: String { "Count: \(count)" }

    func increment() {
        count += 1
    }

    func reset() {
        count = 0
    }
}

@View
struct ReactiveCounter {
    var model: CounterModel

    var body: some View {
        button { model.label }
            .onClick { model.increment() }
        button { "Reset" }
            .onClick { model.reset() }
    }
}
// #endregion snippet

@View
struct ReactiveCounterView {
    @State var model = CounterModel()

    var body: some View {
        ReactiveCounter(model: model)
    }
}

extension ReactiveCounter: SnippetContentView {
    static var file: SnippetFile { "ReactiveCounter" }
}
