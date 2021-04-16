library(rsconnect)

# Module 1 ---------------------------------------------------------------------

deployApp(
  appDir = "01-hello",
  appPrimaryDoc = "01-hello.Rmd",
  account = "minecr",
  forceUpdate = TRUE
)

# Module 2 ---------------------------------------------------------------------

deployApp(
  appDir = "02-flow",
  appPrimaryDoc = "02-flow.Rmd",
  account = "minecr",
  forceUpdate = TRUE
)

# Module 3 ---------------------------------------------------------------------

deployApp(
  appDir = "03-reactivity",
  appPrimaryDoc = "03-reactivity.Rmd",
  account = "minecr",
  forceUpdate = TRUE
)

# Module 4 ---------------------------------------------------------------------

deployApp(
  appDir = "04-ui",
  appPrimaryDoc = "04-ui.Rmd",
  account = "minecr",
  forceUpdate = TRUE
)
