library(shiny)

ui <- fluidPage(
  
  # Textos
  textOutput("text"),
  verbatimTextOutput("code"),
  
  # Tabelas
  tableOutput("static"),
  dataTableOutput("dynamic"),
  
  # Gráficos
  plotOutput("plot", width = "400px")
)
server <- function(input, output, session) {
  
  # Textos
  output$text <- renderText({ 
    "Hello friend!" 
  })
  output$code <- renderPrint({ 
    summary(1:10) 
  })
  
  # Tabelas
  output$static <- renderTable({
    head(mtcars)
  })
  output$dynamic <- renderDataTable({
    mtcars
  }, options = list(pageLength = 5))
  
  # Gráficos
  output$plot <- renderPlot(plot(1:5), res = 96)
}

shinyApp(ui, server)