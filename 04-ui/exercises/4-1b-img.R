# Load packages ----------------------------------------------------------------

library(shiny)


# Define UI --------------------------------------------------------------------

ui <- fluidPage(
  titlePanel("An image"),
  tags$img(___),
)

# Define server ----------------------------------------------------------------

server <- function(input, output, session) {}

# Create the Shiny app ---------------------------------------------------------

shinyApp(ui = ui, server = server)
