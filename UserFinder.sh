#!/bin/sh
#!/bin/bash
#!/usr/bin/sh
#!/usr/bin/bash
#!/usr/bin/env sh
#!/usr/bin/env bash
#!/data/data/com.termux/files/usr/bin/sh
#!/data/data/com.termux/files/usr/bin/bash
###########################################################################
# SRC : https://github.com/mishakorzik/UserFinder/blob/main/UserFinder.sh #
###########################################################################

trap 'printf "\n";partial;exit 1' 2


banner() {

printf "${BWhite} __   __  ______  _______  ______      _______  ___  __    _  ______   _______  ______ ${resetT}\n"
printf "${BWhite}|  | |  ||      ||       ||    _ |    |       ||   ||  |  | ||      | |       ||    _ |${resetT}\n"
printf "${BWhite}|  | |  ||  ____||    ___||   | ||    |    ___||   ||   |_| ||  _    ||    ___||   | ||${resetT}\n"
printf "${BWhite}|  |_|  || |____ |   |___ |   |_||_   |   |___ |   ||       || | |   ||   |___ |   |_||_ ${resetT}\n"
printf "${BWhite}|       ||____  ||    ___||    __  |  |    ___||   ||  _    || |_|   ||    ___||    __  |${resetT}\n"
printf "${BWhite}|       | ____| ||   |___ |   |  | |  |   |    |   || | |   ||       ||   |___ |   |  | |${resetT}\n"
printf "${BWhite}|_______||______||_______||___|  |_|  |___|    |___||_|  |__||______| |_______||___|  |_|${resetT}\n"
printf "\n"
printf "${BYellow}             .:.:;..${resetT}${BWhite} UserFinder v1.0 Developer: misha korzhik ${resetT}${BYellow}..;:.:.${resetT}\n"
printf "\n"


}

partial() {

if [[ -e $targetNAME.txt ]]; then
printf "${BGreen}[${resetT}${BWhite}^^${resetT}${BGreen}] Saved:${resetT}${BWhite} %s.txt\n" $targetNAME
fi


}


BRed='\033[1;31m'    # Red
BGreen='\033[1;32m'  # Green
BYellow='\033[1;33m' # Yellow
BWhite='\033[1;37m'  # White

resetV="${resetT}"
whiteC="${BWhite}"
greenC="${BGreen}"
resetT="\033[m"

scanner() {

echo "${BGreen}[${resetT}${BWhite}>${resetT}${BGreen}] Input Username:${resetT} "
read -p "$InputUser" targetNAME

if [[ -e $targetNAME.txt ]]; then
printf "${BGreen}[${resetT}${BWhite}X${resetT}${BGreen}] Removing previous file:${resetT}${BWhite} %s.txt" $targetNAME
rm -rf $targetNAME.txt
fi
printf "\n"
printf "${BGreen}[${resetT}${BWhite}>${resetT}${BGreen}] Checking username${resetT}${BWhite} %s${resetT}${BGreen} on: ${resetT}\n" $targetNAME

## INSTAGRAM

check_insta=$(curl -s -H "Accept-Language: en" "https://www.instagram.com/$targetNAME" -L | grep -o 'The link you followed may be broken'; echo $?)
printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Instagram: ${resetT}"

if [[ $check_insta == *'1'* ]]; then
printf "${BGreen} Found!${resetT} https://www.instagram.com/%s\n" $targetNAME
printf "https://www.instagram.com/%s\n" $targetNAME > $targetNAME.txt
elif [[ $check_insta == *'0'* ]]; then
printf "${BYellow}Not Found!${resetT}\n"
fi

## Facebook

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Facebook: ${resetT}"
check_face=$(curl -s "https://www.facebook.com/$targetNAME" -L -H "Accept-Language: en" | grep -o 'not found'; echo $?)


if [[ $check_face == *'1'* ]]; then
printf "${BGreen} Found!${resetT} https://www.facebook.com/%s\n" $targetNAME
printf "https://www.facebook.com/%s\n" $targetNAME >> $targetNAME.txt
elif [[ $check_face == *'0'* ]]; then
printf "${BYellow}Not Found!${resetT}\n"
fi

## TWITTER

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Twitter: ${resetT}"
check_twitter=$(curl -s "https://www.twitter.com/$targetNAME" -L -H "Accept-Language: en" | grep -o 'page doesn’t exist'; echo $?)


if [[ $check_twitter == *'1'* ]]; then
printf "${BGreen} Found!${resetT} https://www.twitter.com/%s\n" $targetNAME
printf "https://www.twitter.com/%s\n" $targetNAME >> $targetNAME.txt
elif [[ $check_twitter == *'0'* ]]; then
printf "${BYellow}Not Found!${resetT}\n"
fi

## YOUTUBE

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] YouTube: ${resetT}"
check_youtube=$(curl -s "https://www.youtube.com/$targetNAME" -L -H "Accept-Language: en" | grep -o 'Not Found'; echo $?)


if [[ $check_youtube == *'1'* ]]; then
printf "${BGreen} Found!${resetT} https://www.youtube.com/%s\n" $targetNAME
printf "https://www.youtube.com/%s\n" $targetNAME >> $targetNAME.txt
elif [[ $check_youtube == *'0'* ]]; then
printf "${BYellow}Not Found!${resetT}\n"
fi

## BLOGGER

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Blogger: ${resetT}"
check=$(curl -s "https://$targetNAME.blogspot.com" -L -H "Accept-Language: en" -i | grep -o 'HTTP/2 404'; echo $?)


if [[ $check == *'1'* ]]; then
printf "${BGreen} Found!${resetT} https://%s.blogspot.com\n" $targetNAME
printf "https://%s.blogspot.com\n" $targetNAME >> $targetNAME.txt
elif [[ $check == *'0'* ]]; then
printf "${BYellow}Not Found!${resetT}\n"
fi

## GLOOGLE PLUS

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] GooglePlus: ${resetT}"
check=$(curl -s "https://plus.google.com/+$targetNAME/posts" -L -H "Accept-Language: en" -i | grep -o 'HTTP/2 404' ; echo $?)


if [[ $check == *'1'* ]]; then
printf "${BGreen} Found!${resetT} https://plus.google.com/+%s/posts\n" $targetNAME
printf "https://plus.google.com/+%s/posts\n" $targetNAME >> $targetNAME
elif [[ $check == *'0'* ]]; then
printf "${BYellow}Not Found!${resetT}\n"
fi

## REDDIT

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Reddit: ${resetT}"
check1=$(curl -s -i "https://www.reddit.com/user/$targetNAME" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | head -n1 | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://www.reddit.com/user/%s\n" $targetNAME
printf "https://www.reddit.com/user/%s\n" $targetNAME >> $targetNAME.txt
fi

## WORDPRESS

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Wordpress: ${resetT}"
check1=$(curl -s -i "https://$targetNAME.wordpress.com" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'Do you want to register' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://%s.wordpress.com\n" $targetNAME
printf "https://%s.wordpress.com\n" $targetNAME >> $targetNAME.txt
fi

## PINTEREST

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Pinterest: ${resetT}"
check1=$(curl -s -i "https://www.pinterest.com/$targetNAME" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '?show_error' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://www.pinterest.com/%s\n" $targetNAME
printf "https://www.pinterest.com/%s\n" $targetNAME >> $targetNAME.txt
fi

## GITHUB

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Github: ${resetT}"
check1=$(curl -s -i "https://www.github.com/$targetNAME" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://www.github.com/%s\n" $targetNAME
printf "https://www.github.com/%s\n" $targetNAME >> $targetNAME.txt
fi

## TUMBLR

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Tumblr: ${resetT}"
check1=$(curl -s -i "https://$targetNAME.tumblr.com" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://%s.tumblr.com\n" $targetNAME
printf "https://%s.tumblr.com\n" $targetNAME >> $targetNAME.txt
fi

## FLICKR

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Flickr: ${resetT}"
check1=$(curl -s -i "https://www.flickr.com/people/$targetNAME" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://www.flickr.com/photos/%s\n" $targetNAME
printf "https://www.flickr.com/photos/%s\n" $targetNAME >> $targetNAME.txt
fi

## STEAM

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Steam: ${resetT}"
check1=$(curl -s -i "https://steamcommunity.com/id/$targetNAME" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'The specified profile could not be found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://steamcommunity.com/id/%s\n" $targetNAME
printf "https://steamcommunity.com/id/%s\n" $targetNAME >> $targetNAME.txt
fi

## VIMEO

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Vimeo: ${resetT}"
check1=$(curl -s -i "https://vimeo.com/$targetNAME" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://vimeo.com/%s\n" $targetNAME
printf "https://vimeo.com/%s\n" $targetNAME >> $targetNAME.txt
fi


## SoundCloud

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] SoundCloud: ${resetT}"
check1=$(curl -s -i "https://soundcloud.com/$targetNAME" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 Not Found'; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://soundcloud.com/%s\n" $targetNAME
printf "https://soundcloud.com/%s\n" $targetNAME >> $targetNAME.txt
fi

## DISQUS

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Disqus: ${resetT}"
check1=$(curl -s -i "https://disqus.com/$targetNAME" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 NOT FOUND' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://disqus.com/%s\n" $targetNAME
printf "https://disqus.com/%s\n" $targetNAME >> $targetNAME.txt
fi

## MEDIUM

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Medium: ${resetT}"
check1=$(curl -s -i "https://medium.com/@$targetNAME" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://medium.com/@%s\n" $targetNAME
printf "https://medium.com/@%s\n" $targetNAME >> $targetNAME.txt
fi

## DEVIANTART

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] DeviantART: ${resetT}"
check1=$(curl -s -i "https://$targetNAME.deviantart.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://%s.deviantart.com\n" $targetNAME
printf "https://%s.deviantart.com\n" $targetNAME >> $targetNAME.txt
fi

## VK

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] VK: ${resetT}"
check1=$(curl -s -i "https://vk.com/$targetNAME" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://vk.com/%s\n" $targetNAME
printf "https://vk.com/%s\n" $targetNAME >> $targetNAME.txt
fi

## About.me

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] About.me: ${resetT}"
check1=$(curl -s -i "https://about.me/$targetNAME" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://about.me/%s\n" $targetNAME
printf "https://about.me/%s\n" $targetNAME >> $targetNAME.txt
fi

## Spotify

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Spotify: ${resetT}"
check1=$(curl -s -i "https://open.spotify.com/user/$targetNAME" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://open.spotify.com/user/%s\n" $targetNAME
printf "https://open.spotify.com/user/%s\n" $targetNAME >> $targetNAME.txt
fi

## MixCloud

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] MixCloud: ${resetT}"
check1=$(curl -s -i "https://www.mixcloud.com/$targetNAME" -H "Accept-Language: en" -L | grep -o 'error-message' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://www.mixcloud.com/%s\n" $targetNAME
printf "https://www.mixcloud.com/%s\n" $targetNAME >> $targetNAME.txt
fi

## Scribd

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Scribd: ${resetT}"
check1=$(curl -s -i "https://www.scribd.com/$targetNAME" -H "Accept-Language: en" -L | grep -o 'show_404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://www.scribd.com/%s\n" $targetNAME
printf "https://www.scribd.com/%s\n" $targetNAME >> $targetNAME.txt
fi

## Badoo

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Badoo: ${resetT}"
check1=$(curl -s -i "https://www.badoo.com/en/$targetNAME" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://www.badoo.com/en/%s\n" $targetNAME
printf "https://www.badoo.com/en/%s\n" $targetNAME >> $targetNAME.txt
fi

# Patreon

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Patreon: ${resetT}"
check1=$(curl -s -i "https://www.patreon.com/$targetNAME" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://www.patreon.com/%s\n" $targetNAME
printf "https://www.patreon.com/%s\n" $targetNAME >> $targetNAME.txt
fi

## BitBucket

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] BitBucket: ${resetT}"
check1=$(curl -s -i "https://bitbucket.org/$targetNAME" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://bitbucket.org/%s\n" $targetNAME
printf "https://bitbucket.org/%s\n" $targetNAME >> $targetNAME.txt
fi

## CashMe

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] CashMe: ${resetT}"
check1=$(curl -s -i "https://cash.me/$targetNAME" -H "Accept-Language: en" -L | grep -o '404 Not Found'; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://cash.me/%s\n" $targetNAME
printf "https://cash.me/%s\n" $targetNAME >> $targetNAME.txt
fi

## Behance

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Behance: ${resetT}"
check1=$(curl -s -i "https://www.behance.net/$targetNAME" -H "Accept-Language: en" -L | grep -o '404 Not Found'; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://www.behance.net/%s\n" $targetNAME
printf "https://www.behance.net/%s\n" $targetNAME >> $targetNAME.txt
fi

## GoodReads

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] GoodReads: ${resetT}"
check1=$(curl -s -i "https://www.goodreads.com/$targetNAME" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://www.goodreads.com/%s\n" $targetNAME
printf "https://www.goodreads.com/%s\n" $targetNAME >> $targetNAME.txt
fi

## Instructables

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Instructables: ${resetT}"
check1=$(curl -s -i "https://www.instructables.com/member/$targetNAME" -H "Accept-Language: en" -L | grep -o '404 NOT FOUND' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://www.instructables.com/member/%s\n" $targetNAME
printf "https://www.instructables.com/member/%s\n" $targetNAME >> $targetNAME.txt
fi

## KeyBase

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Keybase: ${resetT}"
check1=$(curl -s -i "https://keybase.io/$targetNAME" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://keybase.io/%s\n" $targetNAME
printf "https://keybase.io/%s\n" $targetNAME >> $targetNAME.txt
fi

## Kongregate

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Kongregate: ${resetT}"
check1=$(curl -s -i "https://kongregate.com/accounts/$targetNAME" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://kongregate.com/accounts/%s\n" $targetNAME
printf "https://kongregate.com/accounts/%s\n" $targetNAME >> $targetNAME.txt
fi

## Livejournal

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] LiveJournal: ${resetT}"
check1=$(curl -s -i "https://$targetNAME.livejournal.com" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://%s.livejournal.com\n" $targetNAME
printf "https://%s.livejournal.com\n" $targetNAME >> $targetNAME.txt
fi

## AngelList

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] AngelList: ${resetT}"
check1=$(curl -s -i "https://angel.co/$targetNAME" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://angel.co/%s\n" $targetNAME
printf "https://angel.co/%s\n" $targetNAME >> $targetNAME.txt
fi

## Last.fm

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] last.fm: ${resetT}"
check1=$(curl -s -i "https://last.fm/user/$targetNAME" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://last.fm/user/%s\n" $targetNAME
printf "https://last.fm/user/%s\n" $targetNAME >> $targetNAME.txt
fi

## Dribbble

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Dribbble: ${resetT}"
check1=$(curl -s -i "https://dribbble.com/$targetNAME" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://dribbble.com/%s\n" $targetNAME
printf "https://dribbble.com/%s\n" $targetNAME >> $targetNAME.txt
fi

## Codecademy

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Codecademy: ${resetT}"
check1=$(curl -s -i "https://www.codecademy.com/$targetNAME" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://www.codecademy.com/%s\n" $targetNAME
printf "https://www.codecademy.com/%s\n" $targetNAME >> $targetNAME.txt
fi

## Gravatar

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Gravatar: ${resetT}"
check1=$(curl -s -i "https://en.gravatar.com/$targetNAME" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://en.gravatar.com/%s\n" $targetNAME
printf "https://en.gravatar.com/%s\n" $targetNAME >> $targetNAME.txt
fi

## Pastebin

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Pastebin: ${resetT}"
check1=$(curl -s -i "https://pastebin.com/u/$targetNAME" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'location: /index' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://pastebin.com/u/%s\n" $targetNAME
printf "https://pastebin.com/u/%s\n" $targetNAME >> $targetNAME.txt
fi

## Foursquare

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Foursquare: ${resetT}"
check1=$(curl -s -i "https://foursquare.com/$targetNAME" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://foursquare.com/%s\n" $targetNAME
printf "https://foursquare.com/%s\n" $targetNAME >> $targetNAME.txt
fi

## Roblox

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Roblox: ${resetT}"
check1=$(curl -s -i "https://www.roblox.com/user.aspx?username=$targetNAME" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://foursquare.com/%s\n" $targetNAME
printf "https://foursquare.com/%s\n" $targetNAME >> $targetNAME.txt
fi

## Gumroad

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Gumroad: ${resetT}"
check1=$(curl -s -i "https://www.gumroad.com/$targetNAME" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://www.gumroad.com/%s\n" $targetNAME
printf "https://www.gumroad.com/%s\n" $targetNAME >> $targetNAME.txt
fi

## Newgrounds

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Newgrounds: ${resetT}"
check1=$(curl -s -i "https://$targetNAME.newgrounds.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404 ' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://%s.newgrounds.com\n" $targetNAME
printf "https://%s.newgrounds.com\n" $targetNAME >> $targetNAME.txt
fi

## Wattpad

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Wattpad: ${resetT}"
check1=$(curl -s -i "https://www.wattpad.com/user/$targetNAME" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404 ' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://www.wattpad.com/user/%s\n" $targetNAME
printf "https://www.wattpad.com/user/%s\n" $targetNAME >> $targetNAME.txt
fi

## Canva

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Canva: ${resetT}"
check1=$(curl -s -i "https://www.canva.com/$targetNAME" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404 ' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://www.canva.com/%s\n" $targetNAME
printf "https://www.canva.com/%s\n" $targetNAME >> $targetNAME.txt
fi

## CreativeMarket

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] CreativeMarket: ${resetT}"
check1=$(curl -s -i "https://creativemarket.com/$targetNAME" -H "Accept-Language: en" -L | grep -o '404eef72' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://creativemarket.com/%s\n" $targetNAME
printf "https://creativemarket.com/%s\n" $targetNAME >> $targetNAME.txt
fi

## Trakt

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Trakt: ${resetT}"
check1=$(curl -s -i "https://www.trakt.tv/users/$targetNAME" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404 ' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://www.trakt.tv/users/%s\n" $targetNAME
printf "https://www.trakt.tv/users/%s\n" $targetNAME >> $targetNAME.txt
fi

## 500px

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] 500px: ${resetT}"
check1=$(curl -s -i "https://500px.com/$targetNAME" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://500px.com/%s\n" $targetNAME
printf "https://500px.com/%s\n" $targetNAME >> $targetNAME.txt
fi

## Buzzfeed

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Buzzfeed: ${resetT}"
check1=$(curl -s -i "https://buzzfeed.com/$targetNAME" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://buzzfeed.com/%s\n" $targetNAME
printf "https://buzzfeed.com/%s\n" $targetNAME >> $targetNAME.txt
fi

## TripAdvisor

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] TripAdvisor: ${resetT}"
check1=$(curl -s -i "https://tripadvisor.com/members/$targetNAME" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://tripadvisor.com/members/%s\n" $targetNAME
printf "https://tripadvisor.com/members/%s\n" $targetNAME >> $targetNAME.txt
fi

## HubPages

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] HubPages: ${resetT}"
check1=$(curl -s -i "https://$targetNAME.hubpages.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://%s.hubpages.com/\n" $targetNAME
printf "https://%s.hubpages.com/\n" $targetNAME >> $targetNAME.txt
fi

## Contently

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Contently: ${resetT}"
check1=$(curl -s -i "https://$targetNAME.contently.com" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://%s.contently.com\n" $targetNAME
printf "https://%s.contently.com\n" $targetNAME >> $targetNAME.txt
fi

## Houzz

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Houzz: ${resetT}"
check1=$(curl -s -i "https://houzz.com/user/$targetNAME" -H "Accept-Language: en" -L | grep -o 'an error has occurred' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://houzz.com/user/%s\n" $targetNAME
printf "https://houzz.com/user/%s\n" $targetNAME >> $targetNAME.txt
fi

## blip.fm

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] blip.fm: ${resetT}"
check1=$(curl -s -i "https://blip.fm/$targetNAME" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://blip.fm/%s\n" $targetNAME
printf "https://blip.fm/%s\n" $targetNAME >> $targetNAME.txt
fi

## Wikipedia

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Wikipedia: ${resetT}"
check1=$(curl -s -i "https://www.wikipedia.org/wiki/User:$targetNAME" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://www.wikipedia.org/wiki/User:%s\n" $targetNAME
printf "https://www.wikipedia.org/wiki/User:%s\n" $targetNAME >> $targetNAME.txt
fi

## HackerNews

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] HackerNews: ${resetT}"
check1=$(curl -s -i "https://news.ycombinator.com/user?id=$targetNAME" -H "Accept-Language: en" -L | grep -o 'No such user' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://news.ycombinator.com/user?id=%s\n" $targetNAME
printf "https://news.ycombinator.com/user?id=%s\n" $targetNAME >> $targetNAME.txt
fi

## CodeMentor

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] CodeMentor: ${resetT}"
check1=$(curl -s -i "https://www.codementor.io/$targetNAME" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://www.codementor.io/%s\n" $targetNAME
printf "https://www.codementor.io/%s\n" $targetNAME >> $targetNAME.txt
fi

## ReverbNation

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] ReverbNation: ${resetT}"
check1=$(curl -s -i "https://www.reverbnation.com/$targetNAME" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://www.reverbnation.com/%s\n" $targetNAME
printf "https://www.reverbnation.com/%s\n" $targetNAME >> $targetNAME.txt
fi

## Designspiration 65

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Designspiration: ${resetT}"
check1=$(curl -s -i "https://www.designspiration.net/$targetNAME" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://www.designspiration.net/%s\n" $targetNAME
printf "https://www.designspiration.net/%s\n" $targetNAME >> $targetNAME.txt
fi

## Bandcamp

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Bandcamp: ${resetT}"
check1=$(curl -s -i "https://www.bandcamp.com/$targetNAME" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://www.bandcamp.com/%s\n" $targetNAME
printf "https://www.bandcamp.com/%s\n" $targetNAME >> $targetNAME.txt
fi


## ColourLovers

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] ColourLovers: ${resetT}"
check1=$(curl -s -i "https://www.colourlovers.com/love/$targetNAME" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://www.colourlovers.com/love/%s\n" $targetNAME
printf "https://www.colourlovers.com/love/%s\n" $targetNAME >> $targetNAME.txt
fi


## IFTTT

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] IFTTT: ${resetT}"
check1=$(curl -s -i "https://www.ifttt.com/p/$targetNAME" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://www.ifttt.com/p/%s\n" $targetNAME
printf "https://www.ifttt.com/p/%s\n" $targetNAME >> $targetNAME.txt
fi

## Ebay

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Ebay: ${resetT}"
check1=$(curl -s -i "https://www.ebay.com/usr/$targetNAME" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found\|eBay Profile - error' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://www.ebay.com/usr/%s\n" $targetNAME
printf "https://www.ebay.com/usr/%s\n" $targetNAME >> $targetNAME.txt
fi

## Slack

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Slack: ${resetT}"
check1=$(curl -s -i "https://$targetNAME.slack.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://%s.slack.com\n" $targetNAME
printf "https://%s.slack.com\n" $targetNAME >> $targetNAME.txt
fi

## OkCupid

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] OkCupid: ${resetT}"
check1=$(curl -s -i "https://www.okcupid.com/profile/$targetNAME" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://www.okcupid.com/profile/%s\n" $targetNAME
printf "https://www.okcupid.com/profile/%s\n" $targetNAME >> $targetNAME.txt
fi

## Trip

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Trip: ${resetT}"
check1=$(curl -s -i "https://www.trip.skyscanner.com/user/$targetNAME" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found\|HTTP/2 410' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://www.trip.skyscanner.com/user/%s\n" $targetNAME
printf "https://www.trip.skyscanner.com/user/%s\n" $targetNAME >> $targetNAME.txt
fi

## Ello

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Ello: ${resetT}"
check1=$(curl -s -i "https://ello.co/$targetNAME" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://ello.co/%s\n" $targetNAME
printf "https://ello.co/%s\n" $targetNAME >> $targetNAME.txt
fi

## Tracky

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Tracky: ${resetT}"
check1=$(curl -s -i "https://tracky.com/user/$targetNAME" -H "Accept-Language: en" -L | grep -o 'profile:username' ; echo $?)

if [[ $check1 == *'1'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'0'* ]]; then

printf "${BGreen} Found!${resetT} https://tracky.com/~%s\n" $targetNAME
printf "https://tracky.com/~%s\n" $targetNAME >> $targetNAME.txt
fi

## Tripit

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Tripit: ${resetT}"
check1=$(curl -s -i "https://www.tripit.com/people/$targetNAME#/profile/basic-info" -H "Accept-Language: en" -L | grep -o 'location: https://www.tripit.com/home' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://www.tripit.com/people/%s#/profile/basic-info\n" $targetNAME
printf "https://www.tripit.com/people/%s#/profile/basic-info\n" $targetNAME >> $targetNAME.txt
fi

## Basecamp

printf "${BWhite}[${resetT}${BGreen}+${resetT}${BWhite}] Basecamp: ${resetT}"
check1=$(curl -s -i "https://$targetNAME.basecamphq.com/login" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then
printf "${BYellow}Not Found!${resetT}\n"
elif [[ $check1 == *'1'* ]]; then

printf "${BGreen} Found!${resetT} https://%s.basecamphq.com/login\n" $targetNAME
printf "https://%s.basecamphq.com/login\n" $targetNAME >> $targetNAME.txt

fi
partial
}

banner
scanner
