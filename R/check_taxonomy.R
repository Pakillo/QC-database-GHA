check_taxonomy <- function(df) {

  require(assertr)

  rgbif::name_backbone_checklist(df$species) |>
    assert(in_set("EXACT", "FUZZY"), matchType)

}
