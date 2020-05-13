source('https://raw.githubusercontent.com/guertinlab/degradation_rate/master/decay.R')

#df = read.table('https://raw.githubusercontent.com/guertinlab/degradation_rate/master/GFP_ARF_ZNF143_AID.txt', header = TRUE)
#df = read.table('https://raw.githubusercontent.com/guertinlab/degradation_rate/master/HA_ARF_ZNF143_AID.txt', header = TRUE)
#df = read.table('https://raw.githubusercontent.com/guertinlab/degradation_rate/master/ZNF143_ARF_AID_clone107.txt', header = TRUE)
#df = read.table('https://raw.githubusercontent.com/guertinlab/degradation_rate/master/ZNF143_ARF_AID_clone99.txt', header = TRUE)

one.phase.exp.decay(read.table('https://raw.githubusercontent.com/guertinlab/degradation_rate/master/GFP_ARF_ZNF143_AID.txt', header = TRUE),
                    name = 'GFP-ARF ZNF143-AID', unit.time = 'minutes')

one.phase.exp.decay(read.table('https://raw.githubusercontent.com/guertinlab/degradation_rate/master/HA_ARF_ZNF143_AID.txt', header = TRUE),
                    name = 'HA-ARF ZNF143-AID', unit.time = 'minutes')

one.phase.exp.decay(read.table('https://raw.githubusercontent.com/guertinlab/degradation_rate/master/ZNF143_ARF_AID_clone107.txt', header = TRUE),
                    name = 'ZNF143-AID-ARF clone 107', unit.time = 'minutes')

one.phase.exp.decay(read.table('https://raw.githubusercontent.com/guertinlab/degradation_rate/master/ZNF143_ARF_AID_clone99.txt', header = TRUE),
                    name = 'ZNF143-AID-ARF clone 99', unit.time = 'minutes')
