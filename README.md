# Asliddin Abdumannonov — Resume

Source for my resume site: **https://globallstudent.github.io**

| Path | Contents |
|---|---|
| `/` | Resume, with contact details |
| `/hire` | Same resume, without contact details |
| `/asliddin_abdumannonov_resume.pdf` | A4 PDF |

## Building

All content lives in `_body.html`. Run `./build.sh` to regenerate both pages and
re-render the PDF. The generated HTML is overwritten on every build, so edit
`_body.html` rather than `index.html` or `hire/index.html`.

Styling is in `style.css`. The `@media print` block keeps the PDF on a fixed A4
layout regardless of how the screen view changes.
