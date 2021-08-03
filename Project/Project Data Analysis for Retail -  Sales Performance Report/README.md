<div align="center"> 
  <img src="https://user-images.githubusercontent.com/82072832/125252592-bfba8f80-e322-11eb-843b-d5ba42c839ac.png"> 
  <p> <i> Source: freepik </i> </p>
</div>

# Project Data Analysis for Retail - Sales Performance Report
Pada project ini, akan dilakukan analisis terhadap DQLab Sales Store dengan menggunakan MySQL. Dataset yang digunakan berisi transaksi dari tahun 2009 sampai dengan tahun 2012 dengan jumlah raw data sebanyak 5499, termasuk di dalamnya order status yang terbagi menjadi order finished, order returned dan order cancelled. Adapun dataset yang akan digunakan pada project ini berisi data:
1. OrderID
2. Order Status
3. Customer
4. Order Date
5. Order Quantity
6. Sales
7. Discount %
8. Discount
9. Product Category
10. Product Sub-Category

![image](https://user-images.githubusercontent.com/82072832/124280375-ce5eb500-db72-11eb-9468-127a13520f3e.png)

Berdasarkan data yang telah diberikan, pihak manajemen DQLab store ingin mengetahui:
1. Overall perofrmance DQLab Store dari tahun 2009 - 2012 untuk jumlah order dan total sales order finished
2. Overall performance DQLab by subcategory product yang akan dibandingkan antara tahun 2011 dan tahun 2012
3. Efektifitas dan efisiensi promosi yang dilakukan selama ini, dengan menghitung burn rate dari promosi yang dilakukan overall berdasarkan tahun
4. Efektifitas dan efisiensi promosi yang dilakukan selama ini, dengan menghitung burn rate dari promosi yang dilakukan overall berdasarkan sub-category
5. Analisa terhadap customer setiap tahunnya.

### Hasil Analisis
Berdasarkan [analisis data](https://github.com/ekawidyas/DigitalTalentScolarship-DQLab/blob/main/Project/Project%20Data%20Analysis%20for%20Retail%20-%20%20Sales%20Performance%20Report/Project%20Data%20Analysis%20for%20Retail%20-%20Sales%20Performance%20Report.md) yang telah dilakukan, diperoleh hasil sebagai berikut:
1. Secara keseluruhan total penjualan dan jumlah order pada setiap tahunnya mengalami perubahan. Namun, baik total pengeluaran maupun jumlah order pernah mengalami penurunan pada tahun 2011 (total penjualan) dan 2010 (jumlah order). Total penjualan tertinggi terjadi pada tahun 2009, sedangakn jumlah order terbanyak terjadi pada tahun 2012. 
2. Sebagian besar pertumbuhan penjualan mengarah pada peningkatan. Namun, ada beberapa sub kategori produk yang mengalami penurunan penjualan dari tahun 2011 hingga 2012.
3. Promosi yang dilakukan belum mampu menurunkan burn rate, hal tersebut terlihat dari hasil perhitungan burn rate yang masih di atas 4.5% sepanjang tahunnya. Artinya, efektivitas dan efisiensi promosi belum tercapai seperti yang diharapkan DQLab Store.
4. Masih banyak sub kategori produk yang memiliki burn rate diatas 4.5%, sehingga dapat memengaruhi burn rate setiap tahunnya. Hanya sub kategori Chairs & Chairmats, Telephones and Communication, Tables, Envelopes, dan Rubber Bands yang memiliki burn rate di bawah 4.5%.
5. Setiap tahunnya jumlah customer tidak mengalami perubahan yang signifikan, yaitu sekitar 580 - 595 customers.
