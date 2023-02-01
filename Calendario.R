library(ggplot2)
Dia_D = as.Date("25-01-2023","%d-%m-%Y") #dd-mm-aaaa Dia da primeira menstruação
Dia_N = 12 #min 1 max 12 Número de cliclos/meses
Dia_M = 2 #min 1 max 10 Tempo da menstruação em dias
Dia_T = 28 #min 20 max 35 Tempo para a proxima menstruação em dias
Dia_F = Dia_D+(Dia_N*Dia_T)-1 #ultimo dia 


dfr <- data.frame(date=seq(Dia_D,Dia_D+(Dia_N*Dia_T)-1,by=1))
dfr$day <- factor(strftime(dfr$date,format="%a"),levels=rev(c("seg","ter","qua","qui","sex","sáb","dom")))
dfr$week <- factor(strftime(dfr$date,format="%V"))
dfr$month <- factor(strftime(dfr$date,format="%B"),levels=c("janeiro","fevereiro","março","abril","maio","junho","julho","agosto","setembro","outubro","novembro","dezembro"))
dfr$ddate <- factor(strftime(dfr$date,format="%d"))





dfr$Legenda[dfr$date>=Dia_D & dfr$date<=Dia_D+Dia_T-1] <- "Pré-Menstruação" #12dias
dfr$Legenda[dfr$date>=Dia_D-2 & dfr$date<=Dia_D+Dia_M-1-2] <- "Alerta" #2dias
dfr$Legenda[dfr$date>=Dia_D & dfr$date<=Dia_D+Dia_M-1] <- "Menstruação"  #2 dias
dfr$Legenda[dfr$date>=Dia_D+Dia_M & dfr$date<=Dia_D+Dia_M+7] <- "Pós-Menstruação" #9dias
dfr$Legenda[dfr$date>=Dia_D+2 & dfr$date<=Dia_D+Dia_M-1+2] <- "Alerta"#2 dias
dfr$Legenda[dfr$date>=Dia_D+10 & dfr$date<=Dia_D+15] <- "Ovulação" #5dias


dfr$Legenda[dfr$date>=Dia_D+Dia_T & dfr$date<=Dia_D+Dia_T+Dia_T-1] <- "Pré-Menstruação" #12dias
dfr$Legenda[dfr$date>=Dia_D+Dia_T-2 & dfr$date<=Dia_D+Dia_T-1+Dia_M-2] <- "Alerta" #2dias
dfr$Legenda[dfr$date>=Dia_D+Dia_T & dfr$date<=Dia_D+Dia_T-1+Dia_M] <- "Menstruação"  #2 dias
dfr$Legenda[dfr$date>=Dia_D+Dia_T+Dia_M & dfr$date<=Dia_D+Dia_T+Dia_M+7] <- "Pós-Menstruação" #9dias
dfr$Legenda[dfr$date>=Dia_D+Dia_T+2 & dfr$date<=Dia_D+Dia_T-1+Dia_M+2] <- "Alerta"#2 dias
dfr$Legenda[dfr$date>=Dia_D+Dia_T+10 & dfr$date<=Dia_D+Dia_T+15] <- "Ovulação" #5dias


dfr$Legenda[dfr$date>=Dia_D+Dia_T+Dia_T & dfr$date<=Dia_D+Dia_T+Dia_T-1+Dia_T] <- "Pré-Menstruação" #12dias
dfr$Legenda[dfr$date>=Dia_D+Dia_T+Dia_T-2 & dfr$date<=Dia_D+Dia_T-1+Dia_M+Dia_T-2] <- "Alerta" #2dias
dfr$Legenda[dfr$date>=Dia_D+Dia_T+Dia_T & dfr$date<=Dia_D+Dia_T-1+Dia_M+Dia_T] <- "Menstruação"  #2 dias
dfr$Legenda[dfr$date>=Dia_D+Dia_T+Dia_M+Dia_T & dfr$date<=Dia_D+Dia_T+Dia_M+7+Dia_T] <- "Pós-Menstruação" #9dias
dfr$Legenda[dfr$date>=Dia_D+Dia_T+Dia_T+2 & dfr$date<=Dia_D+Dia_T-1+Dia_M+Dia_T+2] <- "Alerta"#2 dias
dfr$Legenda[dfr$date>=Dia_D+Dia_T+Dia_T+10 & dfr$date<=Dia_D+Dia_T+Dia_T+15] <- "Ovulação" #5dias


dfr$Legenda[dfr$date>=Dia_D+(3*Dia_T) & dfr$date<=Dia_D+Dia_T-1+(3*Dia_T)] <- "Pré-Menstruação" #12dias
dfr$Legenda[dfr$date>=Dia_D+(3*Dia_T)-2 & dfr$date<=Dia_D-1+Dia_M+(3*Dia_T)-2] <- "Alerta" #2dias
dfr$Legenda[dfr$date>=Dia_D+(3*Dia_T) & dfr$date<=Dia_D-1+Dia_M+(3*Dia_T)] <- "Menstruação"  #2 dias
dfr$Legenda[dfr$date>=Dia_D+Dia_M+(3*Dia_T) & dfr$date<=Dia_D+Dia_M+7+(3*Dia_T)] <- "Pós-Menstruação" #9dias
dfr$Legenda[dfr$date>=Dia_D+(3*Dia_T)+2 & dfr$date<=Dia_D-1+Dia_M+(3*Dia_T)+2] <- "Alerta"#2 dias
dfr$Legenda[dfr$date>=Dia_D+(3*Dia_T)+10 & dfr$date<=Dia_D+(3*Dia_T)+15] <- "Ovulação" #5dias


dfr$Legenda[dfr$date>=Dia_D+(4*Dia_T) & dfr$date<=Dia_D+Dia_T-1+(4*Dia_T)] <- "Pré-Menstruação" #12dias
dfr$Legenda[dfr$date>=Dia_D+(4*Dia_T)-2 & dfr$date<=Dia_D-1+Dia_M+(4*Dia_T)-2] <- "Alerta" #2dias
dfr$Legenda[dfr$date>=Dia_D+(4*Dia_T) & dfr$date<=Dia_D-1+Dia_M+(4*Dia_T)] <- "Menstruação"  #2 dias
dfr$Legenda[dfr$date>=Dia_D+Dia_M+(4*Dia_T) & dfr$date<=Dia_D+Dia_M+7+(4*Dia_T)] <- "Pós-Menstruação" #9dias
dfr$Legenda[dfr$date>=Dia_D+(4*Dia_T)+2 & dfr$date<=Dia_D-1+Dia_M+(4*Dia_T)+2] <- "Alerta"#2 dias
dfr$Legenda[dfr$date>=Dia_D+(4*Dia_T)+10 & dfr$date<=Dia_D+(4*Dia_T)+15] <- "Ovulação" #5dias


dfr$Legenda[dfr$date>=Dia_D+(5*Dia_T) & dfr$date<=Dia_D+Dia_T-1+(5*Dia_T)] <- "Pré-Menstruação" #12dias
dfr$Legenda[dfr$date>=Dia_D+(5*Dia_T)-2 & dfr$date<=Dia_D-1+Dia_M+(5*Dia_T)-2] <- "Alerta" #2dias
dfr$Legenda[dfr$date>=Dia_D+(5*Dia_T) & dfr$date<=Dia_D-1+Dia_M+(5*Dia_T)] <- "Menstruação"  #2 dias
dfr$Legenda[dfr$date>=Dia_D+Dia_M+(5*Dia_T) & dfr$date<=Dia_D+Dia_M+7+(5*Dia_T)] <- "Pós-Menstruação" #9dias
dfr$Legenda[dfr$date>=Dia_D+(5*Dia_T)+2 & dfr$date<=Dia_D-1+Dia_M+(5*Dia_T)+2] <- "Alerta"#2 dias
dfr$Legenda[dfr$date>=Dia_D+(5*Dia_T)+10 & dfr$date<=Dia_D+(5*Dia_T)+15] <- "Ovulação" #5dias

dfr$Legenda[dfr$date>=Dia_D+(6*Dia_T) & dfr$date<=Dia_D+Dia_T-1+(6*Dia_T)] <- "Pré-Menstruação" #12dias
dfr$Legenda[dfr$date>=Dia_D+(6*Dia_T)-2 & dfr$date<=Dia_D-1+Dia_M+(6*Dia_T)-2] <- "Alerta" #2dias
dfr$Legenda[dfr$date>=Dia_D+(6*Dia_T) & dfr$date<=Dia_D-1+Dia_M+(6*Dia_T)] <- "Menstruação"  #2 dias
dfr$Legenda[dfr$date>=Dia_D+Dia_M+(6*Dia_T) & dfr$date<=Dia_D+Dia_M+7+(6*Dia_T)] <- "Pós-Menstruação" #9dias
dfr$Legenda[dfr$date>=Dia_D+(6*Dia_T)+2 & dfr$date<=Dia_D-1+Dia_M+(6*Dia_T)+2] <- "Alerta"#2 dias
dfr$Legenda[dfr$date>=Dia_D+(6*Dia_T)+10 & dfr$date<=Dia_D+(6*Dia_T)+15] <- "Ovulação" #5dias

dfr$Legenda[dfr$date>=Dia_D+(7*Dia_T) & dfr$date<=Dia_D+Dia_T-1+(7*Dia_T)] <- "Pré-Menstruação" #12dias
dfr$Legenda[dfr$date>=Dia_D+(7*Dia_T)-2 & dfr$date<=Dia_D-1+Dia_M+(7*Dia_T)-2] <- "Alerta" #2dias
dfr$Legenda[dfr$date>=Dia_D+(7*Dia_T) & dfr$date<=Dia_D-1+Dia_M+(7*Dia_T)] <- "Menstruação"  #2 dias
dfr$Legenda[dfr$date>=Dia_D+Dia_M+(7*Dia_T) & dfr$date<=Dia_D+Dia_M+7+(7*Dia_T)] <- "Pós-Menstruação" #9dias
dfr$Legenda[dfr$date>=Dia_D+(7*Dia_T)+2 & dfr$date<=Dia_D-1+Dia_M+(7*Dia_T)+2] <- "Alerta"#2 dias
dfr$Legenda[dfr$date>=Dia_D+(7*Dia_T)+10 & dfr$date<=Dia_D+(7*Dia_T)+15] <- "Ovulação" #5dias

dfr$Legenda[dfr$date>=Dia_D+(8*Dia_T) & dfr$date<=Dia_D+Dia_T-1+(8*Dia_T)] <- "Pré-Menstruação" #12dias
dfr$Legenda[dfr$date>=Dia_D+(8*Dia_T)-2 & dfr$date<=Dia_D-1+Dia_M+(8*Dia_T)-2] <- "Alerta" #2dias
dfr$Legenda[dfr$date>=Dia_D+(8*Dia_T) & dfr$date<=Dia_D-1+Dia_M+(8*Dia_T)] <- "Menstruação"  #2 dias
dfr$Legenda[dfr$date>=Dia_D+Dia_M+(8*Dia_T) & dfr$date<=Dia_D+Dia_M+7+(8*Dia_T)] <- "Pós-Menstruação" #9dias
dfr$Legenda[dfr$date>=Dia_D+(8*Dia_T)+2 & dfr$date<=Dia_D-1+Dia_M+(8*Dia_T)+2] <- "Alerta"#2 dias
dfr$Legenda[dfr$date>=Dia_D+(8*Dia_T)+10 & dfr$date<=Dia_D+(8*Dia_T)+15] <- "Ovulação" #5dias

dfr$Legenda[dfr$date>=Dia_D+(9*Dia_T) & dfr$date<=Dia_D+Dia_T-1+(9*Dia_T)] <- "Pré-Menstruação" #12dias
dfr$Legenda[dfr$date>=Dia_D+(9*Dia_T)-2 & dfr$date<=Dia_D-1+Dia_M+(9*Dia_T)-2] <- "Alerta" #2dias
dfr$Legenda[dfr$date>=Dia_D+(9*Dia_T) & dfr$date<=Dia_D-1+Dia_M+(9*Dia_T)] <- "Menstruação"  #2 dias
dfr$Legenda[dfr$date>=Dia_D+Dia_M+(9*Dia_T) & dfr$date<=Dia_D+Dia_M+7+(9*Dia_T)] <- "Pós-Menstruação" #9dias
dfr$Legenda[dfr$date>=Dia_D+(9*Dia_T)+2 & dfr$date<=Dia_D-1+Dia_M+(9*Dia_T)+2] <- "Alerta"#2 dias
dfr$Legenda[dfr$date>=Dia_D+(9*Dia_T)+10 & dfr$date<=Dia_D+(9*Dia_T)+15] <- "Ovulação" #5dias

dfr$Legenda[dfr$date>=Dia_D+(10*Dia_T) & dfr$date<=Dia_D+Dia_T-1+(10*Dia_T)] <- "Pré-Menstruação" #12dias
dfr$Legenda[dfr$date>=Dia_D+(10*Dia_T)-2 & dfr$date<=Dia_D-1+Dia_M+(10*Dia_T)-2] <- "Alerta" #2dias
dfr$Legenda[dfr$date>=Dia_D+(10*Dia_T) & dfr$date<=Dia_D-1+Dia_M+(10*Dia_T)] <- "Menstruação"  #2 dias
dfr$Legenda[dfr$date>=Dia_D+Dia_M+(10*Dia_T) & dfr$date<=Dia_D+Dia_M+7+(10*Dia_T)] <- "Pós-Menstruação" #9dias
dfr$Legenda[dfr$date>=Dia_D+(10*Dia_T)+2 & dfr$date<=Dia_D-1+Dia_M+(10*Dia_T)+2] <- "Alerta"#2 dias
dfr$Legenda[dfr$date>=Dia_D+(10*Dia_T)+10 & dfr$date<=Dia_D+(10*Dia_T)+15] <- "Ovulação" #5dias

dfr$Legenda[dfr$date>=Dia_D+(11*Dia_T) & dfr$date<=Dia_D+Dia_T-1+(11*Dia_T)] <- "Pré-Menstruação" #12dias
dfr$Legenda[dfr$date>=Dia_D+(11*Dia_T)-2 & dfr$date<=Dia_D-1+Dia_M+(11*Dia_T)-2] <- "Alerta" #2dias
dfr$Legenda[dfr$date>=Dia_D+(11*Dia_T) & dfr$date<=Dia_D-1+Dia_M+(11*Dia_T)] <- "Menstruação"  #2 dias
dfr$Legenda[dfr$date>=Dia_D+Dia_M+(11*Dia_T) & dfr$date<=Dia_D+Dia_M+7+(11*Dia_T)] <- "Pós-Menstruação" #9dias
dfr$Legenda[dfr$date>=Dia_D+(11*Dia_T)+2 & dfr$date<=Dia_D-1+Dia_M+(11*Dia_T)+2] <- "Alerta"#2 dias
dfr$Legenda[dfr$date>=Dia_D+(11*Dia_T)+10 & dfr$date<=Dia_D+(11*Dia_T)+15] <- "Ovulação" #5dias

dfr$Legenda[dfr$date>=Dia_D+(12*Dia_T)-2 & dfr$date<=Dia_D-1+Dia_M+(12*Dia_T)-2] <- "Alerta" #2dias


dfr$Legenda <- factor(dfr$Legenda,levels=c("Menstruação","Alerta","Pós-Menstruação","Ovulação","Pré-Menstruação"))


ggplot(dfr,aes(x=week,y=day))+
  geom_tile(aes(fill=Legenda))+
  geom_text(aes(label=ddate))+
  facet_grid(~month,scales="free",space="free")+
  labs(x="Semana",y="")+
  theme_bw(base_size=10)+ 
  scale_fill_manual(labels=c("Menstruação","Alerta","Pós-Menstruação","Ovulação","Pré-Menstruação"), values=c("#F8766D","#E7861B","#7CAE00","#00BFC4","#C77CFF")) 








