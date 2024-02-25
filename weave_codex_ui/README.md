# create-svelte

Everything you need to build a Svelte project, powered by [`create-svelte`](https://github.com/sveltejs/kit/tree/main/packages/create-svelte).

## Creating a project

If you're seeing this, you've probably already done this step. Congrats!

```bash
# create a new project in the current directory
npm create svelte@latest

# create a new project in my-app
npm create svelte@latest my-app
```

## Developing

Once you've created a project and installed dependencies with `npm install` (or `pnpm install` or `yarn`), start a development server:

```bash
npm run dev

# or start the server and open the app in a new browser tab
npm run dev -- --open
```

Formatting:

Configure VS Code to use Svelte autoformatting, by downloading `svelte.svelte-vscode` and setting `"svelte.plugin.svelte.format.enable": true`.

## Building

To create a production version of your app:

```bash
npm run build
```

You can preview the production build with `npm run preview`.

> To deploy your app, you may need to install an [adapter](https://kit.svelte.dev/docs/adapters) for your target environment.

## TODO

### Features

- [ ] basic UI scaffold
  - [ ] main page
- [ ] static assets (eg map images)
- [ ] svg regions ? for map links
- [ ] svg icons for map links
- [ ] layers/depths
- [ ] models UI / legend
- [ ] highlighted
  - [ ] opacity levels
- [ ] hidden / shown
- [ ] zoom
- [ ] select on map
- [ ] hover on map

### Hygiene, Fixes

- [ ] responsiveness?
- [ ] favicon
- [ ] set the webpage title
- [ ] linting
- [ ] tests
- [ ] README

### Deployment

- [ ] build process
- [ ] set up deployment via GH actions (https://kit.svelte.dev/docs/adapter-static & https://docs.github.com/en/pages/getting-started-with-github-pages/about-github-pages)
