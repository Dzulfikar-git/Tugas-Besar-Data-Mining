#memasukkan work direktory
work_directory <- "C:/Users/User/Documents/Semester 3/DM/TB"
setwd(work_directory)
dataset <- read.csv("data.csv", sep = ",")

#uncomment baris dibawah jika belum menginstall packages yang akan digunakan
#install.packages("C50")

#memanggil packages C50
library(C50)


#mengubah atribut pada dataset menjadi factor
dataset$age <- as.factor(dataset$age)
dataset$deliverynum <- as.factor(dataset$deliverynum)
dataset$deliverytime <- as.factor(dataset$deliverytime)
dataset$bloodofpressure <- as.factor(dataset$bloodofpressure)
dataset$heartproblem <- as.factor(dataset$heartproblem)
dataset$caesarian <- as.factor(dataset$caesarian)

#membuat model menggunakan algoritma C5.0  
model <- C5.0(caesarian ~., data=dataset)
model
#menampilkan kesimpulan dari model yang dibuat
summary(model)
#menampilkan pohon keputusan dari model yang dibuat
plot(model)

#membuat objek bernama datatesting yang terdiri dari kolom 1-5 dari dataset
datatesting <- dataset[1:5]

#membuat prediksi dari model dan datatesting
predictions <- predict(model, datatesting)

#menampilkan tabel perbandingan dari hasil prediksi dengan nilai atribut caesarian 
table(predictions, dataset$caesarian)
