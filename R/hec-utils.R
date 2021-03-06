#' List Available data
#' @description list the datasets available in the hdf file. Use domain to show only one of 
#' 'two' dimensions or 'one' crossetions. By default it will show both (if available).
#' @param hc a "hec" object 
#' @param domain which domain to list data for, will default to both, options are 'one' or 'two'
#' @export 
hec_datasets <- function(hc, domain=NULL) {
  one_path <- "Results/Unsteady/Output/Output Blocks/Base Output/Unsteady Time Series/Cross Sections"
  two_path <- glue::glue(
    "Results/Unsteady/Output/Output Blocks/Base Output/Unsteady Time Series/2D Flow Areas/{area}", 
    area = get_plan_area(hc)
    )
  
  one <- NULL
  two <- NULL
  
  if (is.null(domain)) {
    if (has_crossections(hc)) 
      one <- hc$object[[one_path]]$ls()
    if (has_2d(hc))
      two <- hc$object[[two_path]]$ls()
    
    if (is.null(one) & is.null(two)) stop("Neither 'one' or'two' domains available for this model")
    if (is.null(one)) warning("this model only has domain 'two' defined")
    if (is.null(two)) warning("this model only has domain 'one' defined")
  } else if (domain == 'one') {
    if (!has_crossections(hc)) stop("Domain request was 'one' but is not available for this model", 
                                    call.=FALSE)
    one <- hc$object[[one_path]]$ls()
  } else if (domain == 'two') {
    if (!has_2d(hc)) stop("Domain request was 'two' but not available for this model", 
                          call. = FALSE)
    two <- hc$object[[two_path]]$ls()
  }
  structure(
    list(
      'one' = one,
      'two' = two
    ), 
    class="hec_datasets"
  )
}


#' Print datasets
#' @export
print.hec_datasets <- function(x, ...) {
  if (!is.null(x$one)) {
    cat('One Dim ------\n')
    print(dplyr::select(x$one, name, "dim" = dataset.dims))
  }
  if (!is.null(x$two)) {
    cat('Two Dim ------\n')
    print(dplyr::select(x$two, name, "dim" = dataset.dims))
  }
}

# operates on a hec object
has_crossections <- function(hc) {
  "Cross Sections" %in% names(hc$object[["Geometry"]])
}

# operates on the hec object
has_2d <- function(hc) {
  "2D Flow Areas" %in% names(hc$object[["Geometry"]])
}

# operates on a hec object
hec_timestamps <- function(hc) {
  as.POSIXct(hc$object[["Results/Unsteady/Output/Output Blocks/Base Output/Unsteady Time Series/Time Date Stamp"]]$read(), 
             format = "%d%b%Y %H:%M:%S")
}

# opearates on a hec object
get_plan_area <- function(hc) {
  trimws(hc$object[["Results/Unsteady/Output/Output Blocks/Base Output/Unsteady Time Series/2D Flow Areas/"]]$ls()$name[1])
}









