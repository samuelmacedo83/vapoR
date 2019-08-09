# library(rvest)
#
# # get game names and ids
#
# steam_url <- "https://steamdb.info/graph/"
#
# all_data <- read_html(steam_url) %>%
#   html_nodes("td") %>%
#   html_text()
#
# game_id <- seq(9, length(all_data), by = 6) # the first game id starts on 9 postition
# game_name <- seq(10, length(all_data), by = 6) # the first game name starts on 10 postition
# game_current <- seq(11, length(all_data), by = 6) # the first game name starts on 10 postition
# game_peak_24 <- seq(12, length(all_data), by = 6) # the first game name starts on 10 postition
#
# game_id <- dplyr::tibble(game_id = all_data[game_id])
# game_name <- dplyr::tibble(game_name = all_data[game_name])
# game_current <- dplyr::tibble(game_current = all_data[game_current])
# game_peak_24 <- dplyr::tibble(game_peak_24 = all_data[game_peak_24])
#
# steam_games <- dplyr::bind_cols(game_name, game_id)
#
# # get game tags
# game_id <- purrr::map(game_id, as.integer)
# steam_app_url <- "https://store.steampowered.com/app/"
# total_tags <- NULL
#
# for(i in 1:length(game_id$game_id)){
#   game_url <- paste0(steam_app_url, game_id$game_id[i])
#   tags <- read_html(game_url) %>%
#     html_nodes(".app_tag") %>%
#     html_text()
#
#   clean_tags <- NULL
#   for(i in 1:length(tags)){
#     clean_tags[i] <- stringr::str_remove_all(tags[i], "\t") %>%
#       stringr::str_remove("\r\n")
#   }
#   total_tags <- c(total_tags, clean_tags)
# }
#
# # tags
# steam_app_url <- "https://store.steampowered.com/app/"
# total_tags <- NULL
#
# for(i in 1:length(game_id$game_id)){
#   game_url <- paste0(steam_app_url, game_id$game_id[i])
#   tags <- read_html(game_url) %>%
#     html_nodes(".app_tag") %>%
#     html_text()
#
#   clean_tags <- NULL
#   for(i in 1:length(tags)){
#     clean_tags[i] <- stringr::str_remove_all(tags[i], "\t") %>%
#       stringr::str_remove("\r\n")
#   }
#
#   tags_nested <- tidyr::nest(dplyr::data_frame(clean_tags))
#   total_tags <- dplyr::bind_rows(total_tags, tags_nested)
# }
#
# dplyr::bind_cols(steam_games, total_tags) %>%
#   save(file = "games.RData")
#
# # filter
# games %>%
#   unnest(data) %>%
#   filter(clean_tags %in% c("Video Production", "Audio Production")) %>%
#   mutate(url = paste0("https://store.steampowered.com/app/", .data$game_id)) %>%
#   dplyr::mutate(url = paste0("<a href='", .data$url, "'>", .data$game_id), "</a>")
#
# gta_url <- "https://store.steampowered.com/app/271590"
# a <- read_html(gta_url) %>%
#   html_nodes(".app_tag") %>%
#   html_text()
#
# b <- NULL
# for(i in 1:length(a)){
#   b[i] <- stringr::str_remove_all(a[i], "\t") %>%
#     stringr::str_remove("\r\n")
# }
#
#
#
#
#
#
#
# app_tag
#
#
# read_html(steam_url) %>%
#   html_nodes("td a") %>%
#   html_text()
#
# a <- read_html(steam_url) %>%
#   html_nodes("td") %>%
#   html_text()
#
# %>%
#   dplyr::as_tibble() %>%
#   dplyr::filter(value != "\n\n")
#
#
#
#
# 9 10
# 15 16
# 21 22
# 27 28
#
#
#
# seq(9, 8016, by =6)
#
