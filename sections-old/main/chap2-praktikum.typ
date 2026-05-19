= LAPORAN PRAKTIKUM

Praktikum ini bertujuan untuk menganalisis 80 data poin menggunakan Microsoft Excel guna menghitung ukuran pemusatan data untuk data berkelompok, meliputi mean (rata-rata), median, dan modus. Analisis dilakukan secara bertahap mulai dari penyiapan data, pembuatan tabel distribusi frekuensi, hingga perhitungan setiap ukuran statistik.

== Data yang Digunakan

Data yang digunakan merupakan data kuantitatif sebanyak 80 nilai yang diinput ke dalam sheet Microsoft Excel. Data terdiri dari 80 nilai yang diinput ke dalam sel dengan rentang C2 hingga F21. Data tersebut adalah sebagai berikut:

#figure(
  table(
    columns: (auto, auto, auto, auto, auto, auto, auto, auto),
    [245], [78], [391], [122], [14], [466], [205], [311],
    [132], [401], [88], [343], [263], [197], [499], [66],
    [329], [182], [470], [155], [313], [295], [437], [96],
    [384], [219], [305], [9], [228], [361], [165], [252],
    [174], [36], [445], [203], [471], [51], [239], [317],
    [119], [278], [384], [23], [467], [188], [64], [294],
    [250], [314], [112], [327], [143], [406], [218], [83],
    [190], [444], [351], [268], [176], [486], [320], [45],
    [91], [169], [122], [487], [198], [33], [457], [248],
    [74], [299], [134], [406], [367], [105], [267], [378],
  ),
  kind: "tabel",
  caption: [Data Praktikum (80 Data)]
)

Dari data tersebut diperoleh statistik dasar menggunakan fungsi-fungsi Excel:

$n = "COUNT(C2:F21)" = 80$

$"MAX(C2:F21)" = 499$

$"MIN(C2:F21)" = 9$

$"Range" = 499 - 9 = 490$

Jumlah data ($n$) = 80, nilai maksimum = 499, nilai minimum = 9, dan rentang (Range) = 490. Nilai-nilai ini digunakan dalam pembuatan tabel distribusi frekuensi.

#figure(
  image("../../media/s01-01-data.jpg", width: 80%),
  kind: "gambar",
  caption: [Data Input pada Microsoft Excel]
)

== Tabel Distribusi Frekuensi

Tabel distribusi frekuensi digunakan untuk mengelompokkan data ke dalam kelas-kelas interval sehingga pola data lebih mudah dianalisis. Pembuatan tabel distribusi frekuensi dilakukan melalui beberapa tahapan sebagai berikut.

=== Penentuan Jumlah Kelas dan Lebar Kelas

Langkah pertama dalam pembuatan tabel distribusi frekuensi adalah menentukan jumlah kelas ($k$) menggunakan rumus Sturgess:

$k = 1 + 3.3 log(n)$

dengan $n = 80$:

$log(80) = 1.903$

$k = 1 + 3.3 times 1.903 = 1 + 6.280 = 7.28$

Nilai $k$ dibulatkan menggunakan fungsi ROUND menjadi $k = 7$ kelas.

Selanjutnya menentukan lebar kelas ($c$):

$c = "Range" / k = 490 / 7 = 70$

Jadi setiap kelas interval memiliki lebar 70.

=== Batas Bawah dan Batas Atas Kelas

Setelah jumlah kelas dan lebar kelas ditentukan, batas bawah (BB) dan batas atas (BA) setiap kelas dihitung. Kelas pertama dimulai dari nilai minimum data yaitu 9. Kelas berikutnya dimulai dari BA kelas sebelumnya ditambah 1.

#figure(
  table(
    columns: (auto, auto, auto, auto),
    [*Kelas ke-*], [*BB*], [*BA*], [*Keterangan*],
    [1], [9], [79], [BB = Min, BA = BB + $c$ - 1],
    [2], [80], [149], [BB = BA sebelumnya + 1],
    [3], [150], [219], [.],
    [4], [220], [289], [.],
    [5], [290], [359], [.],
    [6], [360], [429], [.],
    [7], [430], [499], [BA = Max],
  ),
  kind: "tabel",
  caption: [Penentuan Batas Bawah dan Batas Atas Kelas]
)

Kelas ke-7 berakhir pada BA = 499 yang merupakan nilai maksimum data, sehingga seluruh 80 data telah tercakup dalam 7 kelas interval.

#figure(
  image("../../media/s01-02-fd-bb-ba.jpg", width: 80%),
  kind: "gambar",
  caption: [Tabel Distribusi Frekuensi — BB dan BA]
)

=== Frekuensi dan Frekuensi Kumulatif

Frekuensi ($f_i$) setiap kelas dihitung menggunakan fungsi FREQUENCY pada Excel. Fungsi ini menghitung jumlah data yang termasuk dalam setiap interval kelas. Setelah frekuensi diperoleh, frekuensi kumulatif kurang dari ($"fk"_<$) dihitung dengan menjumlahkan frekuensi kelas pertama hingga kelas tertentu.

#figure(
  table(
    columns: (auto, auto, auto, auto, auto),
    [*Kelas ke-*], [*BB*], [*BA*], [$f_i$], [$"fk"_<$],
    [1], [9], [79], [11], [11],
    [2], [80], [149], [12], [23],
    [3], [150], [219], [14], [37],
    [4], [220], [289], [10], [47],
    [5], [290], [359], [13], [60],
    [6], [360], [429], [9], [69],
    [7], [430], [499], [11], [80],
  ),
  kind: "tabel",
  caption: [Tabel Distribusi Frekuensi dan Frekuensi Kumulatif]
)

$"fk"_<$ dihitung dengan menjumlahkan frekuensi kelas pertama hingga kelas tertentu:

$"fk"_<1 = 11$
$"fk"_<2 = 11 + 12 = 23$
$"fk"_<3 = 23 + 14 = 37$
$"fk"_<4 = 37 + 10 = 47$
$"fk"_<5 = 47 + 13 = 60$
$"fk"_<6 = 60 + 9 = 69$
$"fk"_<7 = 69 + 11 = 80$

Total frekuensi adalah 80, sesuai dengan jumlah data.

#figure(
  image("../../media/s01-03-fi-fkx-fkxx.jpg", width: 80%),
  kind: "gambar",
  caption: [Frekuensi dan Frekuensi Kumulatif pada Excel]
)

=== Nilai Tengah Kelas

Nilai tengah ($m_i$) dihitung dengan rumus:

$m_i = ("BB"_i + "BA"_i) / 2$

Hasil perhitungan nilai tengah dan perkaliannya dengan frekuensi:

#figure(
  table(
    columns: (auto, auto, auto, auto, auto),
    [*Kelas*], [$m_i$], [$f_i$], [$m_i dot f_i$], [*Keterangan*],
    [1], [44], [11], [484], [$(9+79)/2=44$],
    [2], [114.5], [12], [1374], [$(80+149)/2=114.5$],
    [3], [184.5], [14], [2583], [$(150+219)/2=184.5$],
    [4], [254.5], [10], [2545], [$(220+289)/2=254.5$],
    [5], [324.5], [13], [4218.5], [$(290+359)/2=324.5$],
    [6], [394.5], [9], [3550.5], [$(360+429)/2=394.5$],
    [7], [464.5], [11], [5109.5], [$(430+499)/2=464.5$],
    [*Jumlah*], [], [*80*], [*19864.5*], [],
  ),
  kind: "tabel",
  caption: [Perhitungan Nilai Tengah dan $sum m_i f_i$]
)

$sum (m_i dot f_i) = 484 + 1374 + 2583 + 2545 + 4218.5 + 3550.5 + 5109.5 = 19864.5$

#figure(
  image("../../media/s01-04-mi-mifi-u-ufi.jpg", width: 80%),
  kind: "gambar",
  caption: [Perhitungan $m_i$, $m_i dot f_i$, dan Coding ($u_i$) pada Excel]
)

== Mean dan Median

=== Mean (Rata-rata)

Mean atau rata-rata hitung merupakan ukuran pemusatan data yang paling umum digunakan. Untuk data berkelompok, mean dihitung dengan rumus:

$bar{x} = (sum (m_i times f_i)) / (sum f_i)$

dimana $m_i$ adalah nilai tengah setiap kelas dan $f_i$ adalah frekuensi kelas.

Dari tabel distribusi frekuensi yang telah dibuat, diperoleh:

$sum (m_i times f_i) = 19864.5$
$sum f_i = 80$

Maka:

$bar{x} = 19864.5 / 80 = 248.375$

Jadi, mean dari data tersebut adalah 248.375.

=== Median

Median adalah nilai yang membagi data menjadi dua bagian sama besar setelah data diurutkan. Untuk data berkelompok, median dihitung dengan rumus:

$"Me" = "tb" + (n/2 - "fk"^"*") / f_"med" times c$

dimana:
- $"tb"$ = tepi bawah kelas median
- $n$ = jumlah data
- $"fk"^"*"$ = frekuensi kumulatif sebelum kelas median
- $f_"med"$ = frekuensi kelas median
- $c$ = lebar kelas

Letak median = $n/2 = 80 / 2 = 40$. Data ke-40 berada pada kelas ke-4 (BB 220 — BA 289).

$"tb" = 220 - 0.5 = 219.5$
$"fk"^"*" = 37$ (frekuensi kumulatif kelas ke-3)
$f_"med" = 11$
$c = 70$

$"Me" = 219.5 + (40 - 37) / 11 times 70 = 219.5 + 19.09 = 238.59$

Jadi, median dari data tersebut adalah 238.59.

#figure(
  image("../../media/s01-05-mean-median.jpg", width: 80%),
  kind: "gambar",
  caption: [Perhitungan Mean dan Median pada Excel]
)

== Modus

Modus adalah nilai yang paling sering muncul dalam data. Untuk data berkelompok, modus dihitung dengan rumus:

$"Mo" = "tb" + (d_1 + d_2) / d_1 times c$

dimana:
- $"tb"$ = tepi bawah kelas modus
- $d_1$ = selisih frekuensi kelas modus dengan kelas sebelumnya
- $d_2$ = selisih frekuensi kelas modus dengan kelas sesudahnya
- $c$ = lebar kelas

Kelas modus adalah kelas dengan frekuensi tertinggi, yaitu kelas ke-3 (BB 150 — BA 219) dengan $f = 14$.

$"tb" = 150 - 0.5 = 149.5$
$d_1 = 14 - 12 = 2$
$d_2 = 14 - 10 = 4$
$c = 70$

$"Mo" = 149.5 + (2 + 4) / 2 times 70 = 149.5 + 210 = 359.5$

Jadi, modus dari data tersebut adalah 359.5.

#figure(
  image("../../media/s01-06-modus-quartil.jpg", width: 80%),
  kind: "gambar",
  caption: [Perhitungan Modus pada Excel]
)
