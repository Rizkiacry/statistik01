# Statistik Chapters Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Write statistics content into chap1-teori.typ and chap2-praktikum.typ

**Architecture:** Direct content writing into existing Typst files. Uses `$...$` for math formulas, `#figure(image(...))` for screenshots, `#figure(table(...))` for data tables.

**Tech Stack:** Typst typesetting

---

### Task 1: Write chap1-teori.typ — explanations & examples

**Files:**
- Modify: `sections-old/main/chap1-teori.typ`

- [ ] **Step 1: Write section "Fungsi COUNT, MAX, MIN, ROUND, ROUNDUP, SUM"**

Write content replacing current file content. Each function:
- Definisi
- Syntax
- Contoh dari data_1 (COUNT=80, MAX=499, MIN=9, ROUND(7.28)=7, ROUNDUP(92.8)=93)

```typst
= LAPORAN TEORI

== Fungsi COUNT, MAX, MIN, ROUND, ROUNDUP, SUM

Fungsi COUNT digunakan untuk ...
```

- [ ] **Step 2: Write section "Perbedaan ROUND dan ROUNDUP"**

Comparison table same style as existing loop comparison table.

```typst
#figure(
  table(
    columns: (auto, auto, auto),
    [*Fungsi*], [*Cara Kerja*], [*Contoh*],
    [ROUND], [Membulatkan ke bilangan terdekat (4/5 rule)], [ROUND(7.28) = 7],
    [ROUNDUP], [Membulatkan selalu ke atas], [ROUNDUP(7.28) = 8],
  ),
  kind: "tabel",
  caption: [Perbandingan ROUND dan ROUNDUP]
)
```

- [ ] **Step 3: Write section "Ukuran Pemusatan Data"**

```typst
== Ukuran Pemusatan Data

Ukuran pemusatan data...

=== Mean
$X rata-rata = (Σ(m_i times f_i))/(Σ f_i) = 19864.5/80 = 248.375$

=== Median
$Me = tb + ((n/2 - fk*))/(f) times c = 219.5 + ((40-37))/11 times 70 = 238.59$

=== Modus
$Mo = tb + ((d_1 + d_2))/(d_1) times c = 149.5 + 6/2 times 70 = 359.5$
```

- [ ] **Step 4: Write section "Ukuran Penyebaran Data"**

```typst
== Ukuran Penyebaran Data

Ukuran penyebaran data...

$Range = MAX - MIN = 499 - 9 = 490$
$SR = 1/n sum |x_i - x_rata-rata| = 118.65$
$S^2 = 1/n sum (x_i - x_rata-rata)^2 = 18916.80$
$S = sqrt(S^2) = 137.54$
```

- [ ] **Step 5: Write section "Penerapan Statistik dalam Kehidupan"**

Three narrative paragraphs: prediksi cuaca, quality control produksi, analisis survey.

- [ ] **Step 6: Verify compile**

```bash
typst compile main.typ
```
Expected: no errors. PDF output is max 2 pages for chap1 content.

---

### Task 2: Write chap2-praktikum.typ — frequency distribution & mean/median/modus

**Files:**
- Modify: `sections-old/main/chap2-praktikum.typ`

- [ ] **Step 1: Write section "Data yang Digunakan"**

20 row × 4 column data table from data_1.csv. Screenshot s01-01-data.jpg.

```typst
= LAPORAN PRAKTIKUM

== Data yang Digunakan

Data yang digunakan dalam praktikum ini...

#figure(
  table(
    columns: 4,
    [245], [78], [391], [122],
    ...
  ),
  kind: "tabel",
  caption: [Data Praktikum]
)

#figure(
  image("../../media/s01-01-data.jpg", width: 80%),
  kind: "gambar",
  caption: [Data pada Excel]
)
```

- [ ] **Step 2: Write section "Tabel Distribusi Frekuensi"**

Step-by-step:
- n=80, MAX=499, MIN=9, range=490
- k = 1 + 3.3·log(80) = 7.28 → 7 kelas (ROUND)
- c = 490/7 = 70 (ROUNDUP)
- Table: kelas, BB, BA, fi, fk<, fk>, mi, mi·fi

Include screenshots: s01-02-fd-bb-ba.jpg, s01-03-fi-fkx-fkxx.jpg, s01-04-mi-mifi-u-ufi.jpg

- [ ] **Step 3: Write section "Mean"**

Formula + calculation: 248.375

Include screenshot: s01-05-mean-median.jpg

- [ ] **Step 4: Write section "Median"**

Formula + calculation: 238.59

- [ ] **Step 5: Write section "Modus"**

Formula + calculation: 359.5

Include screenshot: s01-06-modus-quartil.jpg

- [ ] **Step 6: Verify compile**

```bash
typst compile main.typ
```
Expected: no errors. PDF output is min 4 pages for chap2 content.
