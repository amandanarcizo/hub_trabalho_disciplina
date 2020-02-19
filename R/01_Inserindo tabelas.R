#### TRABALHO DISCIPLINA DE PROJETOS DE ANÁLISE EM R ####
### Amanda Narcizo  -  18.02.2020 ###
## Inserindo Tabelas ##

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

# criando vetor de cores
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
        las=1)


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
        las=1)
dev.off()
