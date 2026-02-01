# CLAUDE.md

## Project Overview

LaTeX-based professional CV for Thomas Chauvet. The single source file `cv.tex` is compiled to PDF via LuaLaTeX, with automated builds and releases through GitHub Actions.

## Repository Structure

```
cv.tex                          # Main CV source (moderncv class, classic style, blue theme)
.github/workflows/latex2pdf.yml # CI: compile LaTeX → PDF, upload artifact, release on tags
.vscode/settings.json           # LaTeX Workshop compile recipes (xelatex, pdflatex, bibtex)
.vscode/extensions.json         # Recommends james-yu.latex-workshop
.gitignore                      # Excludes all LaTeX build artifacts and PDFs
README.md                       # Setup instructions
```

## Build & Development

**Local prerequisites (macOS):**
```bash
brew install --cask mactex
brew install latexindent texlive
```

**IDE:** VS Code with LaTeX Workshop extension. Compile recipes are preconfigured in `.vscode/settings.json` (XeLaTeX, PDFLaTeX, with optional BibTeX passes).

**CI/CD:** GitHub Actions workflow (`latex2pdf.yml`) triggers on push to `main`/`develop`, tags, and PRs. Uses `xu-cheng/latex-action@v3` with LuaLaTeX via latexmk. Tagged pushes create GitHub releases with the compiled PDF.

## Key Conventions

**Git commits:** Semantic prefixes — `feat:`, `fix:`, `chore:`. Branch naming: `type/description`.

**CV structure in `cv.tex`:** Personal header → summary → work experience (reverse chronological, `\cventry{}`) → technical skills (`\cvitem{}`) → education → languages. Each job entry includes a tech stack line.

**What not to commit:** PDF files and LaTeX build artifacts are gitignored. The `cv/` output directory is also excluded.

## Making Changes

- All CV content lives in `cv.tex`. Edit sections using `\cventry{}` for experience and `\cvitem{}` for skills.
- The document uses `moderncv` package (classic style, blue color). Do not change the document class without updating the CI compiler settings.
- The CI compiles with LuaLaTeX specifically — ensure any new packages are compatible.
