### Dataset
Pada project ini, kita akan menggunakan tiga tabel dataset, yaitu orders_1, orders_2, dan customer dengan keterangan tabel sebagai berikut:
1. **Tabel orders_1**</br>
   Tabel orders_1 merupakan tabel yang berisikan data terkait transaksi penjualan periode quarter 1 tahun 2004 dengan informasi sebagai berikut
   <p align="center">
      <img src="https://user-images.githubusercontent.com/82072832/125386691-e9c58d80-e3c6-11eb-926d-a9d46d8b3fdd.png">
   </p>
   dan dengan tampilan lima data teratas seperti di bawah ini
   <p align="center">
      <img src="https://user-images.githubusercontent.com/82072832/125317684-64f55800-e363-11eb-8d1c-b240045e67cd.png">
   </p>

2. **Tabel orders_2**</br>
   Tabel orders_2 merupakan tabel yang berisikan data terkait transaksi penjualan periode quarter 2 tahun 2004 dengan informasi sebagai berikut
   <p align="center">
      <img src="https://user-images.githubusercontent.com/82072832/125386691-e9c58d80-e3c6-11eb-926d-a9d46d8b3fdd.png">
   </p>
   dan dengan tampilan lima data teratas seperti di bawah ini
   <p align="center">
     <img src="https://user-images.githubusercontent.com/82072832/125317867-86eeda80-e363-11eb-84c6-13fe31a44043.png">
   </p>

3. **Tabel customer**</br>
   Tabel customer merupakan tabel yang berisikan data profil customer yang mendaftar menjadi customer xyz.com dengan informasi sebagai berikut
   <p align="center">
      <img src="https://user-images.githubusercontent.com/82072832/125387301-debf2d00-e3c7-11eb-9dae-256f51f908b5.png">
   </p>
   dan dengan tampilan lima data teratas seperti di bawah ini
   <p align="center">
       <img src="https://user-images.githubusercontent.com/82072832/125318051-b1d92e80-e363-11eb-8ca4-82f594dff7f0.png">
   </p> 
   
### Total Penjualan dan Revenue pada Quarter-1 (Jan, Feb, Mar) dan Quarter-2 (Apr, Mei, Jun)
Pada bagian ini, akan dilakukan perhitungan total penjualan dan revenue pada quarter 1 dan quarter 2 dengan cara seperti berikut:
* Untuk mendapatkan nilai total penjualan akan dilakukan penjumlahan pada kolom quantity dengan fungsi aggregate sum(). 
* Untuk mendapatkan nilai revenue akan dilakukan perkalian kolom quantity dengan kolom priceEach kemudian jumlahkan hasil perkalian kedua kolom tersebut.

Lebih lanjut, perusahaan hanya ingin menghitung penjualan dari produk yang terkirim saja, jadi kita perlu mem-filter kolom ‘status’ sehingga hanya menampilkan order dengan status “Shipped”. Berikut adalah query perhitungan total penjualan dan revenue
<p align="center">
  <img src="https://user-images.githubusercontent.com/82072832/125390294-d4536200-e3cc-11eb-8c0c-4529cc444121.png">
</p>
Output:
<p align="center">
  <img src="https://user-images.githubusercontent.com/82072832/125388637-0d3e0780-e3ca-11eb-9ffe-30ced3270f8e.png">
</p>
Berdasarkan output, terlihat bahwa total pejualan maupun revenue mengalami penurunan dari quarter 1 ke quarter 2.

### Menghitung persentasi keseluruhan penjualan
Sebelum menghitung persentasi keseluruhan penjualan terlebih dahulu kita melihat total penjualan dan revenue pada kedua quarter dengan menggunakan query berikut
<p align="center">
  <img src="https://user-images.githubusercontent.com/82072832/125391394-a4a55980-e3ce-11eb-8642-98084bc00349.png">
</p>
Output:
<p align="center">
  <img src="https://user-images.githubusercontent.com/82072832/125391723-2b5a3680-e3cf-11eb-892f-fdc2b1629d94.png">
</p>
Selanjutnya, untuk menghitung pertumbuhan penjualan dan revenue akan dilakukan menggunakan formula di bawah ini

```
% Growth Sales = (sum(Present Sales) - sum(Past Sales)) / sum(Past Sales) * 100
% Growth Revenue = (sum(Present Revenue) - sum(Past Revenue)) / sum(Past Revenue) * 100
```

* **Perhitungan persentasi pertumbuhan penjualan** </br>
  ``` % Growth Sales = (6717–8694)/8694 = -22.75%```
* **Perhitungan persentasi pertumbuhan revenue** </br>
  ``` % Growth Revenue = (607548320–799579310)/ 799579310 = -24.02% ```

Berdasarkan perhitungan di atas, terlihat bahwa **pertumbuhan penjualan mengalami penurunan sebesar 22.75%** dan **pertumbuhan revenue mengalami penurunan sebesar 24.02%**.

### Menghitung jumlah customers xyz.com
Penambahan jumlah customers dapat diukur dengan membandingkan total jumlah customers yang registrasi di periode saat ini dengan total jumlah customers yang registrasi diakhir periode sebelumnya.
<p align="center">
  <img src="https://user-images.githubusercontent.com/82072832/125393493-411d2b00-e3d2-11eb-8b5d-4af4a272b837.png">
</p>
Output:
<p align="center">
  <img src="https://user-images.githubusercontent.com/82072832/125393560-5f832680-e3d2-11eb-9c5e-53f5ea71f76a.png">
</p>
berdasarkan output, terlihat bahwa terjadi penurunan jumlah customers pada quarter 2 sebesar 8 customers.

### Menghitung banyaknya customers yang sudah melakukan transaksi
Pada bagian ini, dari sejumlah customer yang registrasi di periode quarter-1 dan quarter-2, akan dilakukan perhitungan berapa banyak customers yang sudah melakukan transaksi dengan query sebagai berikut
<p align="center">
  <img src="https://user-images.githubusercontent.com/82072832/125394778-6743ca80-e3d4-11eb-90cb-02c7c76f995a.png">
</p>
Output:
<p align="center">
  <img src="https://user-images.githubusercontent.com/82072832/125394896-965a3c00-e3d4-11eb-828c-1cfeff2904ad.png">
</p>
Berdasarkan output, terlihat bahwa terdapat 25 customers yang sudah melakukan transaksi pada quarter 1 dan 19 customers yang sudah melakukan transaksi pada quarter 2. Untuk menghitung persentasi banyaknya customers yang sudah melakukan transaksi dapat digunakan formula berikut

```
% Customer Did Transactions = cum(customer did transaction by quarter) / sum(customer by quarter) * 100
```

**Perhitungan persentasi banyaknya customers yang sudah melakukan transaksi**
``` % Customer Did Transactions = (25 + 19) * 100 / (43 + 35) = 56.41% ```
Berdasarkan perhitungan di atas, persentasi banyaknya customers yang sudah melakukan transaksi adalah 56.41%.

### Category produk yang paling banyak di-order oleh customers di Quarter-2
Untuk mengetahui kategori produk yang paling banyak dibeli, maka dapat dilakukan dengan menghitung total order dan jumlah penjualan dari setiap kategori produk dengan query sebagai berikut
<p align="center">
  <img src="https://user-images.githubusercontent.com/82072832/125395630-a292c900-e3d5-11eb-867d-1b6b14506b9f.png">
</p>
Output:
<p align="center">
  <img src="https://user-images.githubusercontent.com/82072832/125395856-edacdc00-e3d5-11eb-8c4b-4ffb0d8f1536.png">
</p>
Berdasarkan output di atas, terlihat bahwa produk dengan kategori id S18 dan S24 merupakan produk yang paling banyak di order oleh customers pada quarter 2. S18 memiliki total order sebanyak 25 kali order dan total penjualan sebesar 2264. Sedangkan S24 memiliki total order sebanyak 21 kali order dan total penjualan sebesar 1826. Kedua produk tersebut memberikan kontribusi sebesar 50% pada total order dan 60% pada total penjualan pada quarter 2.  

### Menghitung banyaknya customers yang tetap aktif bertransaksi
Mengetahui seberapa banyak customers yang tetap aktif menunjukkan apakah xyz.com tetap digemari oleh customers untuk memesan kebutuhan bisnis mereka. Hal ini juga dapat menjadi dasar bagi tim product dan business untuk pengembangan product dan business kedepannya. Adapun metrik yang digunakan disebut retention cohort. 

Oleh karena baru terdapat 2 periode yang Quarter 1 dan Quarter 2, maka retention yang dapat dihitung adalah retention dari customers yang berbelanja di Quarter 1 dan kembali berbelanja di Quarter 2, sedangkan untuk customers yang berbelanja di Quarter 2 baru bisa dihitung retentionnya di Quarter 3.

Sebelum menghitung banyaknya customers yang tetap aktif bertransaksi, terlebih dahulu kita akan menghitung banyaknya customers yang bertransaksi pada quarter 1 dengan query sebagai berikut
<p align="center">
  <img src="https://user-images.githubusercontent.com/82072832/125396960-78daa180-e3d7-11eb-8e39-f6c12d710ada.png">
</p>
Output:
<p align="center">
  <img src="https://user-images.githubusercontent.com/82072832/125397006-8a23ae00-e3d7-11eb-930c-76b19c1a814f.png">
</p>
Selanjutnya, akan dilakukan perhitungan persentasi banyaknya customer yang tetap aktif bertransaksi pada quarter 2 dengan query berikut
<p align="center">
  <img src="https://user-images.githubusercontent.com/82072832/125397781-9b20ef00-e3d8-11eb-92b7-4e21f9b8a6a1.png">
</p>
Output:
<p align="center">
  <img src="https://user-images.githubusercontent.com/82072832/125397845-b5f36380-e3d8-11eb-85d4-944b1b386d5e.png">
</p>
Berdasarkan output, terlihat bahwa dari 25 customers yang sudah melakukan transaksi pada quarter 1, hanya 24% customers yang masih aktif bertransaksi pada quarter 2.

### Kesimpulan
Berdasarkan analisis data yang telah dilakukan, diperoleh kesimpulan sebagai berikut:
1. Performance xyz.com menurun signifikan di quarter ke-2, terlihat dari nilai penjualan dan revenue yang drop hingga 22.75% dan 24.02%, perolehan customer baru juga tidak terlalu baik, dan sedikit menurun dibandingkan quarter sebelumnya.
2. Ketertarikan customer baru untuk berbelanja di xyz.com masih kurang, hanya sekitar 56.41% saja yang sudah bertransaksi. Disarankan tim Produk untuk perlu mempelajari behaviour customer dan melakukan product improvement, sehingga conversion rate (register to transaction) dapat meningkat.
3. Produk kategori S18 dan S24 berkontribusi sekitar 50% dari total order dan 60% dari total penjualan, sehingga xyz.com sebaiknya fokus untuk pengembangan category S18 dan S24.
4. Retention rate customer xyz.com juga sangat rendah yaitu hanya 24%, artinya banyak customer yang sudah bertransaksi di quarter-1 tidak kembali melakukan order di quarter ke-2 (no repeat order).
5. xyz.com mengalami pertumbuhan negatif di quarter ke-2 dan perlu melakukan banyak improvement baik itu di sisi produk dan bisnis marketing, jika ingin mencapai target dan positif growth di quarter ke-3. Rendahnya retention rate dan conversion rate bisa menjadi diagnosa awal bahwa customer tidak tertarik/kurang puas/kecewa berbelanja di xyz.com.
