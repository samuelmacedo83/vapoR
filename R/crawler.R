#' @export
games <- function(){
  steam_url <- "https://steamdb.info/graph/"

  all_data <- xml2::read_html(steam_url) %>%
    rvest::html_nodes("td") %>%
    rvest::html_text()

  game_id <- seq(9, length(all_data), by = 6) # the first game id starts on 9 postition
  game_name <- seq(10, length(all_data), by = 6) # the first game name starts on 10 postition

  game_id <- dplyr::tibble(game_id = all_data[game_id])
  game_name <- dplyr::tibble(game_name = all_data[game_name])

  steam_games <- dplyr::bind_cols(game_name, game_id)

  # tags
  steam_app_url <- "https://store.steampowered.com/app/"
  total_tags <- NULL

  for(i in 1:length(game_id$game_id)){
    game_url <- paste0(steam_app_url, game_id$game_id[i])
    tags <- xml2::read_html(game_url) %>%
      rvest::html_nodes(".app_tag") %>%
      rvest::html_text()

    clean_tags <- NULL
    for(i in 1:length(tags)){
      clean_tags[i] <- stringr::str_remove_all(tags[i], "\t") %>%
        stringr::str_remove("\r\n")
    }

    tags_nested <- tidyr::nest(dplyr::data_frame(clean_tags))
    total_tags <- dplyr::bind_rows(total_tags, tags_nested)
  }

  dplyr::bind_cols(steam_games, total_tags) %>%
    save(file = "games.RData")
}
