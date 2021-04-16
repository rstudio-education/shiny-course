# Load data -------------------------------------------------------------------

load("data/movies.Rdata")

# Define server function for application that plots features of movies --------
shinyServer(
  function(input, output) {

    # Create the scatterplot object the plotOutput function is expecting --------
    output$scatterplot <- renderPlot({
      ggplot(data = movies, aes_string(x = input$x, y = input$y,
                                       color = input$z)) +
        geom_point()
    })
  }
)
