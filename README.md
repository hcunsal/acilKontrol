# Acil Kontrol Programı
Delphi 7 ve Paradox veritabanı kullanarak, pratik yapmak için yazdığım kodları bir araya getirdiğim projedir. Acil servislerde kullanılma mantığı ile basit işlemler üzerine kurulmuştur. Acil Tıp Teknikeri ve	Acil Tıp Uzmanı olmak üzere iki farklı kullanıcı tipi vardır. Tekniker hasta kayıt ile yetkilidir. Uzman ise yönlendirme işlemlerini yapar.
- - - - - - - - - - - - - - - 
## Kullanım
/ Projenin sağlıklı bir şekilde çalışması için Delphi 7 kullanmanızı öneririm.

/ Delphi 7 ile beraber gelen `BDE Administrator` üzerinden `acilkontrol` adında bir veritabanı oluşturarak path kısmını projede bulunan `data` klasörü yapmalısınız.

![Path klasörü](https://i.imgur.com/4Hh6JxZ.png)

/ Projede iki tip kullanıcı bulunmaktadır. Bunlar `users` adlı tabloda bulunur. Kullanıcı adı `1` ile başlayan uzmanı, `2` ile başlayan ise teknikeri ifade eder. Giriş ekranında yönlendirme yapılırken bu ayrıma göre farklı formlara yapılmaktadır.

| Kullanıcı Adı        | Şifre | Yetki  |
| ------------- |:---------:| :-----:|
| 1234567899      | 11223344 | Uzman |
| 2123456789      | 44556677 | Tekniker |

/ Tekniker formu üzerinde yapılan kayıtlar `hasta` adlı tabloda tutulur.

/ Uzman tarafından yapılan yönlendirmeden sonra `hasta` tablosunda bulunan veriler `yonlendirilmis` adlı tabloya aktarılır.

## Not
/ Tablolarda bulunan `id` alanı hiçbir yerde kullanılmamıştır. Program üzerinde test yaparken kullanmak için oluşturulmuş alandır.

/ Formlar üzerinde bulunan listelemeler bilerek DBGrid kullanarak **yapılmamıştır**.

/ Uzman formunda yönlendirme yapılacak bölüm sayısı arttırılabilir.

/ BDE Administrator kullanılmasının sebebi Delphi 7 ile gelen `Database Desktop` güncel işletim sistemlerinde çalışmamaktadır. Bu yüzden BDE Administrator ile veritabanı oluşturulduktan sonra `xDBD32` ile tablolar oluşturulmuştur.

/ Eğer program "database" hatası verirse, programı çalıştırmadan önce her seferinde `BDE Administrator`ı yönetici olarak çalıştırmak ve arka planda çalışır halde tutmak gerekir.