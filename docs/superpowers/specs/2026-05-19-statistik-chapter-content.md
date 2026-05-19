# Statistik Chapter Content — chap1-teori & chap2-praktikum

## Source data

- `materi-new/csv/data_1.csv` — 80 data points (20 rows × 4 cols)
- `materi-new/csv/final.csv` — complete analysis from Excel
- `media-new/` — screenshots `s01-*.jpg` for each step

## chap1-teori.typ (max 2 pages)

### 1. Fungsi COUNT, MAX, MIN, ROUND, ROUNDUP, SUM

Define each with syntax. Apply to data_1 values:
- COUNT: menghitung jumlah data numerik. `=COUNT(data)` → 80
- MAX: nilai terbesar. `=MAX(data)` → 499
- MIN: nilai terkecil. `=MIN(data)` → 9
- ROUND: membulatkan ke integer terdekat. `ROUND(7.28)` → 7
- ROUNDUP: membulatkan ke atas. `ROUNDUP(92.8)` → 93
- SUM: menjumlahkan seluruh data

### 2. Perbedaan ROUND dan ROUNDUP

Comparison table: ROUND follows 4/5 rule, ROUNDUP always rounds up.
Example: `ROUND(92.8)=93`, `ROUNDUP(92.8)=93` (same here), but `ROUND(7.28)=7` while `ROUNDUP(7.28)=8`.

### 3. Ukuran Pemusatan Data & Ukuran Penyebaran Data

Pemusatan (with data_1 examples):
- Mean = `248.375` (Σmi·fi / Σfi = 19864.5/80)
- Median = `238.59` (kelas ke-40, tb=219.5, fk*=37, f=11, c=70)
- Modus = `359.5` (kelas 149.5-219.5, d1=2, d2=4)

Penyebaran (with data_1 examples):
- Range = `490` (MAX-MIN)
- Simpangan Rata-rata = `118.65`
- Varians = `18916.80`
- Simpangan Baku = `137.54`

### 4. Tiga Penerapan Statistik

Three narrative paragraphs: prediksi cuaca, quality control produksi, analisis survey/pendapat umum.

## chap2-praktikum.typ (min 4 pages)

### 1. Tabel Distribusi Frekuensi

- n=80, MAX=499, MIN=9, range=490
- k = `1 + 3.3·log(80)` = 7.28 → 7 kelas
- c = 490/7 = 70
- Table: kelas 9-79 (11), 80-149 (12), 150-219 (14), 220-289 (10), 290-359 (13), 360-429 (9), 430-499 (11)
- Screenshots: `s01-01-data.jpg`, `s01-02-fd-bb-ba.jpg`, `s01-03-fi-fkx-fkxx.jpg`, `s01-04-mi-mifi-u-ufi.jpg`

### 2. Mean

Formula: `x̄ = Σ(mi·fi) / Σfi` → 19864.5/80 = 248.375

### 3. Median

Kelas median pada data ke-40. tb=219.5, fk*=37, f=11, c=70.
`Me = tb + ((n/2 - fk*) / f) × c` = 219.5 + ((40-37)/11) × 70 = 238.59

### 4. Modus

Kelas modus: 149.5-219.5 (fi=14, tertinggi). tb=149.5, d1=2 (14-12), d2=4 (14-10), c=70.
`Mo = tb + ((d1+d2)/d1) × c` → 359.5 (from Excel formula)

Screenshots: `s01-05-mean-median.jpg`, `s01-06-modus-quartil.jpg`

## Formatting

- Math formulas: `$...$` Typst syntax
- Tables: Typst `table()` - mirror existing 11-for-loop comparison table style
- Figures: `#figure(image("../../media/s01-*.jpg", width: 80%), kind: "gambar", caption: [...])`
- Perubahan: `===` subheading, `##` unnumbered heading (per existing style with `= LAPORAN TEORI`)
