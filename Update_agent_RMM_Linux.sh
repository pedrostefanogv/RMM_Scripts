#!/bin/bash

# Diretório temporário para baixar o arquivo
temp_dir=$(mktemp -d "$TMPDIR/script.RMMAgent")

# URL do arquivo a ser baixado
url="https://raw.githubusercontent.com/netvolt/LinuxRMM-Script/main/rmmagent-linux.sh"

# Nome do arquivo de destino
filename="$temp_dir/rmmagent-linux.sh"

# Baixa o arquivo para o diretório temporário
wget "$url" -O "$filename"

# Define as permissões de execução para o arquivo
chmod +x "$filename"

# Obtém a arquitetura do sistema
architecture=$(uname -m)

# Executa o arquivo com base na arquitetura do sistema
case $architecture in
    "amd64" | "x86_64")
        "$filename" update amd64
        ;;
    "x86")
        "$filename" update x86
        ;;
    "aarch64" | "arm64")
        "$filename" update arm64
        ;;
    "armv6" | "armv7l")
        "$filename" update armv6
        ;;
    *)
        echo "Arquitetura não suportada."
        ;;
esac

# Remove o arquivo
rm "$filename"

# Remove o diretório temporário
rmdir "$temp_dir"
