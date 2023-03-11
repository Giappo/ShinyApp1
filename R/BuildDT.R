#' Load all modules
#'
#' @inheritParams Documentation
#'
#' @export
BuildDT <- function(
    data,
    title = "Table",
    fileName,
    menuOutputOptions
) {
  data %>%
    DT::datatable(caption = title)
}
