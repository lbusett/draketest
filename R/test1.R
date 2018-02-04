test1 <- function() {

  out <- try({testthat::test_that("aaaa", {
    r        <- raster::raster(xmn = -10, xmx = 10, ymn = -10, ymx = 10)
    r        <- raster::init(r, "cell")
    tmpfile  <- tempfile(fileext = ".tif")
    raster::writeRaster(r, tmpfile)
    rep_bbox <- bbox_from_file(tmpfile,
                               crs_out = "+init=epsg:3035")
    expect_equal(as.numeric(rep_bbox), c(1786548, -3333786,  4321000, -1072611),
                 tolerance = 0.000001)})})
  ifelse(inherits(out, "try-error"), "failed", "up to date")
}
