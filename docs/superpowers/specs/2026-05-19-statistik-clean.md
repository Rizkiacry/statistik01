# Statistik Chapters — Revisi Bersih

## chap1-teori.typ (max 2 pages)

| # | Section | Content |
|---|---------|---------|
| 1 | Fungsi COUNT, MAX, MIN, ROUND, ROUNDUP, SUM | Definisi konsep masing-masing fungsi. COUNT=jumlah data, MAX=nilai terbesar, MIN=nilai terkecil, ROUND=pembulatan 4/5, ROUNDUP=pembulatan ke atas, SUM=penjumlahan. Contoh umum (bukan data_1). |
| 2 | Perbedaan ROUND dan ROUNDUP | Tabel: aspek, ROUND, ROUNDUP. ROUND 4/5 rule, ROUNDUP selalu ke atas. |
| 3 | Ukuran Pemusatan & Penyebaran Data | Definsi pemusatan (mean/median/modus) + contoh umum (misal: nilai ujian). Definisi penyebaran (range, varians) + contoh umum. |
| 4 | Penerapan Statistik | 3 paragraf naratif: cuaca, QC, survey. |

## chap2-praktikum.typ (min 4 pages)

| # | Section | Content | Media |
|---|---------|---------|-------|
| 1 | Data yang Digunakan | 20 baris × 4 kolom dari data_1.csv | s01-01-data.jpg |
| 2 | Tabel Distribusi Frekuensi | n=80, MAX=499, MIN=9, range=490. k=1+3.3·log(80)=7.28→7. c=490/7=70. Tabel 7 kelas + fi. | s01-02-fd-bb-ba.jpg, s01-03-fi-fkx-fkxx.jpg, s01-04-mi-mifi-u-ufi.jpg |
| 3 | Mean dan Median | Mean: Σmi·fi/Σfi = 248.375. Median: tb+(n/2-fk*)/f×c = 238.59 | s01-05-mean-median.jpg |
| 4 | Modus | tb + (d1+d2)/d1 × c = 149.5 + 6/2×70 = 359.5 | s01-06-modus-quartil.jpg |

## Files to modify

- `sections-old/main/chap1-teori.typ` — overwrite with clean content
- `sections-old/main/chap2-praktikum.typ` — overwrite with clean content (NO quartil/desil/persentil/SR/varians/SD/skewness/kurtosis)

## Verification

`typst compile main.typ` — must succeed with no errors.
