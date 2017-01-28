# Determines which background is used in terminal
__is_light_background() {
    local x fg bg

    stty -echo
        echo -ne '\e]10;?\a\e]11;?\a'
        IFS=: read -t 0.1 -d $'\a' x fg
        IFS=: read -t 0.1 -d $'\a' x bg
    stty echo

    [[ ${fg:0:1} =~ [01234567] ]]
}
