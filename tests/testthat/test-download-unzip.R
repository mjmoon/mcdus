year <- "2019"
year_unavailable <- "1800"
new_temp <- function() {
  x <- tempfile()
  unlink(x, recursive = TRUE, force = TRUE)
  dir.create(x)
  x
}

test_that("Available years are read.", {
  expect_true(year %in% get_mcdus_available_years())
})


test_that("Available years are downloaded.", {
  new <- new_temp()
  withr::with_dir(
    new = new,
    code = {
      download_mcdus_zip(year)
      downloaded_files <- list.files(file.path(tempdir(), "mcdus"), "*\\.zip")
      expect_true(paste0(year, ".zip") %in% downloaded_files)
    }
  )
})

test_that("Downloaded files are uncompressed.", {
  new <- new_temp()
  withr::with_dir(
    new = new,
    code = {
      download_new <- download_mcdus_zip(year)
      uncompress_new <- uncompress_mcdus_zip(year)
      expect_true(download_new)
      expect_true(uncompress_new)
    }
  )
})

test_that("Downloaded files are saved and uncompressed locally.", {
  new <- new_temp()
  withr::with_dir(
    new = new,
    code = {
      download_new <- download_mcdus_zip(year, save_to_wd = TRUE)
      uncompress_new <- uncompress_mcdus_zip(
        year, save_to_wd = TRUE, read_from_wd = TRUE)
      expect_true(download_new)
      expect_true(uncompress_new)
      downloaded_files <- list.files(file.path(new, "mcdus"), "*\\.zip")
      expect_true(paste0(year, ".zip") %in% downloaded_files)
    }
  )
})

test_that("Unavilable years are ignored.", {
  new <- new_temp()
  withr::with_dir(
    new = new,
    code = {
      expect_warning(download_mcdus_zip(year_unavailable, save_to_wd = TRUE))
      expect_warning(download_mcdus_zip(c(year, year_unavailable), save_to_wd = TRUE))
      downloaded_files <- list.files(file.path(new, "mcdus"), "*\\.zip")
      expect_true(paste0(year, ".zip") %in% downloaded_files)
      expect_false(paste0(year_unavailable, ".zip") %in% downloaded_files)
    }
  )
})
