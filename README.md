# Naga Guntapalli — Portfolio Website

Source for [nagaguntapalli.github.io](https://nagaguntapalli.github.io/). This is a plain static site: no framework, build tool, database, or paid service is required.

## Main files

- `index.html` — page content, links, and section order
- `styles.css` — colors, typography, spacing, layout, and mobile design
- `script.js` — mobile navigation, project filters, and current year

## Edit on GitHub

1. Open the file to change.
2. Click the pencil icon.
3. Edit the text.
4. Select **Commit changes**.
5. GitHub Pages republishes automatically.

## Edit with VS Code

```bash
git clone https://github.com/NagaGuntapalli/NagaGuntapalli.github.io.git
cd NagaGuntapalli.github.io
code .
```

After editing:

```bash
git add index.html styles.css script.js README.md
git commit -m "Update portfolio"
git push
```

Preview locally with `python -m http.server 8000`, then visit `http://localhost:8000`.

## Important privacy checks

Never upload `.env` files, API keys, passwords, PINs, TOTP secrets, employer-owned code, confidential research data, brokerage account details, or material you do not have permission to publish.
