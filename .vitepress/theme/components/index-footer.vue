<template>
  <footer id="footer">
    <div class="container">
      <div class="footer-col" v-for="section in sections">
        <h4>{{ section.text }}</h4>
        <ul>
          <li v-for="item in section.items">
            <VPLink :href="item.link">{{ item.text }}</VPLink>
          </li>
        </ul>
      </div>
    </div>
  </footer>
</template>

<script setup lang="ts">
import { VPLink } from "vitepress/theme";

const sections = [
  {
    text: "Support",
    items: [
      {
        text: "GitHub Sponsors",
        link: "https://github.com/sponsors/sliemeobn",
      },
      {
        text: "Open Collective",
        link: "https://opencollective.com/elementaryui",
      },
    ],
  },
  {
    text: "Participate",
    items: [
      {
        text: "GitHub",
        link: "https://github.com/elementary-swift/elementary-ui",
      },
      {
        text: "Discord",
        link: "https://discord.com/channels/780838335798706197/1449031857961435136",
      },
    ],
  },
  {
    text: "About",
    items: [{ text: "Privacy Policy", link: "/privacy" }],
  },
];
</script>

<style>
#footer {
  background: var(--vp-c-bg-soft);
}

#footer .container {
  max-width: 900px;
  margin: 0 auto;
  columns: 1;
  padding: 24px 32px;
}

@media (min-width: 768px) {
  #footer .container {
    columns: 2;
  }
}

@media (min-width: 1024px) {
  #footer .container {
    columns: 3;
  }
}

#footer h4 {
  font-weight: 500;
  color: var(--vp-c-text-1);
  margin-bottom: 0.25em;
}

.footer-col {
  margin-bottom: 2em;
  break-inside: avoid;
}

#footer .VPLink {
  font-size: 0.9em;
  color: var(--vp-c-text-2);
}

#footer .VPLink:hover {
  color: var(--vp-c-brand-1);
}
</style>
