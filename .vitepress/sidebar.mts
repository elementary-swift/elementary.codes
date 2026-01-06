import { DefaultTheme } from "vitepress";

export default {
  "/guide/": [
    {
      items: [
        { text: "Introduction", link: "/guide/introduction" },
        { text: "Get Started", link: "/guide/get-started" },
        {
          text: "Essentials",
          collapsed: false,
          base: "/guide/essentials/",
          items: [
            { text: "Views", link: "views" },
            { text: "Application", link: "application" },
            { text: "State and Reactivity", link: "state-and-reactivity" },
            { text: "Conditional Rendering", link: "conditional-rendering" },
            { text: "List Rendering", link: "list-rendering" },
            { text: "Environment", link: "environment" },
            { text: "Lifecycle Events", link: "lifecycle-events" },
          ],
        },
        {
          text: "DOM Interaction",
          collapsed: false,
          base: "/guide/dom-interaction/",
          items: [
            { text: "HTML Elements", link: "html-elements" },
            { text: "Input Bindings", link: "input-bindings" },
            { text: "Handling Events", link: "handling-events" },
          ],
        },
        {
          text: "Animation",
          collapsed: false,
          base: "/guide/animation/",
          items: [
            {
              text: "Transactions and Animations",
              link: "transactions-and-animations",
            },
            { text: "Animatable Modifiers", link: "animatable-modifiers" },
            { text: "Transitions", link: "transitions" },
            { text: "Animate Layout and CSS", link: "animate-layout-and-css" },
            { text: "Custom Animations", link: "custom-animations" },
          ],
        },
        {
          text: "API Reference",
          link: "https://swiftpackageindex.com/elementary-swift/elementary-ui/documentation",
        },
      ],
    },
  ],
} satisfies DefaultTheme.Sidebar;
