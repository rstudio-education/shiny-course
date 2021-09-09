library(rsconnect)

# Module 1 ---------------------------------------------------------------------

rsconnect::deployDoc(
  doc = "01-hello/01-hello.Rmd",
  account = "minecr",
  forceUpdate = TRUE
)

# Module 2 ---------------------------------------------------------------------

rsconnect::deployDoc(
  doc = "02-flow/02-flow.Rmd",
  forceUpdate = TRUE
)

# Module 3 ---------------------------------------------------------------------

rsconnect::deployDoc(
  doc = "03-reactivity/03-reactivity.Rmd",
  account = "minecr",
  forceUpdate = TRUE
)

# Module 4 ---------------------------------------------------------------------

rsconnect::deployDoc(
  doc = "04-ui/04-ui.Rmd",
  account = "minecr",
  forceUpdate = TRUE
)
