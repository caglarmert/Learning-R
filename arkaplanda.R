# Yazar adı: Ümit Mert Çağlar
# iletişim: umertcaglar@gmail.com

library(dplyr)

#Veri okuma
veri <- read.csv("Dev_data_to_be_shared.csv")

# "onus_attribute" ile başlayan sütunları seç
alt_veri <- veri %>% select(starts_with("onus_attribute")|starts_with("bad_flag"))

# Sayısal sütunları seç
numeric_columns <- sapply(veri, is.numeric)
veri_numeric <- veri[, numeric_columns]

# Sabit değerli veya tamamen boş sütunları kaldır
veri_numeric <- veri_numeric[, sapply(veri_numeric, function(x) length(unique(x[!is.na(x)])) > 1)]

# Korelasyon matrisini hesapla
cor_matrix <- cor(veri_numeric)

# bad_flag ile korelasyonu al
cor_bad_flag <- cor_matrix[, "bad_flag"]

# Korelasyonları büyükten küçüğe sırala (mutlak değerine göre)
cor_sorted <- sort(abs(cor_bad_flag), decreasing = TRUE)

# ozet veri
ozet_veri <- veri %>% select(c("bad_flag","onus_attribute_2","onus_attribute_17","onus_attribute_23", "onus_attribute_20"))

# kaydet
write.csv(ozet_veri, "ozet_veri22.csv")


