library(shiny)
library(ggplot2)
library(shiny)

# GUI

ui <- fluidPage(titlePanel("Diamonds Data"),
                sidebarLayout(
                  sidebarPanel(
                    helpText("This app is to visualize a data set"), 
                    textInput(inputId = "title", label= "Chart Title", value = ""),
                    selectInput(inputId = "pos", label = "Position", choices = list("stack", "dodge"),
                                selected="stack")
                  ),
                  mainPanel(
                    plotOutput(outputId = "plot")
                  )
                )
  
)

# Server

server <- function(input, output){
  
  output$plot =  renderPlot({
    ggplot(diamonds, aes(x=cut, fill= clarity)) + geom_bar(position = input$pos) + ggtitle(input$title)
  })
}


# Run the app
shinyApp(ui, server)

# Interactive R Web Applications- Lab 1, google widgets rstudio, to find the list of different widgets 

