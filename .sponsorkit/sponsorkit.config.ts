import { defineConfig, tierPresets } from "sponsorkit";

export default defineConfig({
  github: {
    login: "sliemeobn",
    type: "user",
  },
  opencollective: {
    slug: "elementaryui",
  },
  outputDir: "../public/sponsors",
  tiers: [
    {
      title: "Sponsors",
      monthlyDollars: 200,
      preset: tierPresets.xl,
      padding: { bottom: 40 },
    },
    {
      title: "Pioneers",
      monthlyDollars: 50,
      preset: tierPresets.medium,
    },
    {
      title: "Backers",
      monthlyDollars: 30,
      preset: tierPresets.small,
    },
    {
      preset: tierPresets.xs,
      padding: { top: 0 },
    },
  ],
  formats: ["svg"],
  renderer: "tiers",
  renders: [
    {
      name: "sponsors-400",
      width: 400,
    },
    {
      name: "sponsors-600",
      width: 600,
    },
    {
      name: "sponsors-800",
      width: 800,
    },
  ],
});
