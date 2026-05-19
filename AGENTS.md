# AGENTS.md — statistik01

## Project overview

Dual-project repo: (1) Typst academic report, (2) Node.js XLSX→CSV converter.

## Typst report (`config.typ`, `main.typ`)

- **Build command:** `typst compile main.typ`
- **Watch:** `typst watch main.typ`
- **Fonts:** bundled under `fonts/` (Times New Roman variants). Typst picks them up automatically when placed next to source.
- **Config:** `config.typ` — author, report number, report type, advisor, etc. Edit then recompile.
- **Report types:** `"LAPORAN TEORI"`, `"LAPORAN PRAKTIKUM"`, `"Laporan Proyek Akhir"` — toggled via `config.typ:9`.
- **Page layout:** A4 with 2cm margins (proposal/theory reports) or A5 with tighter margins (final project).
- **Section files:** sourced from `sections-old/` (cover, main, preface, appendix). `main.typ` includes them by path.
- **Images:** `media-new/` (current), `media-old/` (legacy). Referenced by relative path in section `.typ` files.
- **Citations:** `citations-old/bibtex.bib` + `citations-old/apa.csl`.
- **Output:** `main.pdf` — committed artifact, regenerated on compile.
- **No test/lint commands** — compile success is verification.

## Data converter (`materi-new/`)

- **Stack:** Node.js, `xlsx` npm package.
- **Entry:** `materi-new/scripts/convert.js`.
- **Input:** `materi-new/xlsx/*.xlsx`.
- **Output:** `materi-new/csv/*.csv`.
- **Run:** `node scripts/convert.js` (from `materi-new/`).
- **CSV format:** semicolon-delimited, `sep=;` first line, formula extraction with `=@` for array formulas, Unicode→ASCII mapping for math symbols.
- **No test suite** — manual verification by checking CSV output.

## Node dependencies

```bash
cd materi-new && npm install
```

Only dependency is `xlsx`. Pre-installed.

## Conventions

- Report language: Indonesian (`lang: "id"`).
- Font: Times New Roman 12pt.
- Chapter headings: upper case, "BAB I\nTITLE".
- Image filenames: `sNN-<desc>.jpg` (e.g., `s01-01-data.jpg`).
- `materi-new/` and `template-original/` have their own `.git` — root repo at `github.com/Rizkiacry/statistik01`.
