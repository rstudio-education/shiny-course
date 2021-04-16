# Load packages ----------------------------------------------------------------

library(shiny)


# Define UI --------------------------------------------------------------------

ui <- fluidPage(
  titlePanel("An image"),
  tags$img(height = 100, width = 300, src = "roles_implement.png"),
)

# Define server ----------------------------------------------------------------

server <- function(input, output, session) {}

# Create the Shiny app ---------------------------------------------------------

shinyApp(ui = ui, server = server)
