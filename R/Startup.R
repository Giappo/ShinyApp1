#' Load all modules
#'
#' @inheritParams Documentation
#'
#' @export
LoadModules <- function(...) {
  sourceFiles <- list.files(
    system.file("modules", package = "ShinyApp1"),
    full.names = TRUE,
    recursive = TRUE
  )
  for (sourceFile in sourceFiles) {
    source(sourceFile)
    cat(paste0("Loading module: ", sourceFile, "\n"))
  }
}

#' Load all libraries
#'
#' @inheritParams Documentation
#'
#' @export
LoadLibraries <- function(...) {
  desc_file <- "DESCRIPTION"
  desc <- t(read.dcf(desc_file))

  packages <- strsplit(
    desc[rownames(desc) %in% c("Imports", "Depends")],
    ", "
  ) %>%
    unlist() %>%
    strsplit(split = ",\n") %>%
    unlist()

  for (package in packages) {
    library(package, character.only = TRUE)
    cat(paste0(package, " loaded.\n"))
  }
}
