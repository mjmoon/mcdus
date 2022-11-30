year <- "2019"
year_unavailable <- "1800"
new_temp <- function() {
  x <- tempfile()
  unlink(x, recursive = TRUE, force = TRUE)
  dir.create(x)
  x
}

test_that("Downladed files are parsed.", {
  new <- new_temp()
  withr::with_dir(
    new = new,
    code = {
      download_mcdus_zip(year, save_to_wd = TRUE)
      uncompress_mcdus_zip(save_to_wd = TRUE, read_from_wd = TRUE)
      mcd_year <- parse_mcdus(year, read_from_wd = TRUE)
      expect_true(all(
        names(spec[[year]][["spec"]]) %in% colnames(mcd_year[[year]])))
    }
  )
})

test_that("Unavilable years are ignored.", {
  new <- new_temp()
  withr::with_dir(
    new = new,
    code = {
      expect_warning({
        mcd_year <- parse_mcdus(year, read_from_wd = TRUE)
      })
      expect_length(mcd_year, 0)
      download_mcdus_zip(year, save_to_wd = TRUE)
      uncompress_mcdus_zip(save_to_wd = TRUE, read_from_wd = TRUE)
      expect_warning({
        mcd_year <- parse_mcdus(c(year_unavailable, year), read_from_wd = TRUE)
      })
      expect_length(mcd_year, 1)
    }
  )
})
