library(shiny)
library(shinydashboard)
shinyServer(function(input,output){
  output$histogram <- renderPlot({
    hist(faithful$eruptions, breaks =  input$bins)
  })
  output$rangeSlider <- renderText({
    input$bin2
  })
  output$approvedSales <- renderInfoBox({
    infoBox("Approval Sales", "100,000", icon = icon("bar-chart-o"))
  })
  output$msgOutput <- renderMenu({
    msgs <- apply(read.csv("C:/Users/User/Documents/R/Shiny_Dashboard/messages.csv"),1,function(row){
      messageItem(from = row[["from"]],message =  row[["message"]])
    })
    dropdownMenu(type = "messages", .list= msgs)
  })
  output$Name <- renderText({
    input$txtName
  })
  output$LastName <- renderText({
    input$txtLastName
  })
  output$Gender <- renderText({
    input$Gen
  })
  
 
})