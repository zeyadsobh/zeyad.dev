# zeyad.dev

Source for [zeyad.dev](https://zeyad.dev), built with Astro and deployed to GitHub Pages.

```sh
npm install
npm run dev
```

The resume lives in `resume/resume.yml`. It feeds the `/resume/` page and, through `resume/resume.typ`, the PDF at `/zeyad-sobh-resume.pdf`. Building needs [Typst](https://typst.app) (`winget install Typst.Typst`); the Latin Modern fonts are bundled in `resume/fonts`.
