#' Load all modules
#'
#' @inheritParams Documentation
#'
#' @export
BuildPlot <- function(
    table,
    title = "Table",
    fileName,
    menuOutputOptions
) {
  x_var <- names(table)[sapply(table, is.numeric)][1]
  y_var <- names(table)[sapply(table, is.numeric)][2]
  table %>%
    plotly::plot_ly(
      x = stats::as.formula(paste0("~", x_var)),
      y = stats::as.formula(paste0("~", y_var)),
      type = "scatter",
      mode = "markers"
    )
}
