## [2020-04-29 Wed]
## copied from ~/papers/2007_bihor/figs/bihor_common.R
library(sjedist)


expt.col <- "grey"; expt.lty <- 1; expt.lwd <- 2

plot.spat.array <- function (arr, r = NULL, ylab, xticks, yticks, ...) {
    if (is.null(r)) {
        r <- colnames(arr)
    }
    if (missing(ylab)) {
        ylab <- attributes(arr)$name
        if (is.null(ylab)) 
            ylab <- deparse(substitute(arr))
    }

    plot(r, arr[1, ], col = expt.col, lwd=expt.lwd, lty=expt.lty,
         type = "l", bty = "n",
         asp=1, xaxt="n", yaxt="n",
         xlim=range(xticks), ylim=range(yticks),
         ylab = ylab, ...)

    if (missing(xticks))
      axis(1)
    else {
      axis(1, at=xticks, labels=names(xticks))
    }

    if (missing(yticks))
      axis(2)
    else {
      axis(2, at=yticks, labels=names(yticks))
    }

      
    ##title(main = ranking(arr))
    legend('topleft', legend=c("", sprintf("p = %.2f", ranking(arr))), bty='n')


    plot.CI <- TRUE
    if (plot.CI) {
      p <- 0.05                             # 5% for 95% confidence intervals 
      ci <- apply(arr[-1,], 2, quantile, probs=c(p/2, 1-(p/2)))
      lines(r, ci[1,], lty=2)
      lines(r, ci[2,], lty=2)
    } else {
      lines(r, apply(arr[-1, ], 2, min), lty = 1)
      lines(r, apply(arr[-1, ], 2, max), lty = 1)
    }
    ##lines(r, apply(arr[-1, ], 2, median), lty = 1, col='black')
    if (substring(ylab, 1, 1) == "l") {
        max.r <- max(as.numeric(r))
        segments(0, 0, max.r, max.r, lwd = 1, lty = 2)
    }
}

ticks <- function(v, i=1) {
  ## V: vector of points where ticks should be labelled.
  ## I: number of intervening tick marks between labels (can be zero).
  n <- length(v)
  little.gap <- (v[2] - v[1]) / (i+1)
  little.n <- ( (n - 1) * (i+1) ) + 1
  m <- seq(from=v[1], by=little.gap, length=little.n)
  labels <- rep("", little.n)
  labels[ seq(from=1, by=(i+1), length=n) ] <- v
  names(m) <- labels
  m
}
## ticks( c(0,30,60,90), 2)
## ticks( c(0,30,60,90), 1)


plot.spat.ri3 <- function (ri3, cex = 0.5, ylim = range(ri3),
                           ylab = "regularity index", 
                           yticks, ...) {
  res <- list(on = ri3[-1, 1], of = ri3[-1, 2], on.off = ri3[-1, 3])
  ylim <- range(yticks)

  ## temporarily inhibit stripchart making a yaxis, so that I can
  ## add my own.
  op <- par(yaxt='n')
  stripchart(res, vert = T, pch = 19, method = "jitter", cex = cex, 
             ylim = ylim, group.names = c("1", "2", "1+2"), main = "",
             ylab = ylab)
  par(op)
  axis(2, at=yticks, labels=names(yticks))

  median.sim <- apply(ri3[-1, ], 2, median)
  i <- 1:3
  dx <- 0.3
  segments(i - dx, ri3[1, ], i + dx, ri3[1, ], lwd = expt.lwd,
           lty=expt.lty, col = expt.col)
  segments(i - dx, median.sim, i + dx, median.sim, lwd = 0.5, 
           lty = 1)
}


