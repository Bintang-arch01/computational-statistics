library(dplyr)

data(iris)
iris

# 1. Tampilkan data Sepal.Length saja
iris %>% 
  select(Sepal.Length) # picks variables based on their names.

# 2. Sebutkan tipe data tiap kolom
iris %>% 
  sapply(class) # Alternatif: Mendapatkan tipe data setiap kolom

# 3. Buat variabel baru dengan nama turunan yang berasal/turunan dari variabel sepal.width. Nilai variabel turunan hanya memiliki dua nilai yaitu "Besar" dan "Kecil". Besar jika sepal.width lebih besar dari 3, begitu pula sebaliknya.
iris2 <- iris %>% 
  mutate(turunan = ifelse(Sepal.Width > 3, "Besar", "Kecil")) # adds new variables that are functions of existing variables

# Cara alternatif dengan base R ($ dan with())
iris2$iris_std <- with(iris2, ifelse(Sepal.Width > 3, "Besar", "Kecil"))

head(iris2)

# 4. Ubah variabel turunan menjadi sepal
iris2 <- iris2 %>% 
  rename(sepal = turunan)

head(iris2)

# 5. Ambil data dengan sepal bernilai besar dari species virginica
iris2 %>% 
  filter(sepal == "Besar", Species == "virginica") # picks cases based on their values.

# 6. Cek jumlah spesies dalam data
iris2 %>% 
  count(Species)

# Cara Alternatif lain
summary(iris2$Species)

# 7. Pecah data iris menjadi 3 data frame dengan tiap data frame khusus untuk spesies tertentu.
iris_setosa     <- iris2 %>% 
  filter(Species == "setosa")
iris_versicolor <- iris2 %>% 
  filter(Species == "versicolor")
iris_virginica  <- iris2 %>% 
  filter(Species == "virginica") # picks cases based on their values.

head(iris_setosa)
head(iris_versicolor) 
head(iris_virginica)

# 8. Dari setiap data frame species, urutkan data berdasarkan sepal.width
iris_setosa     <- iris_setosa     %>% arrange(Sepal.Width)
iris_versicolor <- iris_versicolor %>% arrange(Sepal.Width)
iris_virginica  <- iris_virginica  %>% arrange(Sepal.Width)

print(iris_setosa)
print(iris_versicolor)
print(iris_virginica)