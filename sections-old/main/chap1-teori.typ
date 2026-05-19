= LAPORAN TEORI

== Fungsi COUNT, MAX, MIN, ROUND, ROUNDUP, SUM

Dalam pengolahan data statistik, berbagai fungsi digunakan untuk menganalisis sekumpulan data secara efisien. Fungsi COUNT menghitung jumlah data numerik dalam suatu rentang. Fungsi MAX mengembalikan nilai terbesar dari sekumpulan data. Fungsi MIN mengembalikan nilai terkecil dari sekumpulan data.

Fungsi ROUND membulatkan angka ke bilangan terdekat berdasarkan aturan pembulatan 4/5: jika desimal kurang dari 5 dibulatkan ke bawah, sedangkan 5 atau lebih dibulatkan ke atas. Fungsi ROUNDUP membulatkan angka ke atas menjauhi nol tanpa memperhatikan nilai desimalnya. Fungsi SUM menjumlahkan seluruh nilai dalam suatu rentang data.

== Perbedaan ROUND dan ROUNDUP

#figure(
  table(
    columns: (auto, auto, auto),
    [*Aspek*], [*ROUND*], [*ROUNDUP*],
    [Aturan], [4/5 (ke terdekat)], [Selalu ke atas],
    [Arah], [Mendekati nol], [Menjauhi nol],
    [Contoh 3.14], [$= 3$], [$= 4$],
    [Contoh 2.5], [$= 3$], [$= 3$],
    [Contoh 1.49], [$= 1$], [$= 2$],
  ),
  kind: "tabel",
  caption: [Perbandingan Fungsi ROUND dan ROUNDUP]
)

ROUND mengikuti aturan 4/5 sehingga 3.14 dibulatkan menjadi 3, sedangkan 2.5 dibulatkan menjadi 3. ROUNDUP selalu membulatkan ke atas: 3.14 menjadi 4 dan 1.49 menjadi 2. Pada bilangan seperti 2.5, kedua fungsi menghasilkan nilai yang sama karena aturan 4/5 membulatkan 5 ke atas.

== Ukuran Pemusatan Data dan Ukuran Penyebaran Data

=== Ukuran Pemusatan Data

Ukuran pemusatan data adalah nilai yang mewakili kecenderungan data mengelompok di sekitar nilai tertentu. Terdapat tiga ukuran pemusatan: mean, median, dan modus.

Mean (rata-rata) dihitung dengan menjumlahkan seluruh nilai kemudian dibagi jumlah data. Median adalah nilai tengah setelah data diurutkan. Modus adalah nilai yang paling sering muncul.

Contoh: nilai ujian 5 mahasiswa: 70, 80, 80, 90, 100. Maka mean = $(70+80+80+90+100)/5 = 84$, median = 80, dan modus = 80.

=== Ukuran Penyebaran Data

Ukuran penyebaran data menunjukkan luas atau sempitnya persebaran nilai dalam suatu data. Ukuran penyebaran meliputi range, varians, dan simpangan baku.

Range adalah selisih antara nilai terbesar dan terkecil. Varians mengukur rata-rata kuadrat selisih setiap data terhadap mean. Simpangan baku adalah akar kuadrat dari varians.

Contoh: data 60, 70, 80, 90, 100. Range = $100 - 60 = 40$, varians menghitung sebaran setiap nilai terhadap mean, dan simpangan baku menunjukkan seberapa jauh data menyebar dari rata-rata.

== Penerapan Statistik dalam Kehidupan

Dalam bidang meteorologi, statistik digunakan untuk memprediksi cuaca dengan menganalisis data suhu, kelembaban, tekanan udara, dan kecepatan angin dari waktu ke waktu. Data historis diolah menggunakan metode statistik untuk menghasilkan prakiraan cuaca yang akurat.

Dalam industri manufaktur, statistik diterapkan dalam pengendalian kualitas produk. Perusahaan menggunakan _control chart_ untuk memantau konsistensi produksi, mendeteksi penyimpangan, dan memastikan produk memenuhi standar mutu, sehingga meminimalkan produk cacat.

Di bidang sosial dan pemasaran, statistik digunakan dalam analisis survei dan pendapat umum. Data responden dianalisis menggunakan berbagai ukuran statistik untuk mengetahui tren dan preferensi masyarakat, yang menjadi dasar pengambilan keputusan bagi pemerintah dan perusahaan.
