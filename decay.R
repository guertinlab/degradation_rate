one.phase.exp.decay <- function(df, name = 'Rplot', unit.time = 'minutes') {
    asymp.fit = nls(frac ~ SSasymp(time, yf, y0, log_alpha), data = df)
    one.decay = nls(frac ~ yf + (y0 - yf) * exp(-alpha * time), 
                data = df,
                start = list(y0 = 1, yf = 0.1, alpha = exp(coefficients(asymp.fit)[['log_alpha']])))
    y0 = coef(one.decay)[1]
    yf = coef(one.decay)[2]
    alpha = coef(one.decay)[3]
    time.values = c(0:max(df$time))
#    model.df = cbind(time.values, yf + (y0 - yf) * exp(-alpha * time.values))
    time.one.half = round(log((0.5 - yf)/(y0 - yf))/-alpha, 1)
    pdf(paste(name,'.pdf', sep=''), width=4, height=4, useDingbats=FALSE)
    par(pty="s")
    plot(frac~time, df, ylim = c(0,1), ylab = 'Fraction', xlab = paste0('Time (', unit.time, ')'))
    lines(time.values, yf + (y0 - yf) * exp(-alpha * time.values), col='red')
    text(max(df$time)*0.8, 0.9, bquote('t'[1/2]~' = '~.(time.one.half)))
    dev.off()
    return(list(y0, yf, alpha))
}


