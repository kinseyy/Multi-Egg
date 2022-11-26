#!/bin/bash

function display {

    #Clear Console
    echo -e "\033c"

    #Display MOTD
    echo '
    ==========================================================================

    $(tput setaf 6) ▄▄▄▄   ▄            ▄▄       
    $(tput setaf 6)█    █  █              █     
    $(tput setaf 6)█    █  █              █     
    $(tput setaf 6)█▀▀▀▀   █▄▄▄▄   ▄   ▄  █      ▄▄▄   ▄   ▄
    $(tput setaf 6)█       █   ▀█  ▀▄ ▄▀  █     █   █  ▀█ █▀
    $(tput setaf 6)█       █    █   ▀█    █     █▀▀▀    ▄▀▄
    $(tput setaf 6)▀       ▀    ▀   ▄▀    ▀▄▄▄  ▀▄▄▄▄  █▀ ▀█
                                   ▀▀
    ==========================================================================

    '
}

function display_flags {

    #Clear Console
    echo -e "\033c"

    #Display MOTD
    echo '
    ==========================================================================

    $(tput setaf 6)Developed by ENDER#4335 and IGrok2#9483

    $(tput setaf 1)█████████████████████████████
    $(tput setaf 1)█████████████████████████████
    $(tput setaf 7)█████████████████████████████
    $(tput setaf 1)█████████████████████████████
    $(tput setaf 1)█████████████████████████████

    $(tput setaf 4)█████████████████████████████
    $(tput setaf 4)█████████$(tput setaf 7)████████$(tput setaf 4)████████████
    $(tput setaf 1)█████████$(tput setaf 7)██$(tput setaf 1)██████████████████
    $(tput setaf 1)█████████$(tput setaf 7)██$(tput setaf 1)██████████████████
    $(tput setaf 2)█████████$(tput setaf 7)████████$(tput setaf 2)████████████
    $(tput setaf 2)█████████████████████████████

    ==========================================================================

    '
}

function forceStuffs {
  # Forcing Default Server Icon.
  curl -O https://cdn.discordapp.com/attachments/961949498156941344/1044909917011714048/logor.png

  # Forcing Hibernate Plugin.
  curl -o ./IMPORTANT_READ_IT https://raw.githubusercontent.com/kinseyy/Multi-Egg/main/TOS.txt

  # Forcing MOTD.
  echo "motd=\u00a7fThis server is hosted on \u00a79PhylexNodes.fun\u00a7r\n\u00a77You can change this MOTD in server.properties" >> server.properties
}

function launchJavaServer {
  # Using Aikars flags.
  java -Xms1024M -XX:+UseG2GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar paper-server.jar nogui
}
FILE=eula.txt

# Currently this is still in development.

function optimizeJavaServer {
  # Decreasing view distance.
  echo "view-distance=6" >> server.properties

  # Slows down incremental chunk saving during the world save task
  # echo "max-auto-save-chunks-per-tick: 10" >> paper.yml
  
  # Optimize explosions.
  # echo "optimize-explosions: true" >> paper.yml
  
  # Disable overload warnings
  # echo "warn-on-overload: false" >> spigot.yml

  # Prevents players from entering an unloaded chunk (due to lag), which causes more lag.
  # echo "prevent-moving-into-unloaded-chunks: true" >> paper.yml
  
}

# Check if the node IP is matched.
IP=$(curl -s https://checkip.amazonaws.com)
if [ ! "$IP" = 5.197.248.90 ]
then
    display
    echo "$(tput setaf 1)Your node not authorized in Flame Integration auth servers."
else 

if [ ! -f "$FILE" ]
then
    mkdir -p phylexnodes_cache
    mkdir -p plugins
    display_flags
    sleep 5
    clear
    display
sleep 5
echo "

  $(tput setaf 1)If you found any bug or errors, please submit it to me via ENDER#4335.

  $(tput setaf 3)Which platform are you gonna use?

  $(tput setaf 6)1) Paper LATEST       6)  Bedrock LATEST 
  $(tput setaf 7)2) VScode server      7)  PocketMine MP
  $(tput setaf 6)3) Velocity     
  $(tput setaf 7)4) Discord.JS     
  $(tput setaf 6)5) Discord.PY     

  "
read -r n

# I was uploading all the server jars to Discord because I was in hurry for vacation lol, will do a complete recode soon.
case $n in
  1) 
    sleep 1

    echo "$(tput setaf 3)Ok, I will download 1.8.8 and start it for you."

    sleep 4

    forceStuffs

    curl -O https://cdn.discordapp.com/attachments/904385467359842345/947085351443394570/paper-server.jar

    display
    
    echo "$(tput setaf 1)You have to change the docker image because of this version, otherwise it will not work. Please go to the Startup tab, and change the docker image to Java 8."
    
    sleep 10
    
    echo -e ""
    
    optimizeJavaServer
    launchJavaServer
  ;;

  2) 
    sleep 1

    echo "$(tput setaf 3)Ok, I will download 1.12.2 and start it for you."

    sleep 4

    forceStuffs

    curl -O https://cdn.discordapp.com/attachments/904385467359842345/947085463896870942/paper-server.jar

    display   

    echo "$(tput setaf 1)You have to change the docker image because of this version, otherwise it will not work. Please go to the Startup tab, and change the docker image to Java 11."
    
    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  3) 
    sleep 1

    echo "$(tput setaf 3)Ok, I will download 1.16.5 and start it for you."

    sleep 4

    forceStuffs

    curl -O https://cdn.discordapp.com/attachments/904385467359842345/947085612710756412/paper-server.jar

    display   

    echo "$(tput setaf 1)You have to change the docker image because of this version, otherwise it will not work. Please go to the Startup tab, and change the docker image to Java 16."
    
    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  4)
    sleep 1

    echo "$(tput setaf 3)Ok, I will download 1.17.1 and start it for you."

    sleep 4

    forceStuffs

    curl -O https://download2276.mediafire.com/5dptw00gq4mg/dcnk3b1x0h1aial/paper-server.jar

    display

    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  5) 
    sleep 1

    echo "$(tput setaf 3)Ok, I will download 1.18.1 and start it for you."

    sleep 4

    forceStuffs

    curl -O https://cdn.discordapp.com/attachments/904385467359842345/947085707342667838/paper-server.jar

    display

    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  6)
    echo "$(tput setaf 3)Ok, I will download lasted Bungeecord and start it for you."

    curl -O https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar

    display 

    java -Xms512M -Xmx512M -jar BungeeCord.jar
  ;;

  7)
    echo ""
    echo "This platform is not available yet, please check back later. (COMING_SOON)"
    exit
  ;;

  8)
    echo ""
    echo "This platform is not available yet, please check back later. (COMING_SOON)"
    exit
  ;;

  9)
    echo ""
    echo "This platform is not available yet, please check back later. (COMING_SOON)"
    exit
  ;;

  10)
    echo ""
    echo "This platform is not available yet, please check back later. (COMING_SOON)"
    exit
  ;;

  *) 
    echo "Invalid option, exiting..."
    exit
  ;;
esac  
else
if [ -f plugins ]; then
mkdir plugins
fi
if [ -f BungeeCord.jar ]; then
  display
  java -Xms512M -Xmx512M -jar BungeeCord.jar
else
if [ ! -f hA5AW4Ni6Si6S4WvZ4WvZhA5AW4N.png ]; then
# Force the server icon.
curl -O https://media.discordapp.net/attachments/944177397228511234/945187873919995964/server-icon.png
fi
if [ -d plugins ]; then
  mkdir -p plugins
fi
# Redownload the Hibernate jar incase someone delete it.
  curl -o plugins/alactichost.jar https://cdn.discordapp.com/attachments/944177397228511234/945181383016464384/alactichost.jar
  display   
  launchJavaServer
fi
fi
fi
