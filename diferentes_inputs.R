library(shiny)

ui <- fluidPage(
  
  # Inputs de texto livre
  textInput("name", "What's your name?"),
  passwordInput("password", "What's your password?"),
  textAreaInput("story", "Tell me about yourself", rows = 3),
  
  # Inputs numéricos
  numericInput("num", "Number one",
               value = 0, min = 0, max = 100),
  sliderInput("num2", "Number two",
              value = 50, min = 0, max = 100),
  sliderInput("rng", "Range",
              value = c(10, 20), min = 0, max = 100),
  
  # Inputs de datas
  dateInput("dob", 
            "When were you born?"),
  dateRangeInput("holiday", 
                 "When do you want to go on vacation next?"),
  
  # Inputs limitados
  selectInput("state", 
              "What's your favourite state?",
              state.name),
  radioButtons("animal", 
               "What's your favourite animal?",
               c("dog", "cat", "mouse", "bird", "other", "I hate animals")),
  
  #Radio buttons
  radioButtons("rb", "Choose one:",
               choiceNames = list(
                 icon("angry"),
                 icon("smile"),
                 icon("sad-tear")
               ),
               choiceValues = list("angry", "happy", "sad")
  ),
  
  # Diversas seleções
  checkboxGroupInput("animal", 
                     "What animals do you like?",
                     c("dog", "cat", "mouse", "bird", "other", "I hate animals")),
  
  # Checkbox para única pergunta
  checkboxInput("cleanup", "Clean up?", value = TRUE),
  checkboxInput("shutdown", "Shutdown?"),
  
  # Upload de arquivos
  fileInput("upload", NULL),
  
  # Botões de ação
  actionButton("click", "Click me!"),
  actionButton("drink", "Drink me!", icon = icon("cocktail"))
)

server <- function(input, output, session){
}

shinyApp(ui, server)