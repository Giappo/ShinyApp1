mod_tab2_server <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    ns <- session$ns

    df <- iris

    # Sidebar
    output$input1 <- shiny::renderUI({
      shiny::selectInput(
        "input_tab1",
        label = "Select Input for Tab 1",
        choices = c("Option 1", "Option 2")
      )
    })

    # Body
    output$plot1 <- shiny::renderPlot({
      cat("Rendering plot1 from", id, "\n")
      plot(df)
    })

    output$table1 <- DT::renderDT(server = FALSE, {
      cat("Rendering table1 from", id, "\n")
      df %>% ShinyApp1::BuildDT()
    })

  })
}
