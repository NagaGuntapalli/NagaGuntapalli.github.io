# Naga Guntapalli — Portfolio Website

This repository contains the source for Naga V. Guntapalli's academic and professional portfolio.

## Website files

- `index.html` — all page content and section order
- `styles.css` — colors, layout, typography, and mobile design
- `script.js` — mobile navigation, project filters, and current year

No framework, build tool, database, or paid service is required.

## Publish with GitHub Pages

1. Open this repository on GitHub.
2. Select **Settings → Pages**.
3. Under **Build and deployment**, select **Deploy from a branch**.
4. Select branch **main** and folder **/(root)**.
5. Click **Save**.

Because this repository is named `NagaGuntapalli.github.io` rather than `NagaChaitanya96.github.io`, GitHub may publish it as a project site at:

`https://nagachaitanya96.github.io/NagaGuntapalli.github.io/`

For the shorter account-level address `https://nagachaitanya96.github.io/`, rename the repository to `NagaChaitanya96.github.io`.

## Edit without ChatGPT

### Edit directly on GitHub

1. Open the file you want to change.
2. Click the pencil icon.
3. Edit the text.
4. Select **Commit changes**.
5. GitHub Pages will republish the site automatically.

### Edit with VS Code

```bash
git clone https://github.com/NagaChaitanya96/NagaGuntapalli.github.io.git
cd NagaGuntapalli.github.io
code .
```

After editing:

```bash
git add index.html styles.css script.js
git commit -m "Update portfolio"
git push
```

To preview locally, open `index.html` in a browser or run:

```bash
python -m http.server 8000
```

Then visit `http://localhost:8000`.

## Add a project

In `index.html`, copy an existing `<article class="project-card">...</article>` block inside `project-grid` and edit:

- `data-category`: `energy`, `aerospace`, or `quant`
- project number and category
- title and description
- technologies in `mini-tags`
- GitHub, paper, poster, or results link

## Add a résumé

1. Create an `assets` folder.
2. Upload the PDF as `assets/Naga_Guntapalli_Resume.pdf`.
3. Add this link where you want the résumé button:

```html
<a class="button button-secondary" href="assets/Naga_Guntapalli_Resume.pdf">Download résumé</a>
```

## Add LinkedIn or Blinq

Add another link inside the `profile-links` block in `index.html`:

```html
<a href="YOUR_LINK" target="_blank" rel="noreferrer">LinkedIn</a>
```

## Important privacy checks

Never upload:

- `.env` files, API keys, passwords, PINs, or TOTP secrets
- proprietary employer code
- confidential or sponsor-owned experimental data
- brokerage account details
- datasets, figures, or papers you do not have permission to publish

For restricted work, describe the problem, methods, and your contribution without uploading protected code or data.

## Recommended backup

Keep three copies:

1. This GitHub repository
2. A local copy on your computer
3. A ZIP copy in cloud storage
