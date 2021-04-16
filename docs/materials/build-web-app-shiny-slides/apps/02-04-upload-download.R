library(shiny)
library(dplyr)
library(readr)
load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_4850/datasets/movies.Rdata"))

# UI
ui <- fluidPage(
  sidebarLayout(
    
    # Input(s)
    sidebarPanel(
      
      # Select filetype
      radioButtons(inputId = "filetype",
                   label = "Select filetype:",
                   choices = c("csv", "tsv"),
                   selected = "csv"),
      
      # Select variables to download
      checkboxGroupInput(inputId = "selected_var",
                         label = "Select variables:",
                         choices = names(movies),
                         selected = c("title")),
      # File input
      
      
    ),
    
    # Output(s)
    mainPanel(
      HTML("Select filetype and variables, then hit 'Download data'."),
      downloadButton("download_data", "Download data")
    )
  )
)

# Server
server <- function(input, output, session) {
  
  # Download file
  output$download_data <- downloadHandler(
    filename = function() {
      paste0("movies.", input$filetype)
    },
    content = function(file) { 
      if(input$filetype == "csv"){ 
        write_csv(movies %>% select(input$selected_var), file) 
      }
      if(input$filetype == "tsv"){ 
        write_tsv(movies %>% select(input$selected_var), file) 
      }
    }
  )
  
}

# Create a Shiny app object
shinyApp(ui = ui, server = server)
