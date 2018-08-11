xmodmap -e "keycode 166 = Home"
xmodmap -e "keycode 167 = End"
export HISTCONTROL=ignoredups


alias ssh172=''
alias ssh117=''

alias hisg='history | grep '
alias edit-alias='sudo nano ~/.bash_aliases && source ~/.bash_aliases'
alias edit-nginx='sudo nano /etc/nginx/sites-available/default && sudo service nginx restart'

alias pu='pushd .'
alias po='popd'
alias open='sudo gnome-open '
alias rm='sudo trash -rf'





sshuttles(){
  
	if [ "$1" = "172" ]; then 
		sshuttle -r root@172.104.110.189 0/0
	fi

        
	if [ "$1" = "117" ]; then 
		sshuttle -r root@117.6.16.176 0/0
	fi 
}

sshs(){
  
	if [ "$1" = "172" ]; then 
		ssh -t root@172.104.110.189
	fi

        
	if [ "$1" = "117" ]; then 
		ssh -t nbhoa@117.6.16.176 
	fi 
}


syn  () { 
        
	if [ "$1" = "172" ]; then 
		target=$(dirname "$2")
		echo $target
		rsync -avhz "$2" root@172.104.110.189:$target 
	fi

        
	if [ "$1" = "117" ]; then 
		target=$(dirname "$2")
		echo $target
		rsync -avhz "$2" root@117.6.16.176:$target 
	fi


}


backup () { 
    for file in "$@"; do
        local new=${file}_$(date '+%Y-%m-%d_%H-%M-%S')
        while [[ -f $new ]]; do
            new+="~";
        done;
        printf "copying '%s' to '%s'\n" "$file" "$new";
        cp -ipr "$file" "$new";
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

