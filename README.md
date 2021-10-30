# Jarkom-Modul-2-E09-2021

## Nama Anggota Kelompok :
## 1. Dwinanda Bagoes Ansori (05111940000010) 
## 2. Bayu Eka Prawira (05111940000042) 
## 3. Kelvin Andersen (05111940000080)

</br>

### 1. Luffy adalah seorang yang akan jadi Raja Bajak Laut. Demi membuat Luffy menjadi Raja Bajak Laut, Nami ingin membuat sebuah peta, bantu Nami untuk membuat peta berikut:

![image](https://user-images.githubusercontent.com/58933506/139471365-510af117-2c5e-480d-9f06-68beb0879175.png)

### EniesLobby akan dijadikan sebagai DNS Master, Water7 akan dijadikan DNS Slave, dan Skypie akan digunakan sebagai Web Server. Terdapat 2 Client yaitu Loguetown, dan Alabasta. Semua node terhubung pada router Foosha, sehingga dapat mengakses internet.

Pertama, tambahkan node dan hubungkan masing-masing node hingga sesuai dengan gambar. Kemudian ganti hostname dari masing-masing node. Lalu setting network masing-masing node dengan fitur ```Edit network configuration```. Kemudian jalankan perintah ```iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.204.0.0/16``` pada router Foosha. Lalu ketikkan command``` echo nameserver 192.168.122.1 > /etc/resolv.conf``` pada masing-masing node ubuntu. Lalu lakukan pengecekkan dengan melakukan ping ke google. 

### 2. Luffy ingin menghubungi Franky yang berada di EniesLobby dengan denden mushi. Kalian diminta Luffy untuk membuat website utama dengan mengakses franky.yyy.com dengan alias www.franky.yyy.com pada folder kaizoku

Pertama, buat file ```franky.e09.com``` pada folder /etc/bind/kaizoku di EniesLobby. Lalu atur nama domain dan IP yang menuju ke EniesLobby (192.204.2.2) seperti pada gambar berikut. 
![no 2(1)](https://user-images.githubusercontent.com/81345045/139519546-4f231398-f4b2-4eef-84f1-ebed9d07d7f1.png) 
Lalu pada file ```/etc/bind/named.conf.local``` di EniesLobby, buat zone ```franky.e09.com``` dengan type master dan file /etc/bind/kaizoku/franky.e09.com. 
![no 2(2)](https://user-images.githubusercontent.com/81345045/139519556-81787796-a324-48bb-a021-251e6d490892.png) 
Kemudian ping www.franky.e09.com pada node LogueTown dan akan menampilkan tampilan sebagai berikut. 
![no 2(3)](https://user-images.githubusercontent.com/81345045/139519570-d07de655-d1e6-41ee-a4c8-267621a4b4d5.png) 

### 3. Setelah itu buat subdomain super.franky.yyy.com dengan alias www.super.franky.yyy.com yang diatur DNS nya di EniesLobby dan mengarah ke Skypie

Pertama, atur nama subdomain, CNAME dan IP yang menuju ke Skypie (192.204.2.4) pada file ```franky.e09.com``` di folder /etc/bind/kaizoku pada node EniesLobby seperti pada gambar berikut.
![no 3(1)](https://user-images.githubusercontent.com/81345045/139519579-0a5569db-38a9-4bc9-92d0-c4007ad31982.png) 
Lalu ping ```www.super.franky.e09.com``` pada node LogueTown dan akan memunculkan tampilan seperti pada gambar berikut
![no 3(2)](https://user-images.githubusercontent.com/81345045/139519584-fbc3171a-e41d-4539-a81b-879173813d74.png)

### 4. Buat juga reverse domain untuk domain utama

Pertama, tambahkan zone ```2.204.192.in-addr.arpa``` dengan type master dan file ```/etc/bind/kaizoku/2.204.192.in-addr.arpa``` pada file /etc/bind/named.conf.local di node EniesLobby.
![no 4(1)](https://user-images.githubusercontent.com/81345045/139519592-e17f2407-8ba8-4586-afbf-00613dbe649d.png) 
Lalu buat file ```2.204.192.in-addr.arpa ``` pada folder /etc/bind/kaizoku di EniesLobby. Lalu atur nama domain dan PTR yang menuju ke franky.e09.com seperti pada gambar berikut.
![no 4(2)](https://user-images.githubusercontent.com/81345045/139519600-67b74470-c597-4aff-8651-e8fa3ee7d201.png) 
Kemudian lakukan pengecekkan dengan command ```host -t PTR 192.204.2.2 yang akan mengarah ke franky.09.com
![no 4(3)](https://user-images.githubusercontent.com/81345045/139519605-95fb7ca3-9ce7-4ab2-af25-935d0e2b41cb.png) 

### 5. Supaya tetap bisa menghubungi Franky jika server EniesLobby rusak, maka buat Water7 sebagai DNS Slave untuk domain utama

Pertama, edit file /etc/bind/named.conf.local pada node EniesLobby dengan menambahkan notify yes, also-notify dan allow-transfer dengan IP Water7 seperti pada gambar berikut
![no 5(1)](https://user-images.githubusercontent.com/81345045/139519609-bd38d38e-5fd3-498a-80c2-ce7578930922.png) 
Lalu, edit file /etc/bind/named.conf.local pada node Water7 dengan menambahkan zone ```franky.e09.com``` dengan type slave, masters IP EniesLobby, dan file /etc/bind/kaizoku/franky.e09.com. 
![no 5(2)](https://user-images.githubusercontent.com/81345045/139519616-c39b051a-4c39-49cf-b860-3c2ceeee554a.png) 
Kemudian stop node EniesLobby
![no 5(3)](https://user-images.githubusercontent.com/81345045/139519630-a3c8459d-5d99-4e8f-bb55-116fdb13bbec.png) 
Lalu lakukan pengecekkan dengan melakukan ping franky.e09.com pada node LogueTown yang akan menerima paket dari IP EniesLobby walaupun telah dimatikan.
![no 5(4)](https://user-images.githubusercontent.com/81345045/139519634-394c8f11-dc1c-40c5-acfc-125cb2936a45.png) 

### 6. Setelah itu terdapat subdomain mecha.franky.yyy.com dengan alias www.mecha.franky.yyy.com yang didelegasikan dari EniesLobby ke Water7 dengan IP menuju ke Skypie dalam folder sunnygo

Pertama, ubah file /etc/bind/named.conf.options pada node EniesLobby dengan meng-comment ```dnssec-validation auto;``` dan menambahkan ```allow-query(any;};```.
![no 6(1)](https://user-images.githubusercontent.com/81345045/139519640-b6034493-092f-4d23-aa45-379348f4f638.png) 
Kemudian, ubah file /etc/bind/named.conf.local di node EniesLobby pada bagian zone franky.e09.com sehingga menyisakan baris type, file, dan allow-transfer. 
![no 6(2)](https://user-images.githubusercontent.com/81345045/139519657-9dea5c0f-fe70-48ed-932f-30a8c05a0f8c.png) 
Lalu, ubah /etc/bind/kaizoku/franky.e09.com pada node EniesLobby menjadi domain utama yang IP yang menuju ke node Skypie, dan membuat domain mecha yang didelegasikan ke IP Water7
![no 6(3)](https://user-images.githubusercontent.com/81345045/139519665-c66161c2-403e-4fc5-af5e-219b1d2b5918.png) 
Kemudian, ubah file /etc/bind/named.conf.options pada node Water7 dengan meng-comment ```dnssec-validation auto;``` dan menambahkan ```allow-query(any;};```.
![no 6(4)](https://user-images.githubusercontent.com/81345045/139519669-c3429d62-98d9-44dd-9775-28cf6036e2c5.png) 
Lalu, edit file /etc/bind/named.conf.local pada node Water7 dengan menambahkan zone ```mecha.franky.e09.com``` dengan type master dan file ```/etc/bind/sunnygo/mecha.franky.e09.com```.
![no 6(5)](https://user-images.githubusercontent.com/81345045/139519675-72544c2f-f505-4855-bf41-0decffcb6276.png) 
Kemudian, buat file /etc/bind/sunnygo/mecha.franky.e09.com pada node Water7 dan mengatur domainnya menuju mecha.franky.e09.com dengan IP Skypie (192.204.2.4) dengan CNAME www.
![no 6(6)](https://user-images.githubusercontent.com/81345045/139519690-f4265590-b432-473c-a0ee-9e45ccb12bef.png) 
Lalu lakukan ping www.mecha.franky.e09.com pada node LogueTown dan akan menerima paket dari IP Skypie
![no 6(7)](https://user-images.githubusercontent.com/81345045/139519693-05fdb34c-7afb-4349-8f48-c11a5dfe4fef.png) 

### 7. Untuk memperlancar komunikasi Luffy dan rekannya, dibuatkan subdomain melalui Water7 dengan nama general.mecha.franky.yyy.com dengan alias www.general.mecha.franky.yyy.com yang mengarah ke Skypie

### 8. Setelah melakukan konfigurasi server, maka dilakukan konfigurasi Webserver. Pertama dengan webserver www.franky.yyy.com. Pertama, luffy membutuhkan webserver dengan DocumentRoot pada /var/www/franky.yyy.com.

### 9. Setelah itu, Luffy juga membutuhkan agar url www.franky.yyy.com/index.php/home dapat menjadi menjadi www.franky.yyy.com/home.

### 10. Setelah itu, Luffy juga membutuhkan agar url www.franky.yyy.com/index.php/home dapat menjadi menjadi www.franky.yyy.com/home.

### 11. Akan tetapi, pada folder /public, Luffy ingin hanya dapat melakukan directory listing saja

### 12. Tidak hanya itu, Luffy juga menyiapkan error file 404.html pada folder /errors untuk mengganti error kode pada apache

### 13. Luffy juga meminta Nami untuk dibuatkan konfigurasi virtual host. Virtual host ini bertujuan untuk dapat mengakses file asset www.super.franky.yyy.com/public/js menjadi www.super.franky.yyy.com/js

Pertama kita mengubah isi dari file ```/etc/apache2/sites-available/super.franky.e09.com.conf``` seperti pada gambar di bawah ini. Kita menambahkan konfigurasi :
```conf
Alias "/js" "/var/www/super.franky.e09.com/public/js"
```
untuk membuat alias agar ketika mengakses http://www.super.franky.e09.com/js bisa mengarah langsung ke http://www.super.franky.e09.com/public/js

![image](https://user-images.githubusercontent.com/58933506/139473816-5fb521e8-ed79-4ef9-9a94-d8d786892ac9.png)

Lalu kita melakukan testing pada client ```Loguetown``` dan menghasilkan sebagai berikut

![image](https://user-images.githubusercontent.com/58933506/139473862-08e5d9be-b0da-4170-982f-b0c45290edfd.png)
![image](https://user-images.githubusercontent.com/58933506/139473893-5c97752b-bef7-40d1-a536-22959e06d2f7.png)

Dari gambar di atas, Alias telah berjalan dengan benar.

### 14. Dan Luffy meminta untuk web www.general.mecha.franky.yyy.com hanya bisa diakses dengan port 15000 dan port 15500

Dari subdomain www.general.mecha.franky.e09.com yang telah dibuat, kita harus membuat virtualhost untuk port 15000 dan 15500 dengan membuat file /etc/apache2/sites-available/general.mecha.franky.e09.com-15000.conf dan /etc/apache2/sites-available/general.mecha.franky.e09.com-15500.conf
* /etc/apache2/sites-available/general.mecha.franky.e09.com-15000.conf
![image](https://user-images.githubusercontent.com/58933506/139473945-d089a50a-aca3-4b9d-8346-b70167bda235.png)
* /etc/apache2/sites-available/general.mecha.franky.e09.com-15500.conf
![image](https://user-images.githubusercontent.com/58933506/139473971-8520dff3-e857-4385-93e9-951855d5c233.png)

Lalu menambahkan 
``` 
Listen 15000
Listen 15500
```
pada file /etc/apache2/Ports.conf agar apache2 bisa mengakses port 15000 dan port 15500

![image](https://user-images.githubusercontent.com/58933506/139473999-a06140be-c1f2-45f8-a430-e74ece90000d.png)

Lalu melakukan testing dengan mengakses http://general.mecha.franky.e09.com:15000 dari client

![image](https://user-images.githubusercontent.com/58933506/139474045-3e7a02b4-1e3f-42d9-a95f-48076b9f5358.png)
![image](https://user-images.githubusercontent.com/58933506/139474068-2703b1a1-62c1-4066-a166-872a5af36a18.png)

Dari gambar di atas, akses ke http://general.mecha.franky.e09.com dengan port 15000 bisa dilakukan. \
Lalu melakukan testing lagi untuk port 15500 dengan mengakses http://general.mecha.franky.e09.com:15500 dari client

![image](https://user-images.githubusercontent.com/58933506/139474142-cd768274-42b6-43b4-a37e-eeb6ac7e761b.png)
![image](https://user-images.githubusercontent.com/58933506/139474178-05892c6f-a178-4f88-892b-ffb13d0d6101.png)

Dari gambar di atas, akses ke http://general.mecha.franky.e09.com dengan port 15500 bisa dilakukan dan mengarah ke directory yang sama dengan port 15000.

### 15. Dengan authentikasi username luffy dan password onepiece dan file di /var/www/general.mecha.franky.yyy

Dengan membuat file ```.htpasswd``` pada ```/etc/apache2/``` dengan memasukkan syntax
```
htpasswd -c /etc/apache2/.htpasswd luffy
```
dan memasukkan password ```onepiece```, yang jika kita membuka file ```.htpasswd``` tersebut, password telah terenkripsi

![image](https://user-images.githubusercontent.com/58933506/139474203-2e31ddd8-2459-47e0-9f1b-ef9de7c03fd6.png)

Lalu di dalam file /etc/apache2/sites-available/general.mecha.franky.e09.com-15000.conf, dimasukkan config Authentication 
```
<Directory /var/www/general.mecha.franky.e09.com>
    AuthType Basic
    AuthName "Restricted Content"
    AuthUserFile /etc/apache2/.htpasswd
    Require valid-user
</Directory>
```

![image](https://user-images.githubusercontent.com/58933506/139474221-e5f0b125-e200-40f8-861d-a1b475a687da.png)

Lalu dilakukan testing dari client dengan memasukkan port 15000

![image](https://user-images.githubusercontent.com/58933506/139474246-44e10e49-fab6-4037-969e-701e13981e20.png)

Kita diminta untuk memasukkan user yang telah terdaftar pada ```/etc/apache2/.htpasswd``` yaitu ```luffy``` dan password ```onepiece```

![image](https://user-images.githubusercontent.com/58933506/139474275-76696f68-9b7e-4faf-8748-afc86d57418d.png)
![image](https://user-images.githubusercontent.com/58933506/139474287-ebcd262a-67e2-4d26-a672-0b03a0f0052a.png)

Lalu dapat dihasilkan isi dari web http://www.general.mecha.franky.e09.com yang diakses dari port 15000.

![image](https://user-images.githubusercontent.com/58933506/139474306-e7b160a8-2a20-45cd-a8dd-b52c47b08b9a.png)

Lalu di dalam file /etc/apache2/sites-available/general.mecha.franky.e09.com-15500.conf, juga dimasukkan config Authentication 
```
<Directory /var/www/general.mecha.franky.e09.com>
    AuthType Basic
    AuthName "Restricted Content"
    AuthUserFile /etc/apache2/.htpasswd
    Require valid-user
</Directory>
```

![image](https://user-images.githubusercontent.com/58933506/139474326-e3838a6d-8fc2-41a5-a69a-0b31c29fa7fb.png)

Lalu dilakukan testing dari client dengan memasukkan port 15500

Kita diminta untuk memasukkan user yang telah terdaftar pada ```/etc/apache2/.htpasswd``` yaitu ```luffy``` dan password ```onepiece```

![image](https://user-images.githubusercontent.com/58933506/139474345-f45cb185-88a9-4398-b2f4-be12e198cd05.png)
![image](https://user-images.githubusercontent.com/58933506/139474355-f41c05e2-4357-4c2d-8223-45e8297a1afb.png)

Lalu dapat dihasilkan isi dari web http://www.general.mecha.franky.e09.com yang diakses dari port 15500.

![image](https://user-images.githubusercontent.com/58933506/139474371-db177685-1b39-4b31-affb-6a617540e125.png)


### 16. Dan setiap kali mengakses IP Skypie akan dialihkan secara otomatis ke www.franky.yyy.com

Karena pada beberapa soal sebelumnya, kita sudah berhasil mendaftarkan domain www.franky.e09.com ke IP Skypie, maka ketika kita mengakses langsung IP Skypie, kita akan secara langsung dialihkan ke www.franky.e09.com

* Enieslobby -> /etc/bind/kaizoku/franku.e09.com
![image](https://user-images.githubusercontent.com/58933506/139474404-4db106af-c3b2-42e0-9738-d8e191bb2376.png)

* Melakukan testing pada client Loguetown
![image](https://user-images.githubusercontent.com/58933506/139474428-7dac6daa-81c0-408f-ad7e-0c64e5353e9d.png)

* Didapatkan hasil sebagai berikut
![image](https://user-images.githubusercontent.com/58933506/139474443-d6b6cdde-a6ad-4c71-a871-3bc8aa0a2dc1.png)


### 17. Dikarenakan Franky juga ingin mengajak temannya untuk dapat menghubunginya melalui website www.super.franky.yyy.com, dan dikarenakan pengunjung web server pasti akan bingung dengan randomnya images yang ada, maka Franky juga meminta untuk mengganti request gambar yang memiliki substring “franky” akan diarahkan menuju franky.png. Maka bantulah Luffy untuk membuat konfigurasi dns dan web server ini!

Hal pertama yang kita lakukan adalah dengan membuat file ```.htaccess``` pada ```/var/www/super.franky.e09.com/public/images``` dengan memasukkan syntax sebagai berikut

```
RewriteEngine On
RewriteBase /
RewriteCond %{REQUEST_FILENAME} !\bfranky.png\b
RewriteRule franky http://www.super.franky.e09.com/public/images/franky.png$1 [L,R=301]
```

di mana dilakukan untuk melakukan redirect secara custom

```RewriteCond %{REQUEST_FILENAME} !\bfranky.png\b``` digunakan untuk memfilter setiap file yang tidak bernama ```franky.png```

Lalu di-rewrite lagi dengan menggunakan ```RewriteRule franky http://www.super.franky.e09.com/public/images/franky.png$1 [L,R=301]``` yang mendeteksi jika terdapat file yang memiliki substring ```franky``` akan diredirect ke file http://www.super.franky.e09.com/public/images/franky.png

![image](https://user-images.githubusercontent.com/58933506/139483386-c0d71c4f-20bf-48ec-bc42-a75c08fa1b8c.png)

Lalu dengan menambahkan 
```
AllowOverride All
```
pada file ```/etc/apache2/sites-available/super.franky.e09.com.conf```

![image](https://user-images.githubusercontent.com/58933506/139474500-f517bab1-783b-4be0-b5c1-4d58450d467d.png)

Melakukan testing pada client

![image](https://user-images.githubusercontent.com/58933506/139474519-ea6d572f-d7ac-4a39-948e-7b766ad8e430.png)

Ketika mendownload file ```frankysupersecretfood.cursed``` maka, web akan mendirect ke file ```franky.png```, karena pada file ```frankysupersecretfood.cursed``` terdapat substring ```franky```.

![image](https://user-images.githubusercontent.com/58933506/139474529-291f2cec-48a6-4cd3-b1f2-c21886f45929.png)
![image](https://user-images.githubusercontent.com/58933506/139474553-9e3b2a55-ab0d-44b6-a7a2-247bb997e5c0.png)

Jika tidak terdapat substring ```franky```, maka akan mendownload file yang sebenarnya ditunjuk, seperti file ```background_frank.jpg``` akan mendownload filenya sendiri.

![image](https://user-images.githubusercontent.com/58933506/139474570-24dbf4d3-aad1-4a43-9d47-b7dc91ad5576.png)
![image](https://user-images.githubusercontent.com/58933506/139474587-327be6b5-24cc-4fcd-9c39-141d5e722b7f.png)

