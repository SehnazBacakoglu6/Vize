test_that("Workspace'deki değişkenleri ve dosyayı silme testi", {
  
  rm(list = ls())
  expect_equal(length(ls()), 0, info = "Workspace'deki değişkenlerin silindiğini kontrol etme")
  
  
  file_exist <- file.exists("MapsThatChangedOurWorld_StoryMap_Data.csv")
  expect_false(file_exist, info = "Dosyanın silindiğini kontrol etme")
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