mod_tab1_server <- function(
    namespace = "tab1",
    input,
    DataSetName = shiny::reactive(input[[NS2(namespace = namespace, "DatasetName")]]),
    X = shiny::reactive(input[[NS2(namespace = namespace, "X")]]),
    Y = shiny::reactive(input[[NS2(namespace = namespace, "Y")]])
) {
  shiny::moduleServer(namespace, function(input, output, session) {
    ns <- session$ns
    ns2 <- ShinyApp1::NS2(namespace = namespace)

    # Sidebar
    output$DatasetName <- shiny::renderUI({
      choices <- data()$results %>%
        as.data.frame() %>%
        dplyr::pull(Item) %>%
        sort()

      shiny::selectInput(
        inputId = ns2("DatasetName"),
        label = "Select Dataset",
        choices = choices,
        selected = choices[1]
      )
    })

    output$X <- shiny::renderUI({
      shiny::req(DataSet())
      choices <- DataSet() %>%
        colnames() %>%
        sort()

      shiny::selectInput(
        inputId = ns2("X"),
        label = "Select x coordinate:",
        choices = choices,
        selected = choices[1]
      )
    })

    output$Y <- shiny::renderUI({
      shiny::req(DataSet())
      choices <- DataSet() %>%
        colnames() %>%
        sort()

      if (length(choices) > 1) {
        shiny::selectInput(
          inputId = ns2("Y"),
          label = "Select y coordinate:",
          choices = choices,
          selected = choices[2]
        )
      } else {
        shiny::h5("Not available for this dataset.")
      }
    })

    # Body
    DataSet <- shiny::reactive({
      shiny::req(DataSetName())
      get(DataSetName()) %>% as.data.frame()
    })

    output$plot1 <- plotly::renderPlotly({
      shiny::req(DataSet())
      shiny::req(X())
      shiny::req(Y())
      cat("Rendering plot1 in", namespace, "for dataset", DataSetName(), "\n")

      DataSet() %>%
        dplyr::select(rlang::sym(X()), rlang::sym(Y())) %>%
        ShinyApp1::BuildPlot()
    })

    output$table1 <- DT::renderDT(server = FALSE, {
      shiny::req(DataSet())
      cat("Rendering table1 in", namespace, "for dataset", DataSetName(), "\n")
      DataSet() %>% ShinyApp1::BuildDT()
    })

  })
}
