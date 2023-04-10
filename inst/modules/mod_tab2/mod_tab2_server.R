mod_tab2_server <- function(
    namespace = "tab2",
    input,
    DataSetName = shiny::reactive(input[[NS2(namespace = namespace, "DatasetName")]])
) {
  shiny::moduleServer(namespace, function(input, output, session) {
    ns <- session$ns
    ns2 <- ShinyApp1::NS2(namespace = namespace)

    # Sidebar
    output$tab2_DatasetName <- shiny::renderUI({
      choices <- data()$results %>%
        as.data.frame() %>%
        dplyr::pull(Item) %>%
        sort()

      shiny::selectInput(
        inputId = ns2("tab2_DatasetName"),
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
      cat("Rendering plot1 in", namespace, "for dataset", DataSetName(), "\n")
      DataSet() %>% ShinyApp1::BuildPlot()
    })

    output$table1 <- DT::renderDT(server = FALSE, {
      shiny::req(DataSet())
      cat("Rendering table1 in", namespace, "for dataset", DataSetName(), "\n")
      DataSet() %>% ShinyApp1::BuildDT()
    })

  })
}
