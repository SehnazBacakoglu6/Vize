#1.1
url <- "https://raw.githubusercontent.com/scizmeli/Red/master/MapsThatChangedOurWorld_StoryMap_Data.csv"
download.file(url, destfile = "MapsThatChangedOurWorld_StoryMap_Data.csv", mode = "wb")

#1.2
maps <- read.csv("MapsThatChangedOurWorld_StoryMap_Data.csv",sep=";", header = TRUE)
if(dim(maps)[1]==10 && dim(maps)[2]==9){ #dim=boyutu verir
  print("tamam")
}else{
  print("hatalı")
}







