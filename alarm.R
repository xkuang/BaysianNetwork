library(bnlearn)

true = empty.graph(names(alarm))
modelstring(true) = paste("[HIST|LVF][CVP|LVV]",
                            "[PCWP|LVV][HYP][LVV|HYP:LVF][LVF]",
                            "[STKV|HYP:LVF][ERLO][HRBP|ERLO:HR]",
                            "[HREK|ERCA:HR][ERCA][HRSA|ERCA:HR][ANES]",
                            "[APL][TPR|APL][ECO2|ACO2:VLNG][KINK]",
                            "[MINV|INT:VLNG][FIO2][PVS|FIO2:VALV]",
                            "[SAO2|PVS:SHNT][PAP|PMB][PMB][SHNT|INT:PMB]",
                            "[INT][PRSS|INT:KINK:VTUB][DISC][MVS]", "[VMCH|MVS][VTUB|DISC:VMCH]",
                            "[VLNG|INT:KINK:VTUB][VALV|INT:VLNG]",
                            "[ACO2|VALV][CCHL|ACO2:ANES:SAO2:TPR]",
                            "[HR|CCHL][CO|HR:STKV][BP|CO:TPR]", sep = "")

bn.gs = gs(alarm)
bn.iamb = iamb(alarm)
bn.inter = inter.iamb(alarm)
par(mfrow = c(2, 2))
graphviz.plot(true, main = "True Structure") 
graphviz.plot(bn.gs, main = "Grow-Shrink")
graphviz.plot(bn.iamb, main = "IAMB")
graphviz.plot(bn.inter, main = "Inter-IAMB") 
unlist(compare(true, bn.gs))
unlist(compare(true, bn.iamb))
unlist(compare(true, bn.inter))
score(cextend(bn.gs), alarm, type = "bde")
score(cextend(bn.iamb), alarm, type = "bde") 
score(cextend(bn.inter), alarm, type = "bde")
