#' @title summary_dv
#'
#' @description Get max and min of discharge for day of the year.
#'
#' @export
#' @param site character USGS site ID
#' @importFrom dataRetrieval readNWISdv renameNWISColumns
#' @importFrom dplyr mutate group_by summarise
#' @examples
#' site <- "08279500"
#' sum_dv <- summary_dv(site)

summary_dv <- function(site){
  Date <- doy <- Flow <- ".dplyr.var"

  dv_data <- readNWISdv(siteNumbers=site,
                        parameterCd = "00060", startDate = "", endDate = "")

  dv_summ <- renameNWISColumns(dv_data) %>%
    mutate(doy = as.numeric(strftime(Date, format = "%j"))) %>%
    group_by(doy) %>%
    summarise(max = max(Flow, na.rm = TRUE),
              min = min(Flow, na.rm = TRUE))

  return(dv_summ)

}
