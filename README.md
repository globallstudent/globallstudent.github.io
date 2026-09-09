# globallstudent.github.io

Personal resume site for Asliddin Abdumannonov — Backend Engineer (Python · Go).

| URL | Contents |
|---|---|
| `/` | Full resume, including email, phone and Telegram |
| `/hire` | Identical resume **without personal contact details** |
| `/asliddin_abdumannonov_resume.pdf` | A4 PDF, rendered from `/` |

## Why two versions

Freelance platforms (Upwork among them) prohibit sharing contact information
before a contract starts, and scan profiles and proposals for it. `/hire` is the
version that is safe to link from those platforms. Employer websites are kept on
both pages — they are references, not contact channels.

## Editing

All resume content lives in **`_body.html`** (everything below the name header).
Both pages and the PDF are generated from it:

```sh
./build.sh
```

That rewrites `index.html` and `hire/index.html`, then re-renders the PDF with
headless Chrome. Never edit the generated HTML directly — it will be overwritten.

Name and contact details live in the two header blocks inside `build.sh`.
Styling is in `style.css`; the `@media print` block at the bottom restores the
exact A4 layout, so the PDF stays identical no matter how the screen view changes.
