# Load packages ----------------------------------------------------------------

library(shiny)

# Define UI --------------------------------------------------------------------

ui <- fluidPage(
  titlePanel("Multiply by 3"),
  sidebarLayout(
    sidebarPanel(sliderInput("x", "Select x", min = 1, max = 50, value = 30)),
    mainPanel(textOutput("x_updated"))
  )
)

# Define server ----------------------------------------------------------------

server <- function(input, output, session) {
  mult_3 <- function(x) {
    x * 3
  }
  current_x <- reactive({
    mult_3(input$x)
  })
  output$x_updated <- renderText({
    current_x()
  })
}

# Create the Shiny app ---------------------------------------------------------
shinyApp(ui = ui, server = server)
