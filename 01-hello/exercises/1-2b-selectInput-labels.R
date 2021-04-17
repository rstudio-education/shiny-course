# Load packages ----------------------------------------------------------------

library(shiny)
library(ggplot2)

# Load data --------------------------------------------------------------------

load("movies.RData")

# Define UI --------------------------------------------------------------------

ui <- fluidPage(
  
  sidebarLayout(
    
    # Inputs: Select variables to plot
    sidebarPanel(
      
      # Select variable for y-axis
      selectInput(inputId = "y", 
                  label = "Y-axis:",
                  choices = c(___ = "imdb_rating", 
                                 ___ = "imdb_num_votes", 
                                 ___ = "critics_score", 
                                 ___ = "audience_score", 
                                 ___ = "runtime"), 
                  selected = "audience_score"),
      
      # Select variable for x-axis
      selectInput(inputId = "x", 
                  label = "X-axis:",
                  choices = c(___ = "imdb_rating", 
                                 ___ = "imdb_num_votes", 
                                 ___ = "critics_score", 
                                 ___ = "audience_score", 
                                 ___ = "runtime"), 
                  selected = "critics_score"),
      
      # Select variable for color
      selectInput(___)
      
    ),
    
    # Output: Show scatterplot
    mainPanel(
      plotOutput(outputId = "scatterplot")
    )
  )
)

# Define server ----------------------------------------------------------------

server <- function(input, output, session) {
  
  output$scatterplot <- renderPlot({
    ggplot(data = movies, aes_string(x = input$x, y = input$y,
                                     color = input$z)) +
      geom_point()
  })
  
  }

# Create a Shiny app object ----------------------------------------------------

shinyApp(ui = ui, server = server)
