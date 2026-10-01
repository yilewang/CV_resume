# resume

Yile Wang's CV and resume, maintained in LaTeX.

| File | Output |
|---|---|
| `cv.tex` | Academic CV: education, research, full publication list first |
| `resume.tex` | Industry resume: experience and projects first, selected publications |
| `sections/*.tex` | Shared content used by both |
| `resume.cls` | Layout (Helvetica, derived from the original Word CV) |

## Build

Requires TeX Live with XeLaTeX.

```bash
latexmk
```

This writes `cv.pdf` and `resume.pdf`; `latexmk -c` removes the auxiliary files.
The class uses macOS Helvetica when it is installed and falls back to TeX Gyre Heros elsewhere.

## Editing

Edit content once in `sections/`; change section order in `cv.tex` or `resume.tex`.
Wrap variant-specific material in `\cvonly{...}` or `\resumeonly{...}`.
For example, publications wrapped in `\cvonly` appear only in the full CV.

| Command | Use |
|---|---|
| `\cvsection{Title}` | Uppercase bold heading with a full-width rule |
| `\leftright{left}{right}` | Line with a right-aligned part (dates, locations) |
| `\indented{text}` | 10pt indent, as for degree lines |
| `\subentry{title}` | Italic heading inside an entry, such as one research project |
| `\entrygap` | Space between entries |
| `\link{url}{text}` | Blue underlined hyperlink |
| `\ul{text}` | Plain underline |
| `\me{name}` | Bold your name in author lists |
| `\venue{name}` | Italic journal or conference name |
| `\status{text}` | Bracketed status note, such as `[under review]` |
