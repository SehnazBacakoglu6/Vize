#not: verilen yönergeye uygun olarak işlemleri sırayla yap!
#her bir task yapıldıkça aynı zamanda testini yaz. branchlemeyi unutma !
# git bash komutları-->> ls içerisinde olan klasörü listeler
# cd komutu --> bir üst klasöre geçmeyi sağlar 
# git clone komutu verilen dosyayı fork ettikten sonra kendi bilgisayarımıza klonlamamızı sağlar 
# git checkout -b ....... komutu yeni branch oluşturmamızı sağlar
#yeni branch oluşturduktan sonra sırsaıyla git add ./git commit -m "mesaj" ve git push -u origin(branch name ) ile branch e yazdığımız kodu ekler ve push ederiz

library(dplyr)
#1.1
url <- "https://raw.githubusercontent.com/scizmeli/Red/master/MapsThatChangedOurWorld_StoryMap_Data.csv"#url adında değişken oluşturduk ve bu değişkene csv dosyasının linkini atadık.
download.file(url, destfile = "MapsThatChangedOurWorld_StoryMap_Data.csv", mode = "wb") #dowland ettik(destfile ismini öyle verdik çünkü task de öyle yazıyor)

#1.2
maps <- read.csv("MapsThatChangedOurWorld_StoryMap_Data.csv",sep=";", header = TRUE) #maps adında bir değişkene indirdiğimiz cvs dosyasını okutturduk.sep e dikkat et (;)
if(dim(maps)[1]==10 && dim(maps)[2]==9){ #dim fonksiyonu boyutu verir // verilen csv dosyası 2 boyutlu olduğu için her boyutunun istenilen boyuta uygun olup olmadığını kontrol ettik.
  print("tamam")
}else{
  print("hatalı")
}
#1.3
maps <- maps %>% mutate(Latitude = gsub("[^0-9.]", "", Latitude))

#1.4
idx <- which(grepl("W", maps$Longitude))

#1.5
maps <- maps %>%
  mutate(Longitude = gsub("[EW]", "", Longitude))

#1.6 
maps <- maps %>%
  mutate(Year = as.numeric(gsub("AD", "", Year)))
print(maps)









