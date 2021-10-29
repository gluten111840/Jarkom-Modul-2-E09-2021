# Jarkom-Modul-2-E09-2021

## Nama Anggota Kelompok :
## 1. Dwinanda Bagoes Ansori (05111940000010) 
## 2. Bayu Eka Prawira (05111940000042) 
## 3. Kelvin Andersen (05111940000080)

## 1. Luffy adalah seorang yang akan jadi Raja Bajak Laut. Demi membuat Luffy menjadi Raja Bajak Laut, Nami ingin membuat sebuah peta, bantu Nami untuk membuat peta berikut:

![image](https://user-images.githubusercontent.com/58933506/139471365-510af117-2c5e-480d-9f06-68beb0879175.png)

## EniesLobby akan dijadikan sebagai DNS Master, Water7 akan dijadikan DNS Slave, dan Skypie akan digunakan sebagai Web Server. Terdapat 2 Client yaitu Loguetown, dan Alabasta. Semua node terhubung pada router Foosha, sehingga dapat mengakses internet.

## 2. Luffy ingin menghubungi Franky yang berada di EniesLobby dengan denden mushi. Kalian diminta Luffy untuk membuat website utama dengan mengakses franky.yyy.com dengan alias www.franky.yyy.com pada folder kaizoku

## 3. Setelah itu buat subdomain super.franky.yyy.com dengan alias www.super.franky.yyy.com yang diatur DNS nya di EniesLobby dan mengarah ke Skypie

## 4. Buat juga reverse domain untuk domain utama

## 5. Supaya tetap bisa menghubungi Franky jika server EniesLobby rusak, maka buat Water7 sebagai DNS Slave untuk domain utama

## 6. Setelah itu terdapat subdomain mecha.franky.yyy.com dengan alias www.mecha.franky.yyy.com yang didelegasikan dari EniesLobby ke Water7 dengan IP menuju ke Skypie dalam folder sunnygo

## 7. Untuk memperlancar komunikasi Luffy dan rekannya, dibuatkan subdomain melalui Water7 dengan nama general.mecha.franky.yyy.com dengan alias www.general.mecha.franky.yyy.com yang mengarah ke Skypie

## 8. Setelah melakukan konfigurasi server, maka dilakukan konfigurasi Webserver. Pertama dengan webserver www.franky.yyy.com. Pertama, luffy membutuhkan webserver dengan DocumentRoot pada /var/www/franky.yyy.com.

## 9. Setelah itu, Luffy juga membutuhkan agar url www.franky.yyy.com/index.php/home dapat menjadi menjadi www.franky.yyy.com/home.

## 10. Setelah itu, Luffy juga membutuhkan agar url www.franky.yyy.com/index.php/home dapat menjadi menjadi www.franky.yyy.com/home.

## 11. Akan tetapi, pada folder /public, Luffy ingin hanya dapat melakukan directory listing saja

## 12. Tidak hanya itu, Luffy juga menyiapkan error file 404.html pada folder /errors untuk mengganti error kode pada apache

## 13. Luffy juga meminta Nami untuk dibuatkan konfigurasi virtual host. Virtual host ini bertujuan untuk dapat mengakses file asset www.super.franky.yyy.com/public/js menjadi www.super.franky.yyy.com/js

![image](https://user-images.githubusercontent.com/58933506/139473816-5fb521e8-ed79-4ef9-9a94-d8d786892ac9.png)
![image](https://user-images.githubusercontent.com/58933506/139473862-08e5d9be-b0da-4170-982f-b0c45290edfd.png)
![image](https://user-images.githubusercontent.com/58933506/139473893-5c97752b-bef7-40d1-a536-22959e06d2f7.png)

## 14. Dan Luffy meminta untuk web www.general.mecha.franky.yyy.com hanya bisa diakses dengan port 15000 dan port 15500

![image](https://user-images.githubusercontent.com/58933506/139473945-d089a50a-aca3-4b9d-8346-b70167bda235.png)
![image](https://user-images.githubusercontent.com/58933506/139473971-8520dff3-e857-4385-93e9-951855d5c233.png)
![image](https://user-images.githubusercontent.com/58933506/139473999-a06140be-c1f2-45f8-a430-e74ece90000d.png)
![image](https://user-images.githubusercontent.com/58933506/139474045-3e7a02b4-1e3f-42d9-a95f-48076b9f5358.png)
![image](https://user-images.githubusercontent.com/58933506/139474068-2703b1a1-62c1-4066-a166-872a5af36a18.png)
![image](https://user-images.githubusercontent.com/58933506/139474142-cd768274-42b6-43b4-a37e-eeb6ac7e761b.png)
![image](https://user-images.githubusercontent.com/58933506/139474178-05892c6f-a178-4f88-892b-ffb13d0d6101.png)


## 15. Dengan authentikasi username luffy dan password onepiece dan file di /var/www/general.mecha.franky.yyy

![image](https://user-images.githubusercontent.com/58933506/139474203-2e31ddd8-2459-47e0-9f1b-ef9de7c03fd6.png)
![image](https://user-images.githubusercontent.com/58933506/139474221-e5f0b125-e200-40f8-861d-a1b475a687da.png)
![image](https://user-images.githubusercontent.com/58933506/139474246-44e10e49-fab6-4037-969e-701e13981e20.png)
![image](https://user-images.githubusercontent.com/58933506/139474275-76696f68-9b7e-4faf-8748-afc86d57418d.png)
![image](https://user-images.githubusercontent.com/58933506/139474287-ebcd262a-67e2-4d26-a672-0b03a0f0052a.png)
![image](https://user-images.githubusercontent.com/58933506/139474306-e7b160a8-2a20-45cd-a8dd-b52c47b08b9a.png)
![image](https://user-images.githubusercontent.com/58933506/139474326-e3838a6d-8fc2-41a5-a69a-0b31c29fa7fb.png)
![image](https://user-images.githubusercontent.com/58933506/139474345-f45cb185-88a9-4398-b2f4-be12e198cd05.png)
![image](https://user-images.githubusercontent.com/58933506/139474355-f41c05e2-4357-4c2d-8223-45e8297a1afb.png)
![image](https://user-images.githubusercontent.com/58933506/139474371-db177685-1b39-4b31-affb-6a617540e125.png)


## 16. Dan setiap kali mengakses IP Skypie akan diahlikan secara otomatis ke www.franky.yyy.com

![image](https://user-images.githubusercontent.com/58933506/139474404-4db106af-c3b2-42e0-9738-d8e191bb2376.png)
![image](https://user-images.githubusercontent.com/58933506/139474428-7dac6daa-81c0-408f-ad7e-0c64e5353e9d.png)
![image](https://user-images.githubusercontent.com/58933506/139474443-d6b6cdde-a6ad-4c71-a871-3bc8aa0a2dc1.png)


## 17. Dikarenakan Franky juga ingin mengajak temannya untuk dapat menghubunginya melalui website www.super.franky.yyy.com, dan dikarenakan pengunjung web server pasti akan bingung dengan randomnya images yang ada, maka Franky juga meminta untuk mengganti request gambar yang memiliki substring “franky” akan diarahkan menuju franky.png. Maka bantulah Luffy untuk membuat konfigurasi dns dan web server ini!

![image](https://user-images.githubusercontent.com/58933506/139474474-56dc1a97-6a2b-4f35-b68f-7aabfa190dea.png)
![image](https://user-images.githubusercontent.com/58933506/139474500-f517bab1-783b-4be0-b5c1-4d58450d467d.png)
![image](https://user-images.githubusercontent.com/58933506/139474519-ea6d572f-d7ac-4a39-948e-7b766ad8e430.png)
![image](https://user-images.githubusercontent.com/58933506/139474529-291f2cec-48a6-4cd3-b1f2-c21886f45929.png)
![image](https://user-images.githubusercontent.com/58933506/139474553-9e3b2a55-ab0d-44b6-a7a2-247bb997e5c0.png)
![image](https://user-images.githubusercontent.com/58933506/139474570-24dbf4d3-aad1-4a43-9d47-b7dc91ad5576.png)
![image](https://user-images.githubusercontent.com/58933506/139474587-327be6b5-24cc-4fcd-9c39-141d5e722b7f.png)

