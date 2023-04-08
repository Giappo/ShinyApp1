mod_tab1_server <- function(
    id,
    DataSetName
) {
  shiny::moduleServer(id, function(input, output, session) {
    ns <- session$ns

    # Sidebar
    output$input1 <- shiny::renderUI({
      choices <- data()$results %>% as.data.frame() %>% dplyr::pull(Item) %>% sort()

      shiny::selectInput(
        inputId = "tab1_input1",
        label = "Select Dataset",
        choices = choices,
        selected = choices[1]
      )
    })

    # Body
    DataSet <- shiny::reactive({
      shiny::req(DataSetName())
      get(DataSetName()) %>% as.data.frame()
    })

    output$plot1 <- plotly::renderPlotly({
      shiny::req(DataSet())
      cat("Rendering plot1 in", id, "for dataset", DataSetName(), "\n")
      DataSet() %>% ShinyApp1::BuildPlot()
    })

    output$table1 <- DT::renderDT(server = FALSE, {
      shiny::req(DataSet())
      cat("Rendering table1 in", id, "for dataset", DataSetName(), "\n")
      DataSet() %>% ShinyApp1::BuildDT()
    })

  })
}
