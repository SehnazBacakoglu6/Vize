test_that("Workspace'teki tüm değişkenleri silme", {
  rm(list = ls())
  expect_equal(length(ls()), 0)
})

test_that("Eğer mevcut ise veri setini silme", {
  if ("MapsThatChangedOurWorld_StoryMap_Data.csv" %in% list.files()) {
    file.remove("MapsThatChangedOurWorld_StoryMap_Data.csv")
  }
  expect_equal("MapsThatChangedOurWorld_StoryMap_Data.csv" %in% list.files(), FALSE)
})

current_dir <- getwd()
relative_path <- file.path(current_dir,"Labex1_Q1_200401076_sehnaz_bacakoglu.R")

source(relative_path)

#2.4
test_that("Dosya varlık testi", {
  # Dosyanın var olup olmadığını kontrol etme
  file_exist <- file.exists("MapsThatChangedOurWorld_StoryMap_Data.csv")
  expect_true(file_exist, info = "Dosyanın bulunduğunu kontrol etme")
})

#2.5
test_that("Test : maps adlı değişken Global Workspace’de mevcuttur.", {
  expect_true(exists("maps", envir = .GlobalEnv), info = "maps adlı değişken mevcut değil.")
})
#2.6
test_that("maps değişkeninin data.frame olup olmadığını kontrol et", {
  
  
  expect_true(is.data.frame(maps), info = "maps değişkeninin bir data.frame olduğunu kontrol etme")
})
#2.7
test_that("maps data.frame'inin ilk sütununun adını kontrol et", {


  expect_equal(names(maps)[1], "City", info = "maps data.frame'inin ilk sütununun adını kontrol etme")
})
#2.8
test_that("maps data.frame'inin 5. sütununun adını kontrol et", {
  
  expect_false("Title" %in% names(maps), 
               info = "maps data.frame'inin 5. sütununun adında 'Title' kelimesi geçmiyor mu?")
})
#2.9
test_that("Latitude sütunu numeric değerlerden oluşmalıdır", {
  
  expect_true(all(suppressWarnings(!is.na(as.numeric(maps$Latitude)))),
              info = "Latitude sütunu numeric değerlerden oluşmalıdır")
})
  
#2.10
test_that("Longitude sütunu numeric değerlerden oluşmalıdır", {

  expect_true(all(suppressWarnings(!is.na(as.numeric(maps$Longitude)))),
              info = "Longitude sütunu numeric değerlerden oluşmalıdır")
})
#2.11 
test_that("idx nesnesi Global Workspace'de mevcut olmalıdır", {
  
  expect_true(exists("idx", envir = globalenv()), 
              info = "idx nesnesinin var olduğunu kontrol etme")
})
#2.12
test_that("idx nesnesinin tipi integer'dir", {
 
  expect_identical(class(idx), "integer", 
                   info = "idx nesnesinin tipinin integer olduğunu kontrol etme")
})

