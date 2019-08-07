filter_tags <- function(x, tag){
  x %>%
    tidyr::unnest(data) %>%
    dplyr::filter(clean_tags %in% tag) %>%
    dplyr::mutate(url = paste0("https://store.steampowered.com/app/",
                               .data$game_id)) %>%
    dplyr::select(-game_id ) %>%
    dplyr::distinct(game_name, .keep_all = TRUE)
}


