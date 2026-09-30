# 1. Jika rata-rata pelanggan datang ke toko adalah 3 orang per jam, modelkan dengan Poisson dan hitung P(X≥5)
lambda <- 3          # rata-rata pelanggan per jam
x <- 0:15
pmf <- dpois(x, lambda)
plot(x, pmf, type='h', lwd=3,
     main='Poisson(λ=3)', xlab='k', ylab='P(X=k)')

# P(X >= 5) = 1 - P(X <= 4)
p_ge5 <- 1 - ppois(4, lambda)
p_ge5

# Verifikasi dengan jumlah manual PMF
sum(dpois(5:15, lambda))

# 2. Dari 100 bola (20 berwarna merah), diambil 10 tanpa pengembalian. Modelkan jumlah bola merah yang diambil dengan distribusi yang tepat
N <- 100    # ukuran populasi
K <- 20     # jumlah sukses di populasi (bola merah)
n <- 10     # ukuran sampel

# Domain k
k <- seq(from = max(0, n + K - N), to = min(n, K))

# PMF: P(X = k)
pmf <- dhyper(k, m = K, n = N - K, k = n)
data.frame(k = k, P = pmf)

# Plot PMF
plot(k, pmf, type = "h", lwd = 3,
     main = paste0("Hypergeometric(N=",N,", K=",K,", n=",n,")"),
     xlab = "k (banyak bola merah dalam sampel)", ylab = "P(X=k)")

# Ekspektasi teoretis
n * K / N

# Variansi teoretis
n * K/N * (1 - K/N) * ((N - n)/(N - 1))

# Simulasi
set.seed(2025)
m <- 10000
samp <- rhyper(m, m = K, n = N - K, k = n)
mean(samp)   # ≈ 2
var(samp)    # ≈ teori

# 3. Simulasikan 1.000 percobaan Binomial (n=15,p=0.4) dan bandingkan histogram hasil simulasi dengan PMF teoretis.
set.seed(2025)
n <- 15; p <- 0.4
x <- 0:n
pmf <- dbinom(x, size=n, prob=p)
cdf <- pbinom(x, size=n, prob=p)

# Simulasi 1000 percobaan
m <- 1000
samp <- rbinom(m, size=n, prob=p)

# Histogram hasil simulasi (densitas) + PMF teoretis
hist(samp, breaks = seq(-0.5, n+0.5, by=1), probability = TRUE,
     col = "lightblue", border = "white",
     main = "Simulasi Binomial(n=15, p=0.4) vs PMF Teoretis",
     xlab = "k", ylab = "Probabilitas")

# Overlay PMF teoretis
lines(x, pmf, type = "h", lwd = 3, col = "purple")
points(x, pmf, pch = 19, col = "yellow")

# Bandingkan frekuensi relatif simulasi dengan PMF teoretis
freq_rel <- table(samp) / m
data.frame(k = as.numeric(names(freq_rel)),
           simulasi = as.numeric(freq_rel),
           teoretis = dbinom(as.numeric(names(freq_rel)), size=n, prob=p))

# Statistik simulasi vs teori
mean(samp)      # ≈ n*p = 6
var(samp)       # ≈ n*p*(1-p) = 3.6
n * p
n * p * (1 - p)