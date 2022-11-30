test_that("Documentation urls are valid.", {
  urls <- sapply(spec, `[`, "url-doc")
  expect_length(urls, length(spec))
  expect_true(all(sapply(urls, RCurl::url.exists)))
})

test_that("Data file urls are valid.", {
  urls <- sapply(spec, `[`, "url-file")
  expect_length(urls, length(spec))
  expect_true(all(sapply(urls, RCurl::url.exists)))
})
