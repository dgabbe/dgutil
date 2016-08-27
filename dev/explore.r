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

# what about print()?
# look into class() some more
#
explr <- function(x) {
  fs <- c(typeof, mode, class, str, summary, head)
#  lapply(fs, fs, x)
  o <- ""
  for (f in fs) {
    cat("processing\n")
    cat(o, sep = "", quote(f), ": ")
    cat(o, invisible(f(x)))
    cat(o, "\n")
#    print(f(x))
  }
  print(o)
}