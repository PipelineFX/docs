// @ts-check
// `@type` JSDoc annotations allow editor autocompletion and type checking
// (when paired with `@ts-check`).
// There are various equivalent ways to declare your Docusaurus config.
// See: https://docusaurus.io/docs/api/docusaurus-config

import {themes as prismThemes} from 'prism-react-renderer';

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: 'PipelineFX\'s Qube! Documentation',
  tagline: '',
  favicon: 'img/favicon-128-128.png',

  // Set the production url of your site here
  url: 'https://pipelinefx.github.io',
  // Set the /<baseUrl>/ pathname under which your site is served
  // For GitHub pages deployment, it is often '/<projectName>/'
  baseUrl: '/docs/',

  // GitHub pages deployment config.
  // If you aren't using GitHub pages, you don't need these.
  organizationName: 'pipelinefx.github.io', // Usually your GitHub org/user name.
  projectName: 'docs', // Usually your repo name.

  onBrokenLinks: 'warn',
  onBrokenMarkdownLinks: 'warn',

  trailingSlash: false,

  // Even if you don't use internationalization, you can use this field to set
  // useful metadata like html lang. For example, if your site is Chinese, you
  // may want to replace "en" with "zh-Hans".
  i18n: {
    defaultLocale: 'en',
    locales: ['en'],
  },

  plugins: [
    [
      require.resolve('@cmfcmf/docusaurus-search-local'),
      {
        indexDocs: true,
        indexBlog: false,
      },
    ],
  ],

  presets: [
    [
      'classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
		  routeBasePath: '/', // Serve the docs at the site's root
		  sidebarPath: require.resolve('./sidebars.js'),
          //lastVersion: 'current', // Make the latest version act as "current"
          //onlyIncludeVersions: ['current','8.0.0'], // Explicitly list versions
          onlyIncludeVersions: ['8.0.0'], // Explicitly list versions
        },
        blog: false,
        theme: {
          customCss: './src/css/custom.css',
        },
      }),
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      navbar: {
        title: 'PipelineFX Documentation',
        logo: {
          alt: 'My Site Logo',
          src: 'img/QubeLogo.png',
        },
        items: [
          {
            type: 'docSidebar',
            sidebarId: 'starthereSidebar',
            position: 'left',
            label: 'Qube!',
          },
          {
            href: 'https://github.com/PipelineFX/docs',
            label: 'GitHub',
            position: 'right',
          },
          {
            type: 'docsVersionDropdown',
            position: 'right',
          },
        ],
      },
      footer: {
        style: 'dark',
        links: [
          {
            items: [
              {
                label: 'GitHub',
                href: 'https://github.com/PipelineFX/docs',
              },
            ],
          },
        ],
        copyright: `Copyright (c) ${new Date().getFullYear()} PipelineFX LLC, Inc. Built with Docusaurus 3.7.0.`,
      },
      prism: {
		additionalLanguages: ['perl','sql','bash'],
        theme: prismThemes.github,
        darkTheme: prismThemes.dracula,
      },
    }),
};

export default config;

