library(shiny)

shinyServer(function(input, output) {
  
  meanstable <- reactive({
    lambda = 0.2
    n1 = 40
    set.seed(36)
    df <- data.frame(expmean = numeric(input$n), stringsAsFactors = FALSE)
    for(i in 1:input$n) {
      df$expmean[i] <- mean(rexp(n1,lambda))
    }
    df
  })
  
  output$main_plot <- renderPlot({
    
    rptdata <- meanstable()
    
    hist(rptdata$expmean, density=20, breaks=20, prob=TRUE, main="Normal Curve over Histogram")
    
    if (input$shownorm) {
      curve(dnorm(x, mean=5, sd=sd(rptdata$expmean)), col="darkblue", lwd=2, add=TRUE)
    }
    
  })
})

