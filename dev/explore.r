foo <- 5
f <- c(5, as.integer(5))
typeof(f)
mode(f)
str(f)
summary(f)

f <- list(5, as.integer(5))
typeof(f)
mode(f)
str(f)

explr <- function(x) {
  fs <- list(typeof, mode, str, summary, head)
  lapply(fs, fs, x)

}