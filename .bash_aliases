#!/usr/bin/env bash
xmodmap -e "keycode 166 = Home"
xmodmap -e "keycode 167 = End"
export HISTCONTROL=ignoredups

alias hisg='history | grep '
alias edit-alias='sudo nano ~/.bash_aliases && source ~/.bash_aliases'
alias edit-nginx='sudo nano /etc/nginx/sites-available/default && sudo service nginx restart'

alias pu='pushd . && cd '
alias po='popd'
alias open='sudo gnome-open '
alias rm='sudo trash -rf'


get_server(){
    case   "$1" in
        "172")
        echo "root@172.104.110.189"
        ;;
        "117")
        echo "root@117.6.16.176"
        ;;
        "167")
        echo "root@167.114.98.168"
        ;;
        *)
     esac

}

rsyncs () {
    server=$(get_server "$1")
    target=$(dirname "$2")

    if [[ "${@#-r}" = "$@" ]]
    then
        echo rsync -pavhzR $2 $1:$target
        rsync -pavhzR $2 $server:$target
    else
        echo rsync -pavhzR $1:$2 $target
        rsync -pavhzR $server:$2 $target
    fi
}

sshuttles(){
    server=$(get_server "$1")
    sshuttle -r $server 0/0
}


sshs(){
    server=$(get_server "$1")
    ssh -t $server
}


backup () {
    for file in "$@"; do
        local new=${file}_$(date '+%Y-%m-%d_%H-%M-%S')
        while [[ -f $new ]]; do
            new+="~";
        done;
        printf "copying '%s' to '%s'\n" "$file" "$new";
        cp -ipr "$file" "$new";
	zip -rm "$new".zip "$new";
	du -sh "$new".zip
    done
}

alias dc-stop-all='sudo docker stop $(sudo docker ps -aq)'
alias dc-ps='sudo docker ps'
alias dc-rm-all='sudo docker rm $(sudo docker ps -aq)'
alias dc-rm-exited='sudo docker ps -a | grep Exit | cut -d " " -f 1 | xargs sudo docker rm'
alias dc-rmi-none='sudo docker rmi $(sudo docker images -f "dangling=true" -q)'
alias dc-rmi-all='sudo docker rmi $(sudo docker images -aq)'
alias dc-stats='sudo docker stats'

alias tarc='tar -czvf '
alias tarx='tar -k -xzvf '
alias pip3='sudo python3.6 -m pip '

alias chmodall='sudo chmod -R 777 '

