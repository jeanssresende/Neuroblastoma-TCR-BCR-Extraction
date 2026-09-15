# =====================================================================
# 1) Pacotes necessários
# =====================================================================
library(immunarch)
library(dplyr)

# =====================================================================
# 2) Caminho onde estão as pastas das amostras do TRUST4
# =====================================================================
dir_trust4 <- "/media/jean/hd500/Extracao_TCR_BCR_Neuroblastoma/trust4_results"

# =====================================================================
# 3) Criar pasta "cdr3" para receber os arquivos _report.tsv
# =====================================================================
dir_cdr3 <- "/media/jean/hd500/Extracao_TCR_BCR_Neuroblastoma/cdr3"
dir.create(dir_cdr3, showWarnings = FALSE)

# =====================================================================
# 4) Encontrar todos os _report.tsv dentro das subpastas
# =====================================================================

# lista todas as subpastas (cada uma é uma amostra)
pastas_amostras <- list.dirs(dir_trust4, full.names = TRUE, recursive = FALSE)

# função para localizar o arquivo _report.tsv dentro de cada pasta
arquivos_report <- unlist(
  lapply(pastas_amostras, function(pasta) {
    list.files(pasta, pattern = "_report.tsv$", full.names = TRUE)
  })
)

# verificar quantos foram encontrados
print(arquivos_report)

# =====================================================================
# 5) Copiar todos os _report.tsv para a pasta cdr3
# =====================================================================
file.copy(arquivos_report, dir_cdr3, overwrite = TRUE)

# =====================================================================
# 6) Importar os dados com immunarch
# =====================================================================
immdata <- repLoad(dir_cdr3)

save(immdata, file = "/media/jean/hd500/Extracao_TCR_BCR_Neuroblastoma/immdata.RData")
