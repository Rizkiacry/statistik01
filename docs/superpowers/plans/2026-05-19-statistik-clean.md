# Statistik Chapters — Clean Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Write 2 Typst chapter files with exactly the specified statistics content — no more, no less.

**Architecture:** Content writing into existing `.typ` files. Uses Typst math `$...$`, `#figure(image(...))`, `#figure(table(...))`.

**Tech Stack:** Typst

---

### Task 1: Write chap1-teori.typ — general function explanations

**Files:**
- Modify: `sections-old/main/chap1-teori.typ` (overwrite entire file)

**CRITICAL RULE:** General explanations only. NO specific values from data_1 or final.csv. Examples must be generic/simple.

- [ ] **Step 1: Write section 1 — COUNT, MAX, MIN, ROUND, ROUNDUP, SUM**

```typst
= LAPORAN TEORI

== Fungsi COUNT, MAX, MIN, ROUND, ROUNDUP, SUM

COUNT adalah fungsi yang digunakan untuk menghitung jumlah data numerik dalam suatu range. MAX mengembalikan nilai tertinggi dalam suatu kumpulan data, sedangkan MIN mengembalikan nilai terendah. ROUND membulatkan angka berdasarkan aturan 4/5: jika desimal kurang dari 5 dibulatkan ke bawah, jika 5 atau lebih dibulatkan ke atas. ROUNDUP selalu membulatkan angka ke atas menjauhi nol. SUM menjumlahkan seluruh nilai numerik dalam suatu range.
```

- [ ] **Step 2: Write section 2 — Perbedaan ROUND dan ROUNDUP (with table)**

```typst
== Perbedaan ROUND dan ROUNDUP

#figure(
  table(
    columns: (auto, auto, auto),
    [*Aspek*], [*ROUND*], [*ROUNDUP*],
    [Aturan], [4/5 (ke terdekat)], [Selalu ke atas],
    [Arah], [Mendekati nol], [Menjauhi nol],
    [Contoh 3.14], [$= 3$], [$= 4$],
    [Contoh 2.5], [$= 3$], [$= 3$],
  ),
  kind: "tabel",
  caption: [Perbandingan Fungsi ROUND dan ROUNDUP]
)
```

- [ ] **Step 3: Write section 3 — Ukuran Pemusatan Data dan Ukuran Penyebaran Data (general examples)**

```typst
== Ukuran Pemusatan Data dan Ukuran Penyebaran Data

Ukuran pemusatan data adalah nilai yang mewakili kecenderungan data mengelompok di sekitar nilai tertentu. Tiga ukuran utama: mean (rata-rata hitung), median (nilai tengah setelah diurutkan), dan modus (nilai paling sering muncul). Contoh: nilai ujian 5 mahasiswa 70, 80, 80, 90, 100 memiliki mean = 84, median = 80, modus = 80.

Ukuran penyebaran data menunjukkan luas atau sempitnya persebaran nilai. Contoh: range (selisih nilai terbesar dan terkecil), varians, dan simpangan baku. Semakin besar nilai penyebaran, semakin bervariasi data tersebut.
```

- [ ] **Step 4: Write section 4 — 3 penerapan statistik**

```typst
== Penerapan Statistik dalam Kehidupan

[masing-masing 1 paragraf: prediksi cuaca, quality control, survei]
```

- [ ] **Step 5: Verify compile**

```bash
typst compile main.typ
```
Expected: no errors. chap1 max 2 pages.

---

### Task 2: Write chap2-praktikum.typ — frequency distribution + mean/median/modus ONLY

**Files:**
- Modify: `sections-old/main/chap2-praktikum.typ` (overwrite entire file)

**CRITICAL RULES:**
- ONLY: data, frequency distribution table, mean, median, modus
- NO quartil, desil, persentil, SR, varians, SD, skewness, kurtosis
- NO extra analysis beyond what's listed

- [ ] **Step 1: Write section data + frequency distribution**

Show data_1 as table. Then build frequency distribution step by step:
- n=80, MAX=499, MIN=9, range=490
- k=1+3.3·log(80)=7.28→7
- c=490/7=70
- 7 classes table with fi

Screenshots: s01-01-data.jpg, s01-02-fd-bb-ba.jpg, s01-03-fi-fkx-fkxx.jpg, s01-04-mi-mifi-u-ufi.jpg

- [ ] **Step 2: Write Mean dan Median**

Mean: Σmi·fi/Σfi = 19864.5/80 = 248.375
Median: 219.5 + (40-37)/11 × 70 = 238.59

Screenshot: s01-05-mean-median.jpg

- [ ] **Step 3: Write Modus**

tb=149.5, d1=2, d2=4, c=70
Mo = 149.5 + (2+4)/2 × 70 = 359.5

Screenshot: s01-06-modus-quartil.jpg

- [ ] **Step 4: Verify compile**

```bash
typst compile main.typ
```
Expected: no errors. chap2 min 4 pages.
