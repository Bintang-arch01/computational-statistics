# 1. Vektor Numerik - Nilai Ujian Kalkulus
nilai_kalkulus <- c(70, 90, 75, 92, 88, 65, 95, 82)
print(nilai_kalkulus)

# 2. Vektor Integer - Jumlah Soal yang Dikerjakan
soal_dikerjakan <- c(40L, 45L, 38L, 50L, 42L, 35L, 48L, 40L)
print(soal_dikerjakan)

# 3. Vektor Logical - Status Lulus/Tidak Lulus
status_lulus <- nilai_kalkulus >= 75
print(status_lulus)

# 4. Matrix 4x4 - Nilai Ujian 4 Mata Kuliah (Kalkulus, Komputasi, Rancangan, Analisis Regresi)
nilai_ujian <- matrix(
  c(85, 90, 78, 92,   
    88, 75, 95, 82,   
    70, 85, 80, 78,   
    92, 88, 85, 90),  
  nrow = 4, byrow = TRUE
)
rownames(nilai_ujian) <- c("Bintang", "Nadia", "LIdya", "Sari")
colnames(nilai_ujian) <- c("Kalkulus", "Komputasi", "Rancangan", "Analisis Regresi")
print(nilai_ujian)

# 5. ARRAY 4x4x2 - Nilai Ujian Semester 1 & 2
nilai_semester <- array(
  c(85, 90, 78, 92, 88, 75, 95, 82,  
    70, 85, 80, 78, 92, 88, 85, 90,  
    88, 92, 85, 90, 82, 78, 88, 85,  
    80, 85, 90, 88, 75, 80, 85, 90), 
  dim = c(4, 4, 2)
)
dimnames(nilai_semester) <- list(
  c("Bintang", "Nadia", "Lidya", "Sari"),
  c("Kalkulus", "Komputasi", "Rancangan", "Analisis Regresi"),
  c("Semester 1", "Semester 2")
)
print(nilai_semester)

# 6. DATA FRAME - Data Nilai Ujian Koputasi
df_nilai <- data.frame(
  Nama = c("Bintang", "Nadia", "Lidya", "Sari", "Hoshi", "Reya"),
  Nilai = c(85, 92, 68, 95, 70, 88))
df_nilai$Lulus <- df_nilai$Nilai >= 75      
df_nilai$Remedial <- df_nilai$Nilai < 75 
print(df_nilai)

# 7. LIST - Kumpulan Data Nilai 
data_nilai <- list(
  kalkulus = nilai_kalkulus,
  soal = soal_dikerjakan,
  nilai = df_nilai,
  analisis = list(
    rata_kalkulus = mean(nilai_kalkulus),
    total_soal = sum(soal_dikerjakan),
    rekap = data.frame(
      Nama = df_nilai$Nama,
      Nilai = df_nilai$Nilai,
      Lulus = df_nilai$Lulus,
      Remedial = df_nilai$Remedial,
      Keterangan = ifelse(df_nilai$Nilai >= 80, "Baik", "Perlu Belajar")
    )
  )
)
print(data_nilai)
