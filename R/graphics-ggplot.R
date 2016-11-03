#' Modified theme_bw for a simple, colored version of the theme.
#' @import ggplot2
#' @export
theme_dg <- theme_bw() +
  theme(panel.grid.minor = element_line(colour="#666666", linetype="dotted", size=0.25),
        panel.grid.major = element_line(size = 0.25, color = "#555555"),
        panel.background = element_blank(),
        plot.title = element_text(size = rel(1.75), face = "bold", vjust = 1),
        axis.text = element_text(size = rel(1.25)),
        axis.title.x = element_text(size = rel(1.5), vjust = -1),
        axis.title.y = element_text(size = rel(1.5), vjust = 0)
  )
