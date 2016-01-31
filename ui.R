library(shiny)

shinyUI(fluidPage(
  
  # Application Title
  titlePanel("Normal distribution Simulator"),
  
  # Sidebar with controls
  sidebarLayout(
    sidebarPanel(
      sliderInput("n",
                  "Number of simulations:",
                  min = 100,
                  max = 10000,
                  value = 1000,
                  step = 100
                  ),
      checkboxInput("shownorm",
                    "Overlay theoretical normal",
                    value = FALSE)      
    ),
  
  #show plot using values entered
  mainPanel(
    plotOutput(outputId = "main_plot", height = "300px", width = "600px")
  )
  )
))

  
  
