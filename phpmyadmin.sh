#!/bin/bash
RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')"


banner(){
  clear;
  cat <<- EOF

${GREEN}╔═╗ ╔╗     ╔╗      ${CYAN}╔╗ ╔╗     ╔╗       ${ORANGE}╔═══╗╔╗
${GREEN}║║╚╗║║     ║║      ${CYAN}║║ ║║     ║║       ${ORANGE}║╔═╗╠╝║
${GREEN}║╔╗╚╝╠══╦══╣╚═╗    ${CYAN}║╚═╝╠══╦══╣║╔╦══╦╩╣${ORANGE}  ╔╝╠╗║
${GREEN}║║╚╗║║╔╗║╔╗║╔╗╠${MAGENTA} ══ ${CYAN}╣╔═╗║╔╗║╔═╣╚╝╣║═╣╔╝${ORANGE}  ║╔╝║║
${GREEN}║║ ║║║╚╝║╚╝║╚╝╠${MAGENTA} ══ ${CYAN}╣║ ║║╔╗║╚═╣╔╗╣║═╣║ ${ORANGE}  ║║╔╝╚╗
${GREEN}╚╝ ╚═╩══╩══╩══╝   ${CYAN} ╚╝ ╚╩╝╚╩══╩╝╚╩══╩╝ ${ORANGE}  ╚╝╚══╝



${BLUE}
**************************************************
${GREEN}Remember >>  •••Allah Always Watching You•••
${BLUE}**************************************************
${CYAN} ____We Work To Sarve You a Clean Cyber Space____
${ORANGE}   ____Well Come To Noob-Hacker's World____
${BLUE}**************************************************
{ascii}
${BLUE}**************************************************
${GREEN}Author   >>  Tahsan-Nayem [Noob-Hacker71]
${ORANGE}Facebook >>  https://facebook.com/Noob.Hacker71
${CYAN}Github   >>  https://github.com/Noob-Hacker71
${BLUE}**************************************************




	EOF
}
setPHP_MY_ADMIN(){



sed -i "s/localhost/127.0.0.1/" '/data/data/com.termux/files/usr/share/phpmyadmin/config.inc.php'
touch '/data/data/com.termux/files/usr/bin/start_php'
chmod +x '/data/data/com.termux/files/usr/bin/start_php'
echo -e 'php -S 127.0.0.1:7171 -t /data/data/com.termux/files/usr/share/phpmyadmin/' > '/data/data/com.termux/files/usr/bin/start_php'
echo -e "${BLUE}[ ${GREEN}! ${BLUE}] ${GREEN}TYPE ${BLUE}start_php ${GREEN}TO RUN PHP_MY_ADMIN !\n${BLUE}[ ${GREEN}! ${BLUE}]${GREEN} YOUR PHP_MY_ADMIN WEB ADDRESS : ${BLUE}http://127.0.0.1:7171"
}
mysqlpass(){
 
  if [[ `command -v php` ]] ; then 
  echo -e "  
  ${BLUE}[ ${GREEN}! ${BLUE}]${ORANGE} SET UP YOUR PHP_MY_ADMIN PASSWORD !"
    read -p "
  ${BLUE}[ ${GREEN}! ${BLUE}]${CYAN} Enter Your PHP_MY_ADMIN Password :${ORANGE} " pass1
    
    
    if [[ $pass1 != '' ]]; then
      
      mysql -e "set password for 'root'@'localhost'=password('${pass1}')"
      
      echo -e "\n${BLUE}  YOUR USERNAME : ${GREEN}root\n    \"${BLUE} PASSWORD : ${GREEN}${pass1}"
     
    else
      mysqlpass
    fi
    #mysql -e "set password for 'root'@'localhost'=password('root')"
  fi
}
chkphpexist() {
  if [[ `pidof php` ]]; then
		killall php > /dev/null 2>&1
	fi
 
}
dependencies() {
  banner
	echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} CHECKING DEPENDENCIES ..."

	if [[ `command -v php` && `command -v mariadb` && -d '/data/data/com.termux/files/usr/share/phpmyadmin' ]]; then
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} ALL PACKAGES INSTALLED !."
	else
		if [[ `command -v php` ]] ; then
		  echo 'php ALREADY INSTALLED !'
		else
		  pkg install php -y 
		  fi
			
		if [[ -d '/data/data/com.termux/files/usr/share/phpmyadmin' ]] ; then
		  echo 'PHP_MY_ADMIN ALREADY INSTALLED !'
		else
		  pkg install phpmyadmin -y 
		  fi
		if [[ `command -v mariadb` ]] ; then
		  echo 'mariadb ALREADY INSTALLED !'
		else
		  pkg install mariadb -y 
		
		fi  
	fi
	main

}
main(){
  if [[ `pidof php` ]]; then
		chkphpexist
	fi
	if [[  `command -v php` && `command -v mariadb` && -d '/data/data/com.termux/files/usr/share/phpmyadmin' ]]; then
	  banner
		setPHP_MY_ADMIN
		mysqlpass
	else
	 dependencies
	fi	
	
}
#setPHP_MY_ADMIN
main


