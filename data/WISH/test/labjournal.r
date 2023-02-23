tped <- fread('/home/bananna/Desktop/SNPproject/WISHtest/test.tped', data.table = F)
ped <- fread('/home/bananna/Desktop/SNPproject/WISHtest/test.ped', data.table = F)
phenotype <- fread('/home/bananna/Desktop/SNPproject/WISHtest/test_pheno.txt')

genotype <- generate.genotype(ped, tped)
epistatic.correlation(phenotype[, 2], genotype,threads = 1 ,test=T)

#Running Test
#Estimating run time based on ~100.000 models
#The estimated run time for the simple model is 0.11 hours
#The estimated run time for the full model is 0.23 hours

correlations <- epistatic.correlation(phenotype[, 2], genotype,threads = 2 ,test=F)
genome.interaction(tped, correlations)  # wtf

#MYDATA
my_pheno <- read_delim("/home/bananna/Desktop/SNPproject/soybean_simple_phenotypes.tsv", delim='\t')
my_pheno <- my_pheno[, c(2,10)]
my_ped <- fread('/home/bananna/Desktop/SNPproject/plink.ped', data.table = F)
my_tped <- fread('/home/bananna/Desktop/SNPproject/plink.tped', data.table = F)

epistatic.correlation(my_pheno[, 2], genotype,threads = 1 ,test=T)
#Running Test
#Estimating run time based on ~100.000 models
#The estimated run time for the simple model is 42.18 hours
#The estimated run time for the full model is 84.88 hours
epistatic.correlation(my_pheno[, 2], genotype,threads = 4 ,test=T)
#Running Test
#Estimating run time based on ~100.000 models
#The estimated run time for the simple model is 15.56 hours
#The estimated run time for the full model is 29.67 hours