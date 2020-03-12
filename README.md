## TRABALHO FINAL DISCIPLINA DE "PROJETOS DE ANÁLISE DE DADOS EM R" ##
## Autora: AMANDA NARCIZO ##
## Objetivo: Comparar a abundância de regenerantes de tamanho menor do que 30 cm sujeitos a diferentes tratamentos. Sendo eles, sob a copa de: jamelão (Syzygium cumini), espécies nativas e hibisco da praia (Talipariti tiliaceum). 
## Resultados esperados: É esperado que haja diferença significativa entre a abundância de regenerantes abaixo da copa de espécies nativas e a abundância de regenerantes abaixo da copa das espécies exóticas (jamelão e hibisco da praia).

Passos do script:
1. Criando a tabela em formato csv. com a coluna tratamentos e a columa contagem de regenerantes; 
2. Criamos objeto listando os arquivos que tem na pasta data; 
3. Agora temos os enderecos de cada arquivo csv e podemos criar o objeto mais tranquilamente; 
4. Para entender melhor o objeto/planilha vamos usar as funcoes head, dim e summary para inspecionar a planilha;
5. Fazendo sumario dos dados --> inspecionando quantas parcelas/observacoes temos
6. Criando vetor de cores e também modificando algumas caracteristicas para plotar os graficos; 
7. Usando a função boxplot para plotar a abundancia de regenerantes em funcao dos diferentes tratamentos; 
8. Exportando figura em formato png. para a pasta Figs do projeto
9. Para poder comparar se ha diferenca significante entre a abundancia de regenerantes nos diferentes tratamentos e necessario checar primeiramente a normalidade dos dados e para isso sao criados objetos para cada tratamento;
10. Feitos os testes de normalidades, conclui-se que os tratamentos nao correspondem a premissa em sua totalidade;
11. Assim, usamos o teste Kruskal-Wallis para comparar e nota-se que o valor de p é significativo (p < 0.05);
12. A partir daí, faz-se também o teste a posteriori - Dunn.test - para distrinchar entre quais tratamentos há diferença;
