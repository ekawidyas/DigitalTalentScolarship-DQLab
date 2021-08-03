Pada project ini, kita akan menggunakan tabel **dqlab_sales_store** dengan informasi sebagai berikut:
<p align="center"> 
  <img src="https://user-images.githubusercontent.com/82072832/125387522-437a8780-e3c8-11eb-9590-9ee13b0bc97c.png"> 
<p />
Di bawah ini adalah tampilan lima data teratas dari dataset
<p align="center"> 
  <img src="https://user-images.githubusercontent.com/82072832/124287159-e71e9900-db79-11eb-9912-6cd3b2522841.png"> 
<p />

### Overall Performance by Year

Untuk mendapatkan nilai overall performance by year, kita akan menghitung total penjualan (sales) dan jumlah order (number_of_order) dari tahun 2009 sampai 2012 (years) dengan menggunakan query sebagai berikut
<p align="center"> 
  <img src="https://user-images.githubusercontent.com/82072832/124768731-1ad73580-df63-11eb-991a-45a0a250ab8b.png"> 
<p />
Field order_date pada tabel dqlab_sales_store bertipe <i> date</i>, sehingga untuk mendapatkan tahun (year) yang merupakan bagian dari tanggal kita dapat menggunakan function YEAR(). Kemudian, kita dapat menggunakan function SUM() untuk mendapatkan total penjualan dan function COUNT() untuk menghitung banyaknya jumlah order. Untuk memfilter order_status yang memiliki status order 'Order Finished', kita dapat menggunakan klausa WHERE. Lebih lanjut, untuk melakukan perhitungan berdasarkan tahun, maka perlu untuk menambahkan GROUP BY 1 (year) pada query.

Query di atas menghasilkan output
<p align="center">
  <img src="https://user-images.githubusercontent.com/82072832/124772253-12ccc500-df66-11eb-81d7-d8c0e48bb60f.png"> 
<p />
Berdasarkan output, terlihat bahwa total penjualan dan jumlah order pada setiap tahunnya mengalami perubahan. Total penjualan mengalami penurunan pada tahun 2010 dan mengalami kenaikan pada tahun 2011 & 2012. Jumlah order mengalami kenaikan pada tahun 2010 dan 2012, serta mengalami penurunan pada tahun 2011. Tahun 2009 merupakan tahun dengan total penjualan tertinggi, yaitu sebesar 4613872681 dengan jumlah order sebanyak 1244 order. Sedangkan jumlah order terbanyak terjadi pada tahun 2012, yaitu sebesar 1254 order. 

### Overall Performance by Product Sub Category
Perhitungan overall performance by product sub category akan dilakukan untuk tahun 2011 & 2012 yang memiliki status order 'Order Finished' dengan query sebagai berikut
<p align="center">
  <img src="https://user-images.githubusercontent.com/82072832/124776235-79071700-df69-11eb-872c-8d2d8904ed49.png"> 
<p />
Output:
<!-- <p align="center">
  <img src="https://user-images.githubusercontent.com/82072832/124781566-b4a3e000-df6d-11eb-9c6c-d0cc03bf1c34.png"> 
<p /> -->

**years** | **product_sub_category** | **sales**
---------- | ---------- | ----------
2011 | Chairs & Chairmats| 622962720
2011 | Office Machines | 545856280
2011 | Tables| 505875008
2011 | Copiers and Fax | 404074080
2011 | Telephones and Communication| 392194658
2011 | Binders and Binder Accessories| 298023200
2011 | Storage & Organization| 285991820
2011 | Appliances| 272630020
2011 | Computer Peripherals| 232677960
2011 | Bookcases | 169304620
2011 | Office Furnishings| 160471500
2011 | Paper | 111080380
2011 | Pens & Art Supplies | 43093800
2011 | Envelopes | 36463900
2011 | Labels| 15607780
2011 | Scissors, Rulers and Trimmers | 12638340
2011 | Rubber Bands| 3090120
2012 | Office Machines | 811427140
2012 | Chairs & Chairmats| 654168740
2012 | Telephones and Communication| 422287514
2012 | Tables| 388993784
2012 | Binders and Binder Accessories| 363879200
2012 | Storage & Organization| 356714140
2012 | Computer Peripherals| 308014340
2012 | Copiers and Fax | 292489800
2012 | Appliances| 266131100
2012 | Office Furnishings| 178927480
2012 | Bookcases | 159984680
2012 | Paper | 126896160
2012 | Envelopes | 58629280
2012 | Pens & Art Supplies | 43818480
2012 | Scissors, Rulers and Trimmers | 36776400
2012 | Labels| 10007040
2012 | Rubber Bands| 3837880

Berdasarkan output di atas, terlihat bahwa sebagian besar pertumbuhan penjualan mengarah pada peningkatan. Namun ada beberapa sub kategori produk yang mengalami penurunan penjualan dari tahun 2011 hingga 2012. Pada tahun 2011 Chairs & Chairmats merupakan sub kategori produk yang memiliki total penjualan tertinggi, yaitu sebesar 622962720. Sedangkan pada tahun 2012 Office Machines merupakan sub kategori produk yang memiliki total penjualan tertinggi, yaitu sebesar 811427140.

### Promotion Effectiveness and Efficiency by Years
Efektifitas dan efisiensi dari promosi yang dilakukan akan dianalisa berdasarkan Burn Rate yaitu dengan membandingkan total value promosi yang dikeluarkan terhadap total sales yang diperoleh. DQLab berharap bahwa burn rate tetap berada diangka maskimum 4.5%. Formula untuk burn rate adalah sebagai berikut
```
Formula untuk burn rate : (total discount / total sales) * 100
```
Berikut adalah query yang digunakan
<p align="center">
  <img src="https://user-images.githubusercontent.com/82072832/125235968-757ae380-e30d-11eb-8750-34a87987bc79.png"> 
<p />
            
Output:
<p align="center">
  <img src="https://user-images.githubusercontent.com/82072832/125232616-321d7680-e307-11eb-9b33-b3813de2cad2.png"> 
<p />

Berdasarkan output, terlihat bahwa setiap tahunnya memiliki burn rate di atas 4.5%. Artinya, promosi yang dilakukan belum mampu menurunkan burn rate, sehingga efektivitas dan efisiensi promosi belum tercapai seperti yang diharapkan DQLab Store. Lebih lanjut, kita akan melakukan perhitungan burn rate pada setiap sub kategori produk untuk mengetahui produk apa yang memberikan kontribusi signifikan yang menyebabkan burn rate lebih tinggi dari yang diharapkan dengan mengelompokkan kueri berdasarkan setiap produk. 

### Promotion Effectiveness and Efficiency by Product Sub Category
Pada bagian ini kita akan melakukan analisa terhadap efektifitas dan efisiensi dari promosi yang sudah dilakukan selama ini seperti pada bagian sebelumnya. Namun, perhitungan akan dilakukan hanya untuk tahun 2012 saja dengan query sebagai berikut
<p align="center">
  <img src="https://user-images.githubusercontent.com/82072832/125236192-becb3300-e30d-11eb-8245-d2daed3f0641.png"> 
<p />

Output:
<p align="center">
  <img src="https://user-images.githubusercontent.com/82072832/125234164-56c71d80-e30a-11eb-9ca2-c6f2a3d3c64f.png"> 
<p />

Berdasarkan output, terlihat bahwa hanya 5 sub kategori yang memiliki burn rate dibawah 4.5%. Artinya, masih banyak sub kategori produk yang memiliki burn rate diatas 4,5%.

### Customers Transactions per Year
Pada bagian ini, DQLab Store ingin mengetahui jumlah customer (number_of_customer) yang bertransaksi setiap tahunnya dari 2009 sampai 2012 (years). Untuk menghindari nilai rankap (_duplicate value_) dalam perhitungan jumlah customer, maka perlu digunakan DISTINCT seperti berikut
<p align="center">
  <img src="https://user-images.githubusercontent.com/82072832/125236580-719b9100-e30e-11eb-8965-728ba3f25d8e.png"> 
<p />

Output:
<p align="center">
  <img src="https://user-images.githubusercontent.com/82072832/125236626-8546f780-e30e-11eb-9e2c-8dbbef7671ff.png"> 
<p />

Berdasarkan output, secara keseluruhan jumlah customer tidak mengalami perubahan yang signifikan, dimana jumlah customer berada dalam rentang 580 - 595 customers.

## Kesimpulan
Berdasarkan analisis data yang telah dilakukan, didapat kesimpulan sebagai berikut:
1. Secara keseluruhan total penjualan dan jumlah order pada setiap tahunnya mengalami perubahan. Namun, baik total pengeluaran maupun jumlah order pernah mengalami penurunan pada tahun 2011 (total penjualan) dan 2010 (jumlah order). Total penjualan tertinggi terjadi pada tahun 2009, sedangakn jumlah order terbanyak terjadi pada tahun 2012. 
2. Sebagian besar pertumbuhan penjualan mengarah pada peningkatan. Namun, ada beberapa sub kategori produk yang mengalami penurunan penjualan dari tahun 2011 hingga 2012.
3. Promosi yang dilakukan belum mampu menurunkan burn rate, hal tersebut terlihat dari hasil perhitungan burn rate yang masih di atas 4.5% sepanjang tahunnya. Artinya, efektivitas dan efisiensi promosi belum tercapai seperti yang diharapkan DQLab Store.
4. Masih banyak sub kategori produk yang memiliki burn rate diatas 4.5%, sehingga dapat memengaruhi burn rate setiap tahunnya. Hanya sub kategori Chairs & Chairmats, Telephones and Communication, Tables, Envelopes, dan Rubber Bands yang memiliki burn rate di bawah 4.5%.
5. Setiap tahunnya jumlah customer tidak mengalami perubahan yang signifikan, yaitu sekitar 580 - 595 customers.
