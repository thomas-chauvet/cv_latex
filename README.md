# LaTeX CV

Personal CV built with the [moderncv](https://ctan.org/pkg/moderncv) LaTeX class, compiled with LuaLaTeX.

The latest PDF is available in the [Releases](../../releases) section.

## Prerequisites

A TeX distribution with LuaLaTeX and `latexmk`:

- **macOS:** `brew install --cask mactex`
- **Linux:** install [TeX Live](https://tug.org/texlive/) (`apt install texlive-full` or equivalent)

## Build

```bash
make build   # compile cv.tex → build/cv.pdf
make clean   # remove build artifacts
make watch   # recompile on file changes
```

## CI/CD

A [GitHub Actions workflow](.github/workflows/latex2pdf.yml) compiles the CV on every push to `main` and uploads the PDF as a build artifact. Pushing a tag creates a GitHub Release with the PDF attached.

## License

[CC BY-NC-SA 3.0](http://creativecommons.org/licenses/by-nc-sa/3.0/) — see the header of `cv.tex` for details.
