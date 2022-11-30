year <- "2019"
year_unavailable <- "1800"

test_that("Available specification document opens.", {
  expect_no_error(open_mcdus_documentation(year))
})

test_that("Requesting for an unavilable year throws an error.", {
  expect_error(open_mcdus_documentation(year_unavailable))
})
