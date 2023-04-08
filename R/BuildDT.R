#' Load all modules
#'
#' @inheritParams Documentation
#'
#' @export
BuildDT <- function(
    table,
    title = "Table",
    fileName,
    menuOutputOptions
) {
  table %>%
    DT::datatable(caption = title)
}
