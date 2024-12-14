set +x 
pipx upgrade tko && clear
echo Exemplos de mensagens:
echo -e "\033[1;32mTudo pronto para mais uma jornada! 😊\033[0m"
echo -e "\033[1;32mProva Turma PDD Quinta-feira \033[0m"
echo -e "\033[1;32mProva Turma PDD Quarta-feira  31/02/2025\033[0m"
echo -e "\033[1;32mBoa teste! \033[0m"
echo -e "\033[1;32mBoa prova! \033[0m"
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