# Load packages
library(shiny)
library(tidyverse)

# Load data
load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_4850/datasets/movies.Rdata"))

# Define UI for application that plots features of movies
ui <- fluidPage(

  titlePanel("x"),
  
  # Sidebar layout with a input and output definitions
  sidebarLayout(
    # Inputs: Select variables to plot
    sidebarPanel(
      # Select variable for y-axis
      selectInput(inputId = "y", label = "Y-axis:",
                  choices = c("imdb_rating", "imdb_num_votes", "critics_score", "audience_score", "runtime"),
                  selected = "audience_score"),
      # Select variable for x-axis
      selectInput(inputId = "x", label = "X-axis:",
                  choices = c("imdb_rating", "imdb_num_votes", "critics_score", "audience_score", "runtime"),
                  selected = "critics_score"),
      # Select which types of movies to plot
      selectInput(inputId = "selected_type",
                  label = "Select movie type:",
                  choices = levels(movies$title_type),
                  selected = "Feature Film"),
      width = 4
    ),

    # Output:
    mainPanel(
      # Show scatterplot
      plotOutput(outputId = "scatterplot"),
      # Print number of obs plotted
      uiOutput(outputId = "n"),
      width = 8
    )
  )
)

# Define server function required to create the scatterplot
server <- function(input, output, session) {

  # Create a subset of data filtering for chosen title types
  movies_subset <- reactive({
    req(input$selected_type)
    filter(movies, title_type %in% input$selected_type)
  })
  
  # Create scatterplot object the plotOutput function is expecting
  output$scatterplot <- renderPlot({
    ggplot(data = movies_subset(), aes_string(x = input$x, y = input$y)) +
      geom_point()
  })
  
  # Print number of movies plotted
  output$n <- renderUI({
    HTML(paste0("The plot displays the relationship between the <br> 
               audience and critics' scores of <br>", 
               nrow(movies_subset()), " <b>", input$selected_type, "</b> movies."))
  })
  
}

# Create a Shiny app object
shinyApp(ui = ui, server = server)
