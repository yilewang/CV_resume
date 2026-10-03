# resume

Yile Wang's CV and resume, maintained in LaTeX.

| File | Purpose |
|---|---|
| `content.tex` | Shared text and section definitions used by both documents |
| `cv.tex` | Academic CV section order; builds `cv.pdf` |
| `resume.tex` | Industry resume section order; builds `resume.pdf` |
| `resume.cls` | Layout (Helvetica, derived from the original Word CV) |

## Build

Requires TeX Live with XeLaTeX.

```bash
latexmk
```

This writes `cv.pdf` and `resume.pdf` and rebuilds both when `content.tex` changes.
To build only one document, run `latexmk cv.tex` or `latexmk resume.tex`.
Run `latexmk -c` to remove the auxiliary files.
The class uses macOS Helvetica when it is installed and falls back to TeX Gyre Heros elsewhere.

## Editing

Edit wording, dates, and other shared information in `content.tex`.
Each section is defined once as a command, such as `\EducationSection` or `\ExperienceSection`.
Both documents load these definitions with `\input{content}`.
Rebuild the PDFs after editing the source.

To change section order, move the section commands between `\begin{document}` and `\end{document}` in `cv.tex` or `resume.tex`.
Each file controls its own order independently.
For example, the resume currently uses:

```tex
\HeaderSection
\SummarySection
\EducationSection
\ProjectsSection
\ExperienceSection
\SkillsSection
\PublicationsSection
\HonorsSection
```

`\ProjectsSection` displays Open-Source Software, and `\ExperienceSection` displays Research & Work Experience.
To hide a section in one document, add `%` before its command in that document's file.

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
