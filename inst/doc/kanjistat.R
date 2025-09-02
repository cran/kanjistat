## ----setup, include = FALSE-------------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
oldopt <- options(width = 90)
if(capabilities("cairo"))
    knitr::opts_chunk$set(dev.args = list(png  = list(type = "cairo")))

## ----message=FALSE----------------------------------------------------------------------
library(kanjistat)
lookup("猫")  

## ----error=TRUE-------------------------------------------------------------------------
try({
"\u732b"
lookup("\u732b")
# "\u{26951}" gives usually Error: invalid \u{xxxx} sequence
"\U26951"
"\U00026951"
})

## ---------------------------------------------------------------------------------------
codepointToKanji("26951")
kanjiToCodepoint("猫")  

## ---------------------------------------------------------------------------------------
lookup("猫")
lookup(c("猫","犬"), "basic")
lookup(c("猫","犬"), "morphologic")

## ----message = FALSE--------------------------------------------------------------------
kbase[kbase$strokes > 30,]

if (require(dplyr)) {
  kbase %>% filter(strokes > 30)
}

## ----eval=FALSE-------------------------------------------------------------------------
# # Pregenerated output, run on the author's system. Your mileage may vary.
# 
# # Locate the free kaisho font by Nagayama Norio (previously installed)
# nagayama <- systemfonts::match_font("nagayama_kai")
# nagayama
# #> $path
# #> [1] "/Users/dschuhm/Library/Fonts/nagayama_kai08.otf"
# #>
# #> $index
# #> [1] 0
# #>
# #> $features
# #> NULL
# hsans <- systemfonts::match_font("Hiragino Sans")
# hmincho <- systemfonts::match_font("Hiragino Mincho ProN")
# yukyokasho <- systemfonts::match_font("YuKyokasho")
# 
# # Add the font to the sysfonts database under the name given by `family`
# sysfonts::font_add(family = "nagayama_kai", regular=nagayama$path)
# sysfonts::font_add(family = "hiragino_sans", regular=hsans$path)
# sysfonts::font_add(family = "hiragino_mincho", regular=hmincho$path)
# sysfonts::font_add(family = "yu_kyokasho", regular=yukyokasho$path)
# 
# # Display the fonts families in the sysfonts database
# sysfonts::font_families()
# #> [1] "sans"            "serif"           "mono"            "nagayama_kai"    "hiragino_sans"
# #> [6] "hiragino_mincho" "yu_kyokasho"

## ----echo = FALSE, eval = FALSE---------------------------------------------------------
# require(systemfonts)
# # looking for the free kaisho font by Nagayama Norio we have previously installed
# nagayama <- systemfonts::match_font("nagayama_kai")
# nagayama
# hsans <- systemfonts::match_font("Hiragino Sans")
# hmincho <- systemfonts::match_font("Hiragino Mincho ProN")
# yukyokasho <- systemfonts::match_font("YuKyokasho")
# 
# sysfonts::font_add(family = "nagayama_kai", regular=nagayama$path)
# sysfonts::font_add(family = "hiragino_sans", regular=hsans$path)
# sysfonts::font_add(family = "hiragino_mincho", regular=hmincho$path)
# sysfonts::font_add(family = "yu_kyokasho", regular=yukyokasho$path)
# 
# sysfonts::font_families()
# # showtext_auto()    # sees to it that showtext gets used when we say text below
# # showtext_auto(enable = FALSE)

## ----eval=FALSE, fig.align='left', fig.height=5, fig.width=7, fig.showtext=TRUE, message=FALSE----
# # Pregenerated output, run on the author's system. Your mileage may vary.
# 
# showtext::showtext_auto()  # give control for displaying text in plots to package `showtext`
# oldpar <- par(mai=c(0.8, 0.4, 0.8, 0.4))
# 
# # data
# petpercent <- c(11.1, 9.6, 3.5, 2.2, 1.6, 1.5, 1.4, 0.7, 0.6, 0.5, 0.4, 0.4, 0.3, 0.2, 0.1, 0.1, 0.5)
# petshort <- c(petpercent[1:7], sum(petpercent[8:17]))
# petnames <- c("犬", "猫", "メダカ", "金魚", "カメ", "小鳥", "熱帯魚", "その他")
# 
# # plot and annotate
# barplot(petshort, las=1, col="darkolivegreen3", # names.arg=petnames does not position nicely
#         main="ペット現在飼育状況 (2002年)\n (Pet Ownership 2022 in Japan)", family="hiragino_mincho")
# mtext(petnames, side=1, line=0.35, at=-0.5 + 1.2*(1:8), family="hiragino_mincho")
#   # bars have width 1 and space 0.2
# mtext("%", side=2, line=0.5, at=11, las=1, family="hiragino_mincho")
# mtext("Source: ペットフード協会 (https://petfood.or.jp/data/)", side=1, line=2,
#       family="hiragino_mincho", cex=0.75)
# 
# par(oldpar)
# showtext::showtext_auto(enable = FALSE)  # give back control to the usual R code

## ----echo=FALSE, eval=TRUE--------------------------------------------------------------
 if (knitr::is_html_output()) {
   knitr::asis_output("![](./figures/japanese_pets.svg){width=90%}")
 } else {
   knitr::asis_output("![](./figures/japanese_pets.pdf){width=90%}")
 }

## ----message=FALSE, eval=FALSE, fig.align='left', fig.height=2, fig.width=8, fig.showtext=TRUE, message=FALSE----
# # Pregenerated output, run on the author's system. Your mileage may vary.
# plotkanji(rep("猫",4), family=c("hiragino_sans", "hiragino_mincho", "yu_kyokasho", "nagayama_kai"),
#           height=2)

## ----message=FALSE, echo=FALSE, eval=FALSE, fig.align='left', fig.height=2, fig.width=8, fig.showtext=TRUE, message=FALSE----
# plotkanji(rep("猫",4), device="png", filename="four_cats.png",
#           family=c("hiragino_sans", "hiragino_mincho", "yu_kyokasho", "nagayama_kai"),
#           factor=40, width=1536, height=384)

## ----echo=FALSE, eval=FALSE, fig.align='left', fig.height=2, fig.showtext=TRUE, fig.width=8, message=FALSE----
# # Pregenerated output, run on the author's system. Your mileage may vary.
# fuji <- kanjimat(kanji="藤", family="nagayama_kai", size = 128)
# fuji
# str(fuji)
# plot(fuji)

## ----message=FALSE, eval=FALSE----------------------------------------------------------
# # Pregenerated output, run on the author's system. Your mileage may vary.
# fuji <- kanjimat(kanji="藤", family="nagayama_kai", size = 128)
# fuji
# #> Kanjimat representation of 藤 (Unicode 85e4)
# #> 128x128 bitmap in nagayama_kai font with 0 margin, antialiased
# str(fuji)
# #> List of 8
# #>  $ char     : chr "藤"
# #>  $ hex      : 'hexmode' int 85e4
# #>  $ padhex   : chr "085e4"
# #>  $ family   : chr "nagayama_kai"
# #>  $ size     : num 128
# #>  $ margin   : num 0
# #>  $ antialias: logi TRUE
# #>  $ matrix   : num [1:128, 1:128] 0 0 0 0 0 0 0 0 0 0 ...
# #>  - attr(*, "call")= chr "kanjimat(kanji = \"藤\", family = \"nagayama_kai\", size = 128)"
# #>  - attr(*, "kanjistat_version")=Classes 'package_version', 'numeric_version'  hidden list of 1
# #>   ..$ : int [1:3] 0 8 0
# #>  - attr(*, "Rversion")= chr "R version 4.3.0 (2023-04-21)"
# #>  - attr(*, "platform")= chr "x86_64-apple-darwin20"
# #>  - attr(*, "png_type")= chr "cairo"
# #>  - attr(*, "class")= chr "kanjimat"
# plot(fuji)

## ----eval = FALSE-----------------------------------------------------------------------
# sysfonts::font_add(family = "nagayama_kai", regular="/Users/dschuhm/Library/Fonts/nagayama_kai08.otf")

## ----eval = FALSE-----------------------------------------------------------------------
# kanjistat_options(ask_github = TRUE, default_bitmap_size = 64, default_font = "yu_kyokasho")

## ----eval = FALSE-----------------------------------------------------------------------
# load("/path/to/the/data/kvec.rda", envir = .GlobalEnv)

## ----cleanup, include = FALSE-------------------------------------------------
  options(oldopt)

