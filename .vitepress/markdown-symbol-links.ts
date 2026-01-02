import type MarkdownIt from "markdown-it";

export default function markdownSymbolLinks(md: MarkdownIt) {
  const defaultRender =
    md.renderer.rules.code_inline ||
    function (tokens, idx, options, env, self) {
      return self.renderToken(tokens, idx, options);
    };

  md.renderer.rules.code_inline = (tokens, idx, options, env, self) => {
    const token = tokens[idx];
    const content = token.content;

    let url: string | null = null;
    let displayContent = content;

    const prefixes = [
      { prefix: "ElementaryUI.", module: "elementaryui" },
      { prefix: "Reactivity.", module: "reactivity" },
    ];

    for (const { prefix, module } of prefixes) {
      if (content.startsWith(prefix)) {
        const fullSymbol = content.substring(prefix.length);
        const components = fullSymbol.split(".");

        // Display only the last part (e.g., mount(in:) from Application.mount(in:))
        displayContent = components[components.length - 1];

        const urlPath = components
          .map((part) => {
            let p = part.toLowerCase();
            let hasParens = part.endsWith(")");
            if (part.startsWith("@") || part.startsWith("#")) {
              p = p.substring(1);

              if (!p.endsWith(")")) {
                p = p + "()";
              }
            }
            return p;
          })
          .join("/");

        url = `https://swiftpackageindex.com/elementary-swift/elementary-ui/documentation/${module}/${urlPath}`;
        break;
      }
    }

    if (url) {
      return `<a href="${url}" target="_blank" rel="noopener noreferrer"><code>${displayContent}</code></a>`;
    }

    return defaultRender(tokens, idx, options, env, self);
  };
}
