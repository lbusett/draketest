a <- function() {
  if (FALSE) {
    testthat::test_that("Test On raster aggregation", {

      context("aggregate_rast --> Aggregate raster on larger cells")
      # skip_on_cran()
      # skip_on_travis()
      library(sprawl.data)

      in_rast <- raster(nrows = 50, ncols = 50) %>%
        raster::init("cell")
      tempraster   <- tempfile(fileext = ".tif")
      in_obj_zones <- raster::aggregate(in_rast,
                                        fact      = 4,
                                        filename  = tempraster,
                                        options   = "COMPRESS=DEFLATE",
                                        overwrite = TRUE)

      test <- aggregate_rast(in_rast,
                             in_obj_zones,
                             FUN     = mean,
                             method  = "disk",
                             verbose = FALSE)
      expect_is(test, "RasterLayer")
    })
  }

test = test_file("../sprawl/tests/testthat/test_aggregate_rast.R")
test
}
