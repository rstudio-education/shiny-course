# Load packages ----------------------------------------------------------------

library(shiny)
library(ggplot2)
library(dplyr)

# Load data --------------------------------------------------------------------

load("movies.RData")
min_date <- min(movies$thtr_rel_date)
max_date <- max(movies$thtr_rel_date)

# Define UI --------------------------------------------------------------------

ui <- fluidPage(
  sidebarLayout(
    
    sidebarPanel(
      
      HTML(paste0("Movies released since the following date will be plotted. 
                 Pick a date between ", min_date, " and ", max_date, ".")),
      
      br(), br(),
      
      dateInput(inputId = "date",
                label = "Select date:",
                value = "2013-01-01",
                min = min_date, max = max_date)
    ),
    
    mainPanel(
      plotOutput(outputId = "scatterplot")
    )
  )
)

# Define server ----------------------------------------------------------------

server <- function(input, output, session) {
  
  output$scatterplot <- renderPlot({
    movies_selected_date <- movies %>%
      filter(thtr_rel_date >= as.POSIXct(input$date))
    ggplot(data = movies_selected_date, aes(x = critics_score, y = audience_score, color = mpaa_rating)) +
      geom_point()
  })
  
}

# Create a Shiny app object ----------------------------------------------------

shinyApp(ui = ui, server = server)
