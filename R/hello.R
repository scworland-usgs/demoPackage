#' @title hello
#' @description this is our hello world function
#' @param user1 character representing user 1
#' @param user2 character representing user 2
#' @export
#' @examples
#' hello("tom","sally")
#' hello("sally","tom")

hello <- function(user1, user2) {
  print(paste0("Hello, ", user1, " and ", user2))
}
