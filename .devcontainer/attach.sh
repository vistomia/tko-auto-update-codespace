
set +x 
pipx upgrade tko && clear
printf "$(cat .devcontainer/welcome.txt)\n"
tko -v
echo ""
echo ""
read -p "Pressione Enter para continuar..." # espera úsuario apertar Enter

# Caso queira deixar um repositório padrão
default_repo=""

if [ "$default_repo" != "" ]; then
    if [ -d $default_repo ]; then
        tko play "$default_repo"
    else
        echo s | tko init --remote "$repo"
        clear
        tko play "$repo"
    fi
elif [ -d ed ]; then
    tko play ed
elif [ -d poo ]; then
    tko play poo
elif [ -d fup ]; then
    tko play fup
else
    clear
    while true; do
        echo "Escolha o repositório para criar: poo, fup ou ed."
        echo ""
        read -p "Digite o nome do repositório: " repo

        if [[ "$repo" == "poo" || "$repo" == "fup" || "$repo" == "ed" ]]; then
            echo s | tko init --remote "$repo"
            clear
            tko play "$repo"
            break
        else
            echo "Opção inválida. Escolha apenas entre 'poo', 'fup' ou 'ed'."
        fi
    done
fi