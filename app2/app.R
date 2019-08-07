
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Steam Games"),

    fluidRow(
        column(4,
               selectInput("Categorias",
                           "Selecione uma categoria",
                           choices = c("Educacional", "Histórico", "Produção",
                                       "Gerenciamento", "Relações", "Desenvolvimento"))
        ),
        DT::dataTableOutput("table"))
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    steam_games <- games
    # Filter data based on selections
    output$table <- DT::renderDataTable(DT::datatable({
        if (input$Categorias == "Educacional") {
            steam_games <- filter_tags(games, "Education")
        }
        if (input$Categorias == "Histórico") {
            steam_games <- filter_tags(games, "Historical")
        }
        if (input$Categorias == "Produção") {
            steam_games <- filter_tags(games,  c("Video Production", "Audio Production"))
        }
        if (input$Categorias == "Gerenciamento") {
            steam_games <- filter_tags(games,  c("Capitalism", "Economy",
                                                 "Resource Management",
                                                 "Resource Management"))
        }
        if (input$Categorias == "Relações") {
            steam_games <- filter_tags(games,  c("Political", "Politcs", "Diplomacy"))
        }
        if (input$Categorias == "Desenvolvimento") {
            steam_games <- filter_tags(games,  c("Game Development",  "GameMaker",
                                               "Animation & Modeling",
                                               "Design & Illustration"))
        }
  steam_games
    }))
}

# Run the application
shinyApp(ui = ui, server = server)
