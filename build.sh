#!/usr/bin/env bash
# Regenerates index.html (full) and hire/index.html (contact-free) from _body.html,
# then re-renders the PDF from the full version. Run after editing _body.html.
set -euo pipefail
cd "$(dirname "$0")"

head_of() {  # $1 = path to style.css, $2 = page title, $3 = description
cat <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>$2</title>
<meta name="description" content="$3">
<meta name="author" content="Asliddin Abdumannonov">
<meta property="og:type" content="profile">
<meta property="og:title" content="$2">
<meta property="og:description" content="$3">
<link rel="icon" href="data:image/svg+xml,<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'><text y='.9em' font-size='90' font-family='Helvetica,Arial' font-weight='700' fill='%232a6496'>A</text></svg>">
<link rel="stylesheet" href="$1">
</head>
<body>
EOF
}

DESC="Backend engineer (Python, Go) — microservices, payment and banking integrations, real-time systems. Tashkent, Uzbekistan."

# ---------- index.html : full version, with contact details ----------
{
  head_of "style.css" "Asliddin Abdumannonov — Backend Engineer" "$DESC"
  cat <<'EOF'
<nav class="bar">
  <a href="asliddin_abdumannonov_resume.pdf" download>Download PDF</a>
</nav>
<main class="sheet">

<div class="header">
  <div>
    <h1>Asliddin Abdumannonov</h1>
    <div class="tagline">Backend Engineer — Python · Go | Tashkent, Uzbekistan</div>
    <div class="contact-row">
      <span><a href="mailto:asliddinabdumannonov06@gmail.com">asliddinabdumannonov06@gmail.com</a></span>
      <span>+998 94 757 75 42</span>
      <span><a href="https://t.me/asliddin_abdumannonov">t.me/asliddin_abdumannonov</a></span>
    </div>
  </div>
  <div class="contact-right">
    <a href="https://github.com/globallstudent">github.com/globallstudent</a><br>
    <a href="https://linkedin.com/in/asliddin-abdumannonov">linkedin.com/in/asliddin-abdumannonov</a>
  </div>
</div>
EOF
  cat _body.html
  printf '\n</main>\n</body>\n</html>\n'
} > index.html

# ---------- hire/index.html : no personal contact details ----------
{
  head_of "../style.css" "Asliddin Abdumannonov — Backend Engineer" "$DESC"
  cat <<'EOF'
<main class="sheet">

<div class="header">
  <div>
    <h1>Asliddin Abdumannonov</h1>
    <div class="tagline">Backend Engineer — Python · Go | Tashkent, Uzbekistan</div>
  </div>
</div>
EOF
  cat _body.html
  printf '\n</main>\n</body>\n</html>\n'
} > hire/index.html

echo "built index.html + hire/index.html"

# ---------- PDF ----------
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
if [ -x "$CHROME" ]; then
  "$CHROME" --headless --disable-gpu --no-pdf-header-footer \
    --print-to-pdf="$PWD/asliddin_abdumannonov_resume.pdf" \
    "file://$PWD/index.html" 2>/dev/null
  echo "rendered asliddin_abdumannonov_resume.pdf"
else
  echo "WARN: Chrome not found, PDF not regenerated" >&2
fi
