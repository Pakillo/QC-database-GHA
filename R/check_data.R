check_data <- function(df) {

  require(assertr)

  df |>
    chain_start() |>
    assert(in_set("black", "red"), fruit_colour) |>
    assert(within_bounds(0, 5), fruit_weight_g) |>
    chain_end()

}
