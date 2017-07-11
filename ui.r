library(shiny)
library(shinydashboard)
shinyUI(
  dashboardPage(skin = "yellow", title = "demo",
    dashboardHeader(title = "Menu", dropdownMenuOutput("msgOutput"),
                    # dropdownMenu(type = "message",
                    #              messageItem(from = "Finance Update", message = "we are from Finance"),
                    #              messageItem(from = "Sales Update", message =  "Sales are at 55%", icon =  icon("bar-chart"), time = "22:00"),
                    #              messageItem(from = "Sales Update", message =  "Sales meeting at 6:00 PM", icon =  icon("handshake-o"), time = "07-07-2017"))
            dropdownMenu(type = "notifications", 
              notificationItem(
              text = "2 new tabs added to the dashboard",
              icon = icon("bar-chart"),
              status = "success"
              ), 
              notificationItem(
              text = "server is currently  running at 90% load",
              icon = icon("warning"),
              status = "warning"
            )              
            ),
            dropdownMenu(type = "tasks",
                         taskItem(
                           value = 80,
                           color= "green", 
                           "Shiny Dashboard Education"),
                         
                         taskItem(
                           value = 55,
                           color = "red",
                           "Overall R Education"
                         ), 
                         taskItem(
                           value = 40,
                           color = "red",
                           "Data Science Education"
                             
                         )
                         )
            
         ),
    
    dashboardSidebar( 
      sidebarSearchForm("searchText","buttonSearch","Search"),
      sliderInput("bins", "Number of Breaks", 1, 100,50),
      sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard" , icon = icon("bar-chart")), 
        menuSubItem("Sales Dept", tabName = "sales"),
        menuSubItem("Finance Dept.", tabName = "finance"  ),
        menuSubItem("Form", tabName = "InputBox_Tut"),
        menuItem("Detailed Analysis" , badgeLabel = "New", badgeColor = "blue"),
    
      menuItem("Raw Data", tabName = "RawData")
      
    )),
    dashboardBody(
     
      tabItems(
        tabItem(tabName = "dashboard",
                fluidRow(
                  column(width =7,
                  infoBox("Sales",10000, icon = icon("thumbs-up")),
                  infoBox("Conversion %",paste("20%"), icon = icon("warning")),
                  infoBoxOutput("approvedSales")
                  )     
                          
                ),
          
                
                
                fluidRow(
                  tabBox(
                  tabPanel(title = "Demo Histogram", status = "primary", solidHeader = TRUE, plotOutput("histogram")),
                  
                  tabPanel(title = "Control for Dashboard", status ="warning", solidHeader = T,  sliderInput("bins2", "Number of Breaks", 1, 100, value =  c(10,20)),background = "black", step = 5 )
                  )
                 
                  
                 
                  ), ### To add box 1) remove tabBox() 2) replace tabPanel with box
                  
                fluidRow(
                  textOutput("rangeSlider"))
                  ),
                
        tabItem(tabName = "finance",
        h1("Finance Dashboard")
        ),
       tabItem(tabName = "sales",
        h1("Sales Dashboard")
        ),
       tabItem(tabName = "InputBox_Tut",
        h1("InputBox Tutorial"),
        tabPanel("Demo of InputBox", textInput("txtName","Insert your name"),
        textInput("txtLastName","Insert your last name"),
        radioButtons("Gen","", choices = c("Male", "Female"), selected =  "Male" , inline =  T),
        textOutput("Name"),
        textOutput("LastName"),
        textOutput("Gender"))
     
       
        )
        
    ),
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
    )

,
#datatab
tabItems(
  tabItem(tabName = "RawData",
        
          fluidRow(
            tabBox(
              tabPanel(title = "Data", status = "primary", solidHeader = TRUE),
              
              tabPanel(title = "Summary", status ="warning", solidHeader = T),
              tabPanel(title = "Plot", status = "warning", solidHeader = TRUE)
            )
            
            
            
          ) ### To add box 1) remove tabBox() 2) replace tabPanel with box
          
         
  )
  
)
)
))



