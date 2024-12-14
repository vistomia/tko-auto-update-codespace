set +x 
pipx upgrade tko && clear
printf "$(cat .devcontainer/welcome.txt)\n"
tko -v
echo ""
echo ""
read -p "Pressione Enter para continuar..." # espera úsuario apertar Enter

if [ -d poo ]; then
    tko play poo
else
    echo s | tko init --remote poo # confirma a instalação do diretorio ./poo
    echo ts | tko play poo         # configura a versão para ts e abre
fi