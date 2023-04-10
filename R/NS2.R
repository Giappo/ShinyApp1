#' Add arguments to function evaluation
#'
#' @inheritParams Documentation
#'
#' @export
NS2 <- function (namespace, id = NULL) {
  namespace <- quote(namespace)

  ns.sep2 <- "_"

  if (length(namespace) == 0)
    ns_prefix <- character(0)
  else ns_prefix <- paste(namespace, collapse = ns.sep2)
  f <- function(id) {
    if (length(id) == 0)
      return(ns_prefix)
    if (length(ns_prefix) == 0)
      return(id)
    paste(ns_prefix, id, sep = ns.sep2)
  }
  if (missing(id)) {
    f
  }
  else {
    f(id)
  }
}
