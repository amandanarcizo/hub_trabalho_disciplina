#### TRABALHO DISCIPLINA DE PROJETOS DE ANÁLISE EM R ####
### Amanda Narcizo  -  18.02.2020 ###
## Inserindo Tabelas ##
## Carregando pacotes:
library(dunn.test)
library(pgirmess)

# criamos objeto listando os arquivos que tem na pasta
files.path <- list.files(path = "data",
                         pattern = ".csv",
                         full.names = TRUE)

files.path

# agora temos os endereços de cada arquivo csv e podemos criar o objeto mais tranquilamente
regeneracao <- read.csv2(files.path)

# para entender melhor o objeto/planilha vamos usar as funções head, dim e summary para inspecionar o arquivo
head(regeneracao)
dim(regeneracao)
summary(regeneracao)

## fazendo sumário dos dados
# quantas parcelas temos no total?
nrow(regeneracao)

# criando vetor de cores e modificando alguns caracteristicas do plot do gráfico
cores <- c("#3B9AB2", "#EBCC2A", "#F21A00")

par(mfrow = c(1,1),
    bty = 'l',
    las = 1)

# plotando a quantidade de regenerantes em função dos diferentes tratamentos
boxplot(Contg_reg ~ Tratamento,
        data = regeneracao,
        xlab = "",
        ylab = "Abundancia de regenerantes",
        col = cores,
        las = 1)


# exportando figura
png("Figs/figura01.png", res = 300, width = 2400, height = 1200)
par(mfrow = c(1,1),
    bty = 'l',
    las = 1)
boxplot(Contg_reg ~ Tratamento,
        data = regeneracao,
        xlab = "",
        ylab = "Abundancia de regenerantes",
        col = cores,
        las = 1)
dev.off()

# criando objetos com o numero de regenerantes para cada tratamento
jamelao <- c(regeneracao$Contg_reg[1:15])
nativa <- c(regeneracao$Contg_reg[15:25])
hibisco <- c(regeneracao$Contg_reg[26:40])

# testando a normalidade dos dados (se for menor que 0.05 não é normal)
shapiro.test(jamelao)
shapiro.test(nativa)
shapiro.test(hibisco)

# testando Kruskal-Wallis (teste utilizado para a comparação de duas ou mais amostras independentes), ja que a premissa de normalidade dos dados não foi atendida

ab_reg <- c(regeneracao$Contg_reg)
trat <- factor(rep(1:3,c(15,10, 15)),labels = c("Jamelao", "Nativas", "Hibisco"))

kruskal.test(ab_reg,trat)
# o p-valor foi menor que 0.05, dessa forma ha diferenca significativa entre os tratamentos, para saber melhor entre quais é necessário o teste a posteriori:

dunn.test(ab_reg, trat, method ="bonferroni")


