#!/bin/bash

# Atualiza a lista de pacotes disponíveis
apt-get update -y

# Obtém e instala apenas as atualizações de segurança disponíveis
apt-get upgrade -y --only-upgrade $(apt-get upgrade -s |  awk '/^Inst/ { print $2 }' | xargs apt-cache show | awk '/^Description: .*security.*/ { getline; split($0, pkg, ":"); print pkg[2] }' | sort | uniq )
