
env <- devtools::load_all("D:/Documents/Source/git/MODIStsp")$env

my_tests5 <- drake_plan(
  test  = testthat::test_file("D:/Documents/Source/git/MODIStsp/tests/testthat/test_MODIStsp_extract.R"),
  test2 = testthat::test_file("D:/Documents/Source/git/MODIStsp/tests/testthat/test_MODIStsp.R")
)
  ,
  test3 = testthat::test_file("D:/Documents/Source/git/MODIStsp/tests/testthat/test_MODIStsp_resetindexes.R"),
  test4 = testthat::test_file("D:/Documents/Source/git/MODIStsp/tests/testthat/test_MODIStsp_addindex.R"),
  # test5 = testthat::test_file("D:/Documents/Source/git/MODIStsp/tests/testthat/test_MODIStsp_extract.R"),
  test6 = testthat::test_file("D:/Documents/Source/git/MODIStsp/tests/testthat/test_bbox_from_file.R")
  # test6 = testthat::test_file("D:/Documents/Source/git/MODIStsp/tests/testthat/test_MODIStsp.R"),
  # out = rbind(test, test2, test3, test4, test5, test6)
  )
t0 = Sys.time()
  test  = testthat::test_file("D:/Documents/Source/git/MODIStsp/tests/testthat/test_MODIStsp_extract.R")
test2 = testthat::test_file("D:/Documents/Source/git/MODIStsp/tests/testthat/test_MODIStsp.R")
test3 = testthat::test_file("D:/Documents/Source/git/MODIStsp/tests/testthat/test_MODIStsp_resetindexes.R")
test4 = testthat::test_file("D:/Documents/Source/git/MODIStsp/tests/testthat/test_MODIStsp_addindex.R")
# test5 = testthat::test_file("D:/Documents/Source/git/MODIStsp/tests/testthat/test_MODIStsp_extract.R"),
test6 = testthat::test_file("D:/Documents/Source/git/MODIStsp/tests/testthat/test_bbox_from_file.R")
Sys.time() - t0
config3 <- drake_config(my_tests5, verbose = FALSE)
vis_drake_graph(config3, width = "100%", height = "500px")

t0 = Sys.time()
aaa = make(my_tests5, envir = env, parallelism = "parLapply", jobs = 2)
Sys.time() - t0
drake::con

env <- devtools::load_all("D:/Documents/Source/git/MODIStsp")$env # Has all your imported functions
drake::make(my_tests, envir = env)

check_test <- function() {testthat::test_that("aaaa", {
  r        <- raster::raster(xmn = -10, xmx = 10, ymn = -10, ymx = 10)
  r        <- raster::init(r, "cell")
  tmpfile  <- tempfile(fileext = ".tif")
  raster::writeRaster(r, tmpfile)
  rep_bbox <- bbox_from_file(tmpfile,
                             crs_out = "+init=epsg:3035")
  expect_equal(as.numeric(rep_bbox), c(1786548, -3333786,  4321000, -1072611),
               tolerance = 0.000001)})}

check_test <- function()source("D:/Documents/Source/git/MODIStsp/tests/testthat/test_get_yeardates.R")

