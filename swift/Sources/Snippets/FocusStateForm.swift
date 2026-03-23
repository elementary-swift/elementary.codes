import ElementaryUI

@View
struct FocusStateForm {
    // #region snippet
    enum Field: Hashable {
        case name
        case email
    }

    @FocusState var focusedField: Field?

    var body: some View {
        p { "Focused: \(focusedField, default: "-")" }

        input(.type(.text), .placeholder("Your name"))
            .focused($focusedField, equals: .name)

        input(.type(.text), .placeholder("you@example.com"))
            .focused($focusedField, equals: .email)

        br()

        button { "Focus name" }.onClick { focusedField = .name }
    }
    // #endregion snippet
}

extension FocusStateForm: SnippetContentView {
    static var file: SnippetFile { "FocusStateForm" }
}

extension FocusStateForm.Field: CustomStringConvertible {
    public var description: String {
        switch self {
        case .name:
            return "name"
        case .email:
            return "email"
        }
    }
}
