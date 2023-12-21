library(shiny)

dados = read.csv("https://raw.githubusercontent.com/wcota/covid19br/master/cases-brazil-states.csv")
dados = dados[which(dados$state == "TOTAL"),]
variaveis = names(dados)[6:26]

ui <- fluidPage(
  selectInput("variavel", 
              "Qual informação?",
              variaveis),
  plotOutput("plot", width = "400px")
)

server <- function(input, output, session) {
  x1 <- reactive({
    dados_BR = dados[,which(names(dados) == input$variavel)]
  })
  output$plot <- renderPlot({
    plot(x1(), type = "l")
  }, res = 96)
}

shinyApp(ui, server)