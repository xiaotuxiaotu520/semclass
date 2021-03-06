#' Residual values from fit models
#'
#' @param object a \code{\link{psem}} object

# Extract residuals
residuals.psem <- function(object, ...){
  object <- removeData(object, formulas = 1)
  
  #get residuals of relationships
  ret <- lapply(object, residuals, ...)
  
  #get column names
  formulaList <- listFormula(object)
  resp <- sapply(formulaList, function(x) all.vars(x)[1])
  names(ret) <- paste(resp, "residuals", sep="_")
  
  do.call(cbind, ret)
}