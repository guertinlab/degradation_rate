source('https://raw.githubusercontent.com/guertinlab/degradation_rate/master/decay.R')

df.gfp = read.table('https://raw.githubusercontent.com/guertinlab/degradation_rate/master/GFP_ARF_ZNF143_AID.txt', header = TRUE)
df.ha = read.table('https://raw.githubusercontent.com/guertinlab/degradation_rate/master/HA_ARF_ZNF143_AID.txt', header = TRUE)
df.107 = read.table('https://raw.githubusercontent.com/guertinlab/degradation_rate/master/ZNF143_ARF_AID_clone107.txt', header = TRUE)
df.99 = read.table('https://raw.githubusercontent.com/guertinlab/degradation_rate/master/ZNF143_ARF_AID_clone99.txt', header = TRUE)

gfp = one.phase.exp.decay(df.gfp,
                    name = 'GFP-ARF ZNF143-AID', unit.time = 'minutes')

ha = one.phase.exp.decay(df.ha,
                    name = 'HA-ARF ZNF143-AID', unit.time = 'minutes')

cl.107 = one.phase.exp.decay(df.107,
                    name = 'ZNF143-AID-ARF clone 107', unit.time = 'minutes')

cl.99 = one.phase.exp.decay(df.99,
                    name = 'ZNF143-AID-ARF clone 99', unit.time = 'minutes')

#GFP HA plot
time.values = c(0:max(c(df.gfp$time, df.ha$time)))

pdf("Figure3E.pdf", width=5, height=4)

plot(
    frac~time, df.gfp, xlim = c(0,max(c(df.gfp$time, df.ha$time))), ylim = c(0,1), ylab = 'Normalized ZNF143 intensity', col = '#20B2AA',
    xlab = 'Time after auxin treatment (minutes)'
)
points(
    frac~time, df.ha, col = '#D00000'
)
lines(
    time.values, gfp[[2]] + (gfp[[1]] - gfp[[2]]) * exp(-gfp[[3]] * time.values),
      col='#20B2AA', lwd = 4
)
lines(
    time.values, ha[[2]] + (ha[[1]] - ha[[2]]) * exp(-ha[[3]] * time.values),
      col='#D00000', lwd = 4
)
text(
    max(c(df.gfp$time, df.ha$time))*0.3, 0.9,
    bquote(bold('HA-ARF-P2A-TIR1 (t'[1/2]~' = '~.(round(log((0.5 - ha[[2]])/(ha[[1]] - ha[[2]]))/-ha[[3]], 1))*')')),
    col = '#D00000', font = 2, cex = 0.9, pos = 4
)
text(
    max(c(df.gfp$time, df.ha$time))*0.3, 0.8,
    bquote(bold('GFP-ARF-P2A-TIR1 (t'[1/2]~' = '~.(round(log((0.5 - gfp[[2]])/(gfp[[1]] - gfp[[2]]))/-gfp[[3]], 1))*')')),
    col = '#20B2AA', font = 2, cex = 0.9, pos = 4
)

dev.off()

#
#ARF-AID clamp plot

time.values = c(0:max(c(df.107$time, df.99$time)))

pdf("Figure8D.pdf", width=5, height=4)

plot(
    frac~time, df.107, xlim = c(0,max(c(df.107$time, df.99$time))), ylim = c(0,1), ylab = 'Normalized ZNF143 intensity', col = '#20B2AA',
    xlab = 'Time after auxin treatment (minutes)'
)
points(
    frac~time, df.99, col = '#D00000'
)
lines(
    time.values, cl.107[[2]] + (cl.107[[1]] - cl.107[[2]]) * exp(-cl.107[[3]] * time.values),
      col='#20B2AA', lwd = 4
)
lines(
    time.values, cl.99[[2]] + (cl.99[[1]] - cl.99[[2]]) * exp(-cl.99[[3]] * time.values),
      col='#D00000', lwd = 4
)
text(
    max(c(df.107$time, df.99$time))*0.5, 0.9,
    bquote(bold('Clone 99 (t'[1/2]~' = '~.(round(log((0.5 - cl.99[[2]])/(cl.99[[1]] - cl.99[[2]]))/-cl.99[[3]], 1))*')')),
    col = '#D00000', font = 2, cex = 0.9, pos = 4
)
text(
    max(c(df.107$time, df.99$time))*0.5, 0.8,
    bquote(bold('Clone 107 (t'[1/2]~' = '~.(round(log((0.5 - cl.107[[2]])/(cl.107[[1]] - cl.107[[2]]))/-cl.107[[3]], 1))*')')),
    col = '#20B2AA', font = 2, cex = 0.9, pos = 4
)

dev.off()
