---
output:
  pdf_document: default
  html_document: default
---
# R Kılavuzu
### 1. Temel Bilgiler

| Komutlar | Komut | Açıklama |
|------------------|------------------|-------------------------------------|
|  | `objects()` | Çalışma alanında bulunan nesnelerin listesi |
|  | `ls()` | Aynısı |
|  | `rm(object)` | 'object' nesnesini sil |
| **Atamalar** | `<-` | Bir değişkene değer ata |
|  | `=` | Aynısı |
| **Yardım Almak** | `help(fun)` | fun() fonksiyonu için yardım dosyasını göster |
|  | `args(fun)` | fun() fonksiyonunun argümanlarını listele |
| **Kütüphaneler/Paketler** | `library(pkg)` | 'pkg' paketini aç |
|  | `library(help=pkg)` | 'pkg' paketi için açıklamayı göster |

### 2. Vektörler ve Veri Türleri

| Oluşturma | Komut | Açıklama |
|------------------|--------------------|-----------------------------------|
|  | `seq(-4,4,0.1)` | Dizi: -4.0, -3.9, -3.8, ..., 3.9, 4.0 |
|  | `2:7` | `seq(2,7,1)` ile aynı |
|  | `c(5,7,9,1:3)` | Vektör birleştirme: 5 7 9 1 2 3 |
|  | `rep(1,5)` | 1 1 1 1 1 |
|  | `rep(4:6,1:3)` | 4 5 5 6 6 6 |
|  | `gl(3,2,12)` | 3 seviyeli faktör, her seviyeyi 2'şerli bloklar halinde tekrarla, toplam uzunluk 12 (1 1 2 2 3 3 1 1 2 2 3 3) |
| **Dönüşümler** | `as.numeric(x)` | Sayısal değere dönüştür |
|  | `as.character(x)` | Metin dizesine dönüştür |
|  | `as.logical(x)` | Mantıksal değere dönüştür |
|  | `factor(x)` | Vektör x'ten faktör oluştur |
|  | `unlist(x)` | Liste, tablo() sonucu vb., vektöre dönüştür |

### 3. Veri Çerçeveleri

| Veri Erişimi | Komut | Açıklama |
|------------------|--------------------|-----------------------------------|
|  | `data.frame(height, weight)` | 'height' ve 'weight' vektörlerini veri çerçevesinde topla |
|  | `dfr$var` | 'dfr' veri çerçevesindeki 'var' vektörünü seç |
|  | `attach(dfr)` | Veri çerçevesini arama yoluna ekle |
|  | `detach()` | Veri çerçevesini yoldan kaldır |
| **Düzenleme** | `dfr2 <- edit(dfr)` | 'dfr' veri çerçevesini elektronik tabloda aç, değiştirilmiş sürümü yeni veri çerçevesi 'dfr2' olarak kaydet |
|  | `fix(dfr)` | 'dfr' veri çerçevesini elektronik tabloda aç, değişiklikler 'dfr' girişlerinin üzerine yazılacak |
| **Özet** | `dim(dfr)` | 'dfr' veri çerçevesindeki satır ve sütun sayısı, matrisler ve diziler için de çalışır |
|  | `summary(dfr)` | 'dfr' içindeki her değişken için özet istatistikler |

### 4. Veri Girişi ve İhracı

| Genel | Komut | Açıklama |
|------------------|--------------------|-----------------------------------|
|  | `data(name)` | Yerleşik veri seti |
|  | `read.table("file.txt")` | Harici ASCII dosyasından oku |
| **read.table() Argümanları** | `header=TRUE` | İlk satır değişken isimlerini içerir |
|  | `row.names=1` | İlk sütun satır isimlerini içerir |
|  | `sep=","` | Veriler virgülle ayrılır |
|  | `sep="\t"` | Veriler sekmeyle ayrılır |
|  | `dec=","` | Ondalık nokta virgüldür |
|  | `na.strings="."` | Eksik değer noktadır |
| **read.table() Varyantları** | `read.csv("file.csv")` | Virgülle ayrılmış |
|  | `read.delim("file.txt")` | Sekmeyle ayrılmış metin dosyası |
| **İhracat** | `write.table()` | Detaylar için `help(write.table)` bakınız |
| **İsim Ekleme** | `names()` | Sadece veri çerçevesi veya liste için sütun isimleri |
|  | `dimnames()` | Satır ve sütun isimleri, ayrıca matris için de geçerli |

### 5. İndeksleme/Seçim/Sıralama

| Vektörler | Komut | Açıklama |
|------------------|--------------------|-----------------------------------|
|  | `x[1]` | İlk eleman |
|  | `x[1:5]` | İlk beş elemanı içeren altvektör |
|  | `x[c(2,3,5)]` | 2., 3. ve 5. elemanlar |
|  | `x[y <= 30]` | Mantıksal ifade ile seçim |
|  | `x[sex == "male"]` | Faktör değişkeni ile seçim |
|  | `i <- c(2,3,5); x[i]` | Sayısal değişken ile seçim |
|  | `k <- (y <= 30); x[k]` | Mantıksal değişken ile seçim |
|  | `length(x)` | Vektör x'in uzunluğunu döndürür |
| **Matrisler, Veri Çerçeveleri** | `m[4,]` | Dördüncü satır |
|  | `m[,3]` | Üçüncü sütun |
|  | `drf[drf$var <= 30,]` | Kısmi veri çerçevesi (matrisler için değil) |
|  | `subset(dfr, var <= 30)` | Aynı, genellikle daha basit (matrisler için değil) |
|  | `m[m[,3] <= 30,]` | Kısmi matris (veri çerçeveleri için de geçerli) |
| **Sıralama** | `sort(c(7,9,10,6))` | Sıralanmış değerleri döndürür: 6, 7, 9, 10 |
|  | `order(c(7,9,10,6))` | Artan değerlere göre sıralı eleman numaralarını döndürür: 4, 1, 2, 3 |
|  | `order(c(7,9,10,6), decreasing=TRUE)` | Aynı, ancak azalan değerlere göre: 3, 2, 1, 4 |
|  | `rank(c(7,9,10,6))` | Artan değerlere göre sıraları döndürür: 2, 3, 4, 1 |

\
\
\

### 6. Eksik Değerler

| Fonksiyonlar | Komut | Açıklama |
|------------------|--------------------|-----------------------------------|
|  | `is.na(x)` | Mantıksal vektör. x'te NA olan yerlerde TRUE |
|  | `complete.cases(x1,x2,...)` | Ne x1'de, ne x2'de, ne de ... eksik olan durumlar |
| **Diğer fonksiyonlara argümanlar** | `na.rm=` | İstatistiksel fonksiyonlarda: TRUE ise eksikleri kaldır, FALSE ise NA döndürür |
|  | `na.last=` | 'sort' içinde TRUE, FALSE ve NA sırasıyla "son", "ilk" ve "kaldır" anlamına gelir |
|  | `na.action=` | 'lm()' vb., na.fail, na.omit, na.exclude değerleri alır |
|  | `na.print=` | 'summary()' ve 'print()' içinde: Çıktıda NA nasıl temsil edilir |
|  | `na.strings=` | 'read.table()' içinde: Girişte NA için kod(lar) |

### 7. Sayısal Fonksiyonlar

| Matematiksel | Komut | Açıklama |
|------------------|--------------------|-----------------------------------|
|  | `log(x)` | x'in logaritması, doğal logaritma |
|  | `log(x, 10)` | x'in 10 tabanlı logaritması |
|  | `exp(x)` | Üstel fonksiyon e\^x |
|  | `sin(x)` | Sinüs |
|  | `cos(x)` | Kosinüs |
|  | `tan(x)` | Tanjant |
|  | `asin(x)` | Arksinüs (ters sinüs) |
|  | `min(x)` | Vektördeki en küçük değer |
|  | `min(x1, x2,...)` | Birden fazla vektör üzerinde minimum sayı |
|  | `max(x)` | Vektördeki en büyük değer |
|  | `range(x)` | `c(min(x), max(x))` gibi |
|  | `pmin(x1, x2,...)` | Aynı uzunluktaki birden fazla vektör üzerinde paralel (eleman bazında) minimum |
|  | `length(x)` | Vektördeki eleman sayısı |
|  | `sum(x)` | Vektördeki değerlerin toplamı |
|  | `cumsum(x)` | Vektördeki değerlerin kümülatif toplamı |
|  | `sum(complete.cases(x))` | Eksik olmayan elemanların sayısı |
| **İstatistiksel** | `mean(x)` | Ortalama |
|  | `median(x)` | Medyan |
|  | `quantile(x, p)` | Kuantiller: medyan = `quantile(x, 0.5)` |
|  | `var(x)` | Varyans |
|  | `sd(x)` | Standart sapma |
|  | `cor(x, y)` | Pearson korelasyonu |
|  | `cor(x, y, method="spearman")` | Spearman sıra korelasyonu |

\
\
\

### 8. Programlama

| Koşullu Yürütme | Komut | Açıklama |
|------------------|--------------------|-----------------------------------|
|  | `if(p < 0.5) print("Hooray")` | Koşul doğruysa "Hooray" yazdır |
|  | `if(p < 0.5) { print("Hooray"); i = i + 1 }` | Koşul doğruysa eğri parantezler {} içindeki tüm komutları yürüt |
|  | `if(p < 0.5) { print("Hooray") } else { i = i + 1 }` | Alternatifli koşullu yürütme |
| **Döngü** | `for(i in 1:10) { print(i) }` | Döngüye 10 kez gir |
|  | `i <- 1; while(i <= 10) { print(i); i = i + 1 }` | Aynı, ancak daha karmaşık |
| **Kullanıcı tanımlı fonksiyon** | `fun <- function(a, b, doit=FALSE) { if(doit){a+b} else 0 }` | 'doit' argümanı TRUE olarak ayarlanmışsa a ve b'nin toplamını döndüren, 'doit' FALSE ise sıfır döndüren 'fun' fonksiyonunu tanımlar |

### 9. Operatörler

| Aritmetik                    | Komut      | Açıklama                           |
|------------------|--------------------|-----------------------------------|
|                              | `+`        | Toplama                            |
|                              | `-`        | Çıkarma                            |
|                              | `*`        | Çarpma                             |
|                              | `/`        | Bölme                              |
|                              | `^`        | Üs alma                            |
|                              | `%/%`      | Tamsayı bölme: 5 %/% 3 = 1         |
|                              | `%%`       | Tamsayı bölmeden kalan: 5 %% 3 = 2 |
| **Mantıksal veya ilişkisel** | `==`       | Eşittir                            |
|                              | `!=`       | Eşit değildir                      |
|                              | `<`        | Küçüktür                           |
|                              | `>`        | Büyüktür                           |
|                              | `<=`       | Küçük eşittir                      |
|                              | `>=`       | Büyük eşittir                      |
|                              | `is.na(x)` | Eksik mi?                          |
|                              | `&`        | Mantıksal VE                       |
|                              | `\|`       | Mantıksal VEYA                     |
|                              | `!`        | Mantıksal DEĞİL                    |

\
\
\
\
\
\


### 10. Tablolama, Gruplama, Kodlama

| Genel | Komut | Açıklama |
|------------------|--------------------|-----------------------------------|
|  | `table(x)` | Vektör(faktör) x'in frekans tablosu |
|  | `table(x, y)` | x ve y'nin çapraz tablosu |
|  | `xtabs(~ x + y)` | Çapraz tablolama için formül arayüzü: chi-square test için `summary()` kullanın |
|  | `factor(x)` | Vektörü faktöre dönüştür |
|  | `cut(x, breaks)` | Sürekli değişken için kesim noktalarından gruplar, 'breaks' kesim noktaları vektörüdür |
| **factor() Argümanları** | `levels=c()` | Kodlanacak x değerleri. Bazı değerler veride yoksa veya sıra yanlışsa kullanın. |
|  | `labels=c()` | Faktör seviyeleriyle ilişkilendirilmiş değerler |
|  | `exclude=c()` | Hariç tutulacak değerler. Varsayılan NA. Eksik değerlerin bir seviye olarak dahil edilmesi için NULL olarak ayarlayın. |
| **cut() Argümanları** | `breaks=c()` | Kesim noktaları. 'breaks' dışında kalan x değerleri NA verir. Ayrıca tek bir sayı olabilir, kesim noktası sayısıdır. |
|  | `labels=c()` | Grupların isimleri. Varsayılan 1, 2,... |
| **Faktör Kodlaması** | `levels(f) <- names` | Yeni seviye isimleri |
|  | `factor(newcodes[f])` | Seviyeleri birleştirme: 'newcodes', örneğin f faktörünün ilk 3 grubunu birleştirmek için c(1,1,1,2,3) |

### 11. Matrisler ve Listelerin İşlenmesi

| Matris Cebri | Komut | Açıklama |
|------------------|--------------------|-----------------------------------|
|  | `m1 %*% m2` | Matris çarpımı |
|  | `t(m)` | Matris transpozu |
|  | `m[lower.tri(m)]` | Matris m'nin alt üçgenindeki değerleri vektör olarak döndürür |
|  | `diag(m)` | Matris m'nin köşegen elemanlarını döndürür |
|  | `matrix(x, dim1, dim2)` | x vektöründeki değerleri dim1 satır ve dim2 sütunlu yeni bir matrise doldur |
| **Marjinal işlemler vb.** | `apply(m, dim, fun)` | 'fun' fonksiyonunu matris m'nin her satırına (dim=1) veya sütununa (dim=2) uygular |
|  | `tapply(m, list(f1, f2), fun)` | f1, f2 tarafından tanımlanan matris m içindeki sütunları veya satırları toplamak için kullanılabilir (örneğin, mean, max) |
|  | `split(x, f)` | Vektörü, matrisi veya veri çerçevesini faktör x'e göre böl. Matris ve veri çerçevesi için farklı sonuçlar! Sonuç, f'nin her seviyesi için bir nesne içeren bir listedir. |
|  | `sapply(list, fun)` | 'split' fonksiyonu tarafından oluşturulan gibi bir listedeki her nesneye 'fun' fonksiyonunu uygular |

\
\


### 12. İstatistiksel Standart Yöntemler

| Parametrik Testler, Sürekli Veri | Komut | Açıklama |
|---------------------|-------------------|--------------------------------|
|  | `t.test` | Tek ve çift örneklem t-testi |
|  | `pairwise.t.test` | Ortalamaların ikili karşılaştırması |
|  | `cor.test` | Korelasyon katsayısı için anlamlılık testi |
|  | `var.test` | İki varyansın karşılaştırılması (F-testi) |
|  | `lm(y ~ x)` | Regresyon analizi |
|  | `lm(y ~ f)` | Tek yönlü varyans analizi |
|  | `lm(y ~ x1 + x2 + x3)` | Çoklu regresyon |
|  | `lm(y ~ f1 * f2)` | İki yönlü varyans analizi |
| **Parametrik Olmayan** | `wilcox.test` | Tek ve çift örneklem Wilcoxon testi |
|  | `kruskal.test` | Kruskal-Wallis testi |
|  | `friedman.test` | Friedman'ın iki yönlü varyans analizi |
| **cor.test Varyantı** | `method="spearman"` | Spearman sıra korelasyonu |
| **Kesikli Yanıt** | `binom.test` | Binom testi (işaret testi dahil) |
|  | `prop.test` | Oranların karşılaştırılması |
|  | `fisher.test` | 2x2 tablolarda kesin test |
|  | `chisq.test` | Bağımsızlık için ki-kare testi |
|  | `glm(y ~ x1+x2, binomial)` | Lojistik regresyon |

### 13. İstatistiksel Dağılımlar

| Normal Dağılım | Komut | Açıklama |
|------------------|--------------------|-----------------------------------|
|  | `dnorm(x)` | Yoğunluk fonksiyonu |
|  | `pnorm(x)` | Kümülatif dağılım fonksiyonu P(X\<=x) |
|  | `qnorm(p)` | p-kuantil, P(X\<=x)=p'deki x'i döndürür |
|  | `rnorm(n)` | n rastgele normal dağılımlı sayı |
| **Dağılımlar** | `pnorm(x, mean, sd)` | Normal |
|  | `plnorm(x, mean, sd)` | Lognormal |
|  | `pt(x, df)` | Student’ın t dağılımı |
|  | `pf(x, n1, n2)` | F dağılımı |
|  | `pchisq(x, df)` | Ki-kare dağılımı |
|  | `pbinom(x, n, p)` | Binom |
|  | `ppois(x, lambda)` | Poisson |
|  | `punif(x, min, max)` | Uniform |
|  | `pexp(x, rate)` | Üstel |
|  | `pgamma(x, shape, scale)` | Gamma |
|  | `pbeta(x, a, b)` | Beta |

\
\
\
\
\


### 14. Modeller

| Model Formülleri | Komut | Açıklama |
|------------------|--------------------|-----------------------------------|
|  | `~` | Tarafından açıklanır |
|  | `+` | Toplamsal etkiler |
|  | `:` | Etkileşim |
|  | `*` | Ana etkiler + etkileşim: a\*b |
|  | `-1` | Kesme noktasını kaldır |
| **Doğrusal Modeller** | `lm.out <- lm(y ~ x)` | Modeli uydur ve sonuçları 'lm.out' olarak kaydet |
|  | `summary(lm.out)` | Katsayılar vb. |
|  | `anova(lm.out)` | Varyans analizi tablosu |
|  | `fitted(lm.out)` | Uyumlu değerler |
|  | `resid(lm.out)` | Artıklar |
|  | `predict(lm.out,newdata)` | Yeni bir veri çerçevesi için tahminler |
| **Diğer Modeller** | `glm(y ~ x, binomial)` | Logaritmik regresyon |
|  | `glm(y ~ x, poisson)` | Poisson regresyonu |
|  | `gam(y ~ s(x))` | Genelleştirilmiş eklemeli model, düzgünleştirme ile doğrusal olmayan regresyon için. Paket: gam |
|  | `tree(y ~ x1+x2+x3)` | Sınıflandırma (y=faktör) veya regresyon (y=sayısal) ağacı. Paket: tree |
| **Tanılama** | `rstudent(lm.out)` | Öğrenci hale getirilmiş artıklar |
|  | `dfbetas(lm.out)` | Gözlem kaldırıldığında standartlaştırılmış regresyon katsayılarının değişimi |
|  | `dffits(lm.out)` | Gözlem kaldırıldığında uyumun değişimi |
| **Sağkalım Analizi** | `S <- Surv(time,ev)` | Sağkalım nesnesi oluştur. Paket: survival |
|  | `survfit(S)` | Kaplan-Meier tahmini |
|  | `plot(survfit(S))` | Sağkalım eğrisi |
|  | `survdiff(S ~ g)` | Eşit sağkalım eğrileri için (log-rank) test |
|  | `coxph(S ~ x1 + x2)` | Cox orantılı tehlike modeli |
| **Çok Değişkenli** | `dist()` | Öklid veya diğer mesafeleri hesapla |
|  | `hclust()` | Hiyerarşik kümeleme analizi |
|  | `kmeans()` | k-ortalamalar kümeleme analizi |
|  | `rda()` | Temel bileşenler analizi PCA veya artıklık analizi RDA yap. Paket ‘vegan’. Kanonik uygunluk analizi CA/CCA yap. Paket: ‘vegan’ |
|  | `cca()` | Kanonik uygunluk analizi, CA/CCA. Paket: ‘vegan’ |
|  | `diversity()` | Çeşitlilik indekslerini hesapla. Paket: ‘vegan’ |

\
\
\
\
\
\
\
\
\
\
\
\


### 15. Grafikler

| Standart Grafikler | Komut | Açıklama |
|------------------|--------------------|----------------------------------|
|  | `plot(x, y)` | Saçılma grafiği (veya x ve y sayısal vektör değilse başka tür grafik) |
|  | `plot(f, y)` | Faktör f'nin her seviyesi için kutu grafikleri seti |
|  | `hist()` | Histogram |
|  | `boxplot()` | Kutu grafiği |
|  | `barplot()` | Çubuk diyagramı |
|  | `dotplot()` | Nokta diyagramı |
|  | `pie()` | Pasta grafiği |
|  | `interaction.plot()` | Etkileşim grafiği (varyans analizi) |
| **Grafik Elemanları (bir grafiğe ekleme)** | `lines()` | Çizgiler Regresyon çizgisi |
|  | `abline()` | Regresyon çizgisi |
|  | `points()` | Noktalar |
|  | `arrows()` | Oklar (Not: error barlar için angle=90) Çerçeve |
|  | `box()` | Çerçeve |
|  | `title()` | Başlık (grafiğin üstünde) |
|  | `text()` | Grafik içinde metin Kenarlarda metin |
|  | `mtext()` | Kenarlarda metin |
|  | `legend()` | Semboller listesi |
| **Grafik parametreleri: par() argümanları** | `pch` | Sembol |
|  | `mfrow, mfcol` | Birden fazla grafik (çoklu çerçeve) |
|  | `xlim, ylim` | Grafik sınırları Çizgi tipi/genişliği (aşağıya bakın) |
|  | `lty, lwd` | Çizgi tipi/genişliği |
|  | `col` | Çizgiler veya semboller için renk (aşağıya bakın) |
