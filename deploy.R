library(rsconnect)

# Module 1 ---------------------------------------------------------------------

deployDoc(
  doc = "01-hello/01-hello.Rmd",
  account = "minecr",
  forceUpdate = TRUE
)

# Module 2 ---------------------------------------------------------------------

deployDoc(
  doc = "02-flow.Rmd/02-flow.Rmd",
  forceUpdate = TRUE
)

# Module 3 ---------------------------------------------------------------------

deployDoc(
  doc = "03-reactivity/03-reactivity.Rmd",
  account = "minecr",
  forceUpdate = TRUE
)

# Module 4 ---------------------------------------------------------------------

deployDoc(
  doc = "04-ui/04-ui.Rmd",
  account = "minecr",
  forceUpdate = TRUE
)
