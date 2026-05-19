# AGENTS.md — statistik01

## Project overview

Typst academic report + Node.js XLSX→CSV converter.

## Typst report

- **Build:** `typst compile main.typ`
- **Watch:** `typst watch main.typ`
- **Entry:** `main.typ` imports `config.typ` + `sections/`
- **Config:** `config.typ` — author, report number, type, advisor
- **Report types:** `"LAPORAN TEORI"`, `"LAPORAN PRAKTIKUM"`, `"Laporan Proyek Akhir"` — toggle via `config.typ:9`
- **Sections:** `sections/cover/cover_proposal.typ`, `sections/main/chap1-teori.typ`, `sections/main/chap2-praktikum.typ`
- **Fonts:** `fonts/` (Times New Roman 12pt) — auto-detected by Typst
- **Images:** `media-new/` symlinked as `media/`. Referenced as `../../media/` from sections
- **Output:** `main.pdf`

## Data converter (`materi-new/`)

- **Run:** `node scripts/convert.js` (from `materi-new/`)
- **Input:** `materi-new/xlsx/*.xlsx`
- **Output:** `materi-new/csv/*.csv` (semicolon-delimited, `sep=;` header)
- **Dep:** `xlsx` npm package

## Conventions

- Language: Indonesian (`lang: "id"`)
- Chapter headings: `BAB I \ TITLE` (uppercase, centered)
- Image naming: `sNN-<desc>.jpg`
- Root repo at `github.com/Rizkiacry/statistik01`
