#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  headerPanel("Which generation are you from"),
  
  sidebarPanel( 
    numericInput('Age','Age you are now in 2021(min=9, max=99)', 29, min=9, max=99, step=1),
    submitButton('Submit')
  ),
  
  mainPanel(
    h3('Generation you are from'),
    h4('You entered'),
    verbatimTextOutput("inputAge"),
    h4('Generation'),
    verbatimTextOutput("generation")
  )
)

generation_calc <- function(x){
  if (x >= 9 && x<=24) return("Gen Z")
  else if (x>=25 && x<=40) return("Millennials")
  else if (x>=41 && x<=56) return("Gen X")
  else if (x>= 57 && x<=66) return("Boomers II")
  else if (x>= 67 && x<= 75) return("Boomers I")
  else if (x>= 76 && x<=93) return("Post War")
  else if (x>=94 && x<= 99) return("World War II")
  else return("Unknown")
}

server <- function (input, output, session) {
  
  output$inputAge <- renderPrint({input$Age})
  
  x <- reactive ({1*input$Age})
  
  output$generation <- renderPrint({generation_calc(input$Age)})
}

# Run the application 
shinyApp(ui = ui, server = server)
