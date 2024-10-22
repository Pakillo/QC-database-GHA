
## Import data
df <- gsheet::gsheet2tbl("https://docs.google.com/spreadsheets/d/1oEp3LAcXLt5frr3dverde1YjwUg1fihVtEXKwaLJ_ns/edit?usp=sharing")

## Check values
library(assertr)
df |>
  chain_start() |>
  assert(in_set("black", "red"), fruit_colour) |>
  assert(within_bounds(0, 5), fruit_weight_g) |>
  chain_end()

## Check taxonomy
rgbif::name_backbone_checklist(df$species) |>
  assert(in_set("EXACT", "FUZZY"), matchType)

## Append new data to database
write.table(df, "database.csv", append = TRUE, sep = ",",
            col.names = FALSE, row.names = FALSE)


