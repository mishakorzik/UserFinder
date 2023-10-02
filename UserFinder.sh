trap 'printf "\n";partial;exit 1' 2


banner() {

printf "\e[1;77m __   __  ______  _______  ______      _______  ___  __    _  ______   _______  ______ \e[0m\n"
printf "\e[1;77m|  | |  ||      ||       ||    _ |    |       ||   ||  |  | ||      | |       ||    _ |\e[0m\n"
printf "\e[1;77m|  | |  ||  ____||    ___||   | ||    |    ___||   ||   |_| ||  _    ||    ___||   | ||\e[0m\n"
printf "\e[1;77m|  |_|  || |____ |   |___ |   |_||_   |   |___ |   ||       || | |   ||   |___ |   |_||_ \e[0m\n"
printf "\e[1;77m|       ||____  ||    ___||    __  |  |    ___||   ||  _    || |_|   ||    ___||    __  |\e[0m\n"
printf "\e[1;77m|       | ____| ||   |___ |   |  | |  |   |    |   || | |   ||       ||   |___ |   |  | |\e[0m\n"
printf "\e[1;77m|_______||______||_______||___|  |_|  |___|    |___||_|  |__||______| |_______||___|  |_|\e[0m\n"
printf "\n"
printf "\e[1;93m             .:.:;..\e[0m\e[1;77m UserFinder v1.0 Developer: misha korzhik \e[0m\e[1;93m..;:.:.\e[0m\n"
printf "\n"


}

partial() {

if [[ -e $username.txt ]]; then
printf "\e[1;92m[\e[0m\e[1;77m^^\e[0m\e[1;92m] Saved:\e[0m\e[1;77m %s.txt\n" $username
fi


}

scanner() {

read -p $'\e[1;92m[\e[0m\e[1;77m>\e[0m\e[1;92m] Input Username:\e[0m ' username

if [[ -e $username.txt ]]; then
printf "\e[1;92m[\e[0m\e[1;77mX\e[0m\e[1;92m] Removing previous file:\e[0m\e[1;77m %s.txt" $username
rm -rf $username.txt
fi
printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m>\e[0m\e[1;92m] Checking username\e[0m\e[1;77m %s\e[0m\e[1;92m on: \e[0m\n" $username

## INSTAGRAM

check_insta=$(curl -s -H "Accept-Language: en" "https://www.instagram.com/$username" -L | grep -o 'The link you followed may be broken'; echo $?)
printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Instagram: \e[0m"

if [[ $check_insta == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.instagram.com/%s\n" $username
printf "https://www.instagram.com/%s\n" $username > $username.txt
elif [[ $check_insta == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi

## Facebook

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Facebook: \e[0m"
check_face=$(curl -s "https://www.facebook.com/$username" -L -H "Accept-Language: en" | grep -o 'not found'; echo $?)


if [[ $check_face == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.facebook.com/%s\n" $username
printf "https://www.facebook.com/%s\n" $username >> $username.txt
elif [[ $check_face == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi

## TWITTER 

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Twitter: \e[0m"
check_twitter=$(curl -s "https://www.twitter.com/$username" -L -H "Accept-Language: en" | grep -o 'page doesn’t exist'; echo $?)


if [[ $check_twitter == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.twitter.com/%s\n" $username
printf "https://www.twitter.com/%s\n" $username >> $username.txt
elif [[ $check_twitter == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi

## YOUTUBE

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] YouTube: \e[0m"
check_youtube=$(curl -s "https://www.youtube.com/$username" -L -H "Accept-Language: en" | grep -o 'Not Found'; echo $?)


if [[ $check_youtube == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://www.youtube.com/%s\n" $username
printf "https://www.youtube.com/%s\n" $username >> $username.txt
elif [[ $check_youtube == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi

## BLOGGER

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Blogger: \e[0m"
check=$(curl -s "https://$username.blogspot.com" -L -H "Accept-Language: en" -i | grep -o 'HTTP/2 404'; echo $?)


if [[ $check == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://%s.blogspot.com\n" $username
printf "https://%s.blogspot.com\n" $username >> $username.txt
elif [[ $check == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi

## GLOOGLE PLUS

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] GooglePlus: \e[0m"
check=$(curl -s "https://plus.google.com/+$username/posts" -L -H "Accept-Language: en" -i | grep -o 'HTTP/2 404' ; echo $?)


if [[ $check == *'1'* ]]; then
printf "\e[1;92m Found!\e[0m https://plus.google.com/+%s/posts\n" $username
printf "https://plus.google.com/+%s/posts\n" $username >> $username.txt
elif [[ $check == *'0'* ]]; then
printf "\e[1;93mNot Found!\e[0m\n"
fi

## REDDIT

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Reddit: \e[0m"
check1=$(curl -s -i "https://www.reddit.com/user/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | head -n1 | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.reddit.com/user/%s\n" $username
printf "https://www.reddit.com/user/%s\n" $username >> $username.txt
fi

## WORDPRESS

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Wordpress: \e[0m"
check1=$(curl -s -i "https://$username.wordpress.com" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'Do you want to register' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://%s.wordpress.com\n" $username
printf "https://%s.wordpress.com\n" $username >> $username.txt
fi

## PINTEREST

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Pinterest: \e[0m"
check1=$(curl -s -i "https://www.pinterest.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '?show_error' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.pinterest.com/%s\n" $username
printf "https://www.pinterest.com/%s\n" $username >> $username.txt
fi

## GITHUB

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Github: \e[0m"
check1=$(curl -s -i "https://www.github.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.github.com/%s\n" $username
printf "https://www.github.com/%s\n" $username >> $username.txt
fi

## TUMBLR

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Tumblr: \e[0m"
check1=$(curl -s -i "https://$username.tumblr.com" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://%s.tumblr.com\n" $username
printf "https://%s.tumblr.com\n" $username >> $username.txt
fi

## FLICKR

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Flickr: \e[0m"
check1=$(curl -s -i "https://www.flickr.com/people/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.flickr.com/photos/%s\n" $username
printf "https://www.flickr.com/photos/%s\n" $username >> $username.txt
fi

## STEAM

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Steam: \e[0m"
check1=$(curl -s -i "https://steamcommunity.com/id/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'The specified profile could not be found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://steamcommunity.com/id/%s\n" $username
printf "https://steamcommunity.com/id/%s\n" $username >> $username.txt
fi

## VIMEO

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Vimeo: \e[0m"
check1=$(curl -s -i "https://vimeo.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://vimeo.com/%s\n" $username
printf "https://vimeo.com/%s\n" $username >> $username.txt
fi


## SoundCloud

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] SoundCloud: \e[0m"
check1=$(curl -s -i "https://soundcloud.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 Not Found'; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://soundcloud.com/%s\n" $username
printf "https://soundcloud.com/%s\n" $username >> $username.txt
fi

## DISQUS

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Disqus: \e[0m"
check1=$(curl -s -i "https://disqus.com/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o '404 NOT FOUND' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://disqus.com/%s\n" $username
printf "https://disqus.com/%s\n" $username >> $username.txt
fi

## MEDIUM

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Medium: \e[0m"
check1=$(curl -s -i "https://medium.com/@$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://medium.com/@%s\n" $username
printf "https://medium.com/@%s\n" $username >> $username.txt
fi

## DEVIANTART

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] DeviantART: \e[0m"
check1=$(curl -s -i "https://$username.deviantart.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://%s.deviantart.com\n" $username
printf "https://%s.deviantart.com\n" $username >> $username.txt
fi

## VK

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] VK: \e[0m"
check1=$(curl -s -i "https://vk.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://vk.com/%s\n" $username
printf "https://vk.com/%s\n" $username >> $username.txt
fi

## About.me

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] About.me: \e[0m"
check1=$(curl -s -i "https://about.me/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://about.me/%s\n" $username
printf "https://about.me/%s\n" $username >> $username.txt
fi

## Spotify

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Spotify: \e[0m"
check1=$(curl -s -i "https://open.spotify.com/user/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://open.spotify.com/user/%s\n" $username
printf "https://open.spotify.com/user/%s\n" $username >> $username.txt
fi

## MixCloud

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] MixCloud: \e[0m"
check1=$(curl -s -i "https://www.mixcloud.com/$username" -H "Accept-Language: en" -L | grep -o 'error-message' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.mixcloud.com/%s\n" $username
printf "https://www.mixcloud.com/%s\n" $username >> $username.txt
fi

## Scribd

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Scribd: \e[0m"
check1=$(curl -s -i "https://www.scribd.com/$username" -H "Accept-Language: en" -L | grep -o 'show_404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.scribd.com/%s\n" $username
printf "https://www.scribd.com/%s\n" $username >> $username.txt
fi

## Badoo

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Badoo: \e[0m"
check1=$(curl -s -i "https://www.badoo.com/en/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.badoo.com/en/%s\n" $username
printf "https://www.badoo.com/en/%s\n" $username >> $username.txt
fi

# Patreon

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Patreon: \e[0m"
check1=$(curl -s -i "https://www.patreon.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.patreon.com/%s\n" $username
printf "https://www.patreon.com/%s\n" $username >> $username.txt
fi

## BitBucket

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] BitBucket: \e[0m"
check1=$(curl -s -i "https://bitbucket.org/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://bitbucket.org/%s\n" $username
printf "https://bitbucket.org/%s\n" $username >> $username.txt
fi

## CashMe

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] CashMe: \e[0m"
check1=$(curl -s -i "https://cash.me/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found'; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://cash.me/%s\n" $username
printf "https://cash.me/%s\n" $username >> $username.txt
fi

## Behance

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Behance: \e[0m"
check1=$(curl -s -i "https://www.behance.net/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found'; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.behance.net/%s\n" $username
printf "https://www.behance.net/%s\n" $username >> $username.txt
fi

## GoodReads

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] GoodReads: \e[0m"
check1=$(curl -s -i "https://www.goodreads.com/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.goodreads.com/%s\n" $username
printf "https://www.goodreads.com/%s\n" $username >> $username.txt
fi

## Instructables

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Instructables: \e[0m"
check1=$(curl -s -i "https://www.instructables.com/member/$username" -H "Accept-Language: en" -L | grep -o '404 NOT FOUND' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.instructables.com/member/%s\n" $username
printf "https://www.instructables.com/member/%s\n" $username >> $username.txt
fi

## KeyBase

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Keybase: \e[0m"
check1=$(curl -s -i "https://keybase.io/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://keybase.io/%s\n" $username
printf "https://keybase.io/%s\n" $username >> $username.txt
fi

## Kongregate

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Kongregate: \e[0m"
check1=$(curl -s -i "https://kongregate.com/accounts/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://kongregate.com/accounts/%s\n" $username
printf "https://kongregate.com/accounts/%s\n" $username >> $username.txt
fi

## Livejournal

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] LiveJournal: \e[0m"
check1=$(curl -s -i "https://$username.livejournal.com" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://%s.livejournal.com\n" $username
printf "https://%s.livejournal.com\n" $username >> $username.txt
fi

## AngelList

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] AngelList: \e[0m"
check1=$(curl -s -i "https://angel.co/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://angel.co/%s\n" $username
printf "https://angel.co/%s\n" $username >> $username.txt
fi

## Last.fm

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] last.fm: \e[0m"
check1=$(curl -s -i "https://last.fm/user/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://last.fm/user/%s\n" $username
printf "https://last.fm/user/%s\n" $username >> $username.txt
fi

## Dribbble

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Dribbble: \e[0m"
check1=$(curl -s -i "https://dribbble.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://dribbble.com/%s\n" $username
printf "https://dribbble.com/%s\n" $username >> $username.txt
fi

## Codecademy

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Codecademy: \e[0m"
check1=$(curl -s -i "https://www.codecademy.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.codecademy.com/%s\n" $username
printf "https://www.codecademy.com/%s\n" $username >> $username.txt
fi

## Gravatar

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Gravatar: \e[0m"
check1=$(curl -s -i "https://en.gravatar.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://en.gravatar.com/%s\n" $username
printf "https://en.gravatar.com/%s\n" $username >> $username.txt
fi

## Pastebin

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Pastebin: \e[0m"
check1=$(curl -s -i "https://pastebin.com/u/$username" -H "Accept-Language: en" -L --user-agent '"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.3) Gecko/20010801"' | grep -o 'location: /index' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://pastebin.com/u/%s\n" $username
printf "https://pastebin.com/u/%s\n" $username >> $username.txt
fi

## Foursquare

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Foursquare: \e[0m"
check1=$(curl -s -i "https://foursquare.com/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://foursquare.com/%s\n" $username
printf "https://foursquare.com/%s\n" $username >> $username.txt
fi

## Roblox

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Roblox: \e[0m"
check1=$(curl -s -i "https://www.roblox.com/user.aspx?username=$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://foursquare.com/%s\n" $username
printf "https://foursquare.com/%s\n" $username >> $username.txt
fi

## Gumroad

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Gumroad: \e[0m"
check1=$(curl -s -i "https://www.gumroad.com/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.gumroad.com/%s\n" $username
printf "https://www.gumroad.com/%s\n" $username >> $username.txt
fi

## Newgrounds

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Newgrounds: \e[0m"
check1=$(curl -s -i "https://$username.newgrounds.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404 ' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://%s.newgrounds.com\n" $username
printf "https://%s.newgrounds.com\n" $username >> $username.txt
fi

## Wattpad

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Wattpad: \e[0m"
check1=$(curl -s -i "https://www.wattpad.com/user/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404 ' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.wattpad.com/user/%s\n" $username
printf "https://www.wattpad.com/user/%s\n" $username >> $username.txt
fi

## Canva

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Canva: \e[0m"
check1=$(curl -s -i "https://www.canva.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404 ' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.canva.com/%s\n" $username
printf "https://www.canva.com/%s\n" $username >> $username.txt
fi

## CreativeMarket

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] CreativeMarket: \e[0m"
check1=$(curl -s -i "https://creativemarket.com/$username" -H "Accept-Language: en" -L | grep -o '404eef72' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://creativemarket.com/%s\n" $username
printf "https://creativemarket.com/%s\n" $username >> $username.txt
fi

## Trakt

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Trakt: \e[0m"
check1=$(curl -s -i "https://www.trakt.tv/users/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404 ' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.trakt.tv/users/%s\n" $username
printf "https://www.trakt.tv/users/%s\n" $username >> $username.txt
fi

## 500px

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] 500px: \e[0m"
check1=$(curl -s -i "https://500px.com/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://500px.com/%s\n" $username
printf "https://500px.com/%s\n" $username >> $username.txt
fi

## Buzzfeed

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Buzzfeed: \e[0m"
check1=$(curl -s -i "https://buzzfeed.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://buzzfeed.com/%s\n" $username
printf "https://buzzfeed.com/%s\n" $username >> $username.txt
fi

## TripAdvisor

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] TripAdvisor: \e[0m"
check1=$(curl -s -i "https://tripadvisor.com/members/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://tripadvisor.com/members/%s\n" $username
printf "https://tripadvisor.com/members/%s\n" $username >> $username.txt
fi

## HubPages

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] HubPages: \e[0m"
check1=$(curl -s -i "https://$username.hubpages.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://%s.hubpages.com/\n" $username
printf "https://%s.hubpages.com/\n" $username >> $username.txt
fi

## Contently

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Contently: \e[0m"
check1=$(curl -s -i "https://$username.contently.com" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://%s.contently.com\n" $username
printf "https://%s.contently.com\n" $username >> $username.txt
fi

## Houzz

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Houzz: \e[0m"
check1=$(curl -s -i "https://houzz.com/user/$username" -H "Accept-Language: en" -L | grep -o 'an error has occurred' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://houzz.com/user/%s\n" $username
printf "https://houzz.com/user/%s\n" $username >> $username.txt
fi

## blip.fm

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] blip.fm: \e[0m"
check1=$(curl -s -i "https://blip.fm/$username" -H "Accept-Language: en" -L | grep -o '404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://blip.fm/%s\n" $username
printf "https://blip.fm/%s\n" $username >> $username.txt
fi

## Wikipedia

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Wikipedia: \e[0m"
check1=$(curl -s -i "https://www.wikipedia.org/wiki/User:$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.wikipedia.org/wiki/User:%s\n" $username
printf "https://www.wikipedia.org/wiki/User:%s\n" $username >> $username.txt
fi

## HackerNews

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] HackerNews: \e[0m"
check1=$(curl -s -i "https://news.ycombinator.com/user?id=$username" -H "Accept-Language: en" -L | grep -o 'No such user' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://news.ycombinator.com/user?id=%s\n" $username
printf "https://news.ycombinator.com/user?id=%s\n" $username >> $username.txt
fi

## CodeMentor

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] CodeMentor: \e[0m"
check1=$(curl -s -i "https://www.codementor.io/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.codementor.io/%s\n" $username
printf "https://www.codementor.io/%s\n" $username >> $username.txt
fi

## ReverbNation

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] ReverbNation: \e[0m"
check1=$(curl -s -i "https://www.reverbnation.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.reverbnation.com/%s\n" $username
printf "https://www.reverbnation.com/%s\n" $username >> $username.txt
fi

## Designspiration 65

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Designspiration: \e[0m"
check1=$(curl -s -i "https://www.designspiration.net/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.designspiration.net/%s\n" $username
printf "https://www.designspiration.net/%s\n" $username >> $username.txt
fi

## Bandcamp

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Bandcamp: \e[0m"
check1=$(curl -s -i "https://www.bandcamp.com/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.bandcamp.com/%s\n" $username
printf "https://www.bandcamp.com/%s\n" $username >> $username.txt
fi


## ColourLovers

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] ColourLovers: \e[0m"
check1=$(curl -s -i "https://www.colourlovers.com/love/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.colourlovers.com/love/%s\n" $username
printf "https://www.colourlovers.com/love/%s\n" $username >> $username.txt
fi


## IFTTT

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] IFTTT: \e[0m"
check1=$(curl -s -i "https://www.ifttt.com/p/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.ifttt.com/p/%s\n" $username
printf "https://www.ifttt.com/p/%s\n" $username >> $username.txt
fi

## Ebay

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Ebay: \e[0m"
check1=$(curl -s -i "https://www.ebay.com/usr/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found\|eBay Profile - error' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.ebay.com/usr/%s\n" $username
printf "https://www.ebay.com/usr/%s\n" $username >> $username.txt
fi

## Slack

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Slack: \e[0m"
check1=$(curl -s -i "https://$username.slack.com" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://%s.slack.com\n" $username
printf "https://%s.slack.com\n" $username >> $username.txt
fi

## OkCupid

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] OkCupid: \e[0m"
check1=$(curl -s -i "https://www.okcupid.com/profile/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.okcupid.com/profile/%s\n" $username
printf "https://www.okcupid.com/profile/%s\n" $username >> $username.txt
fi

## Trip

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Trip: \e[0m"
check1=$(curl -s -i "https://www.trip.skyscanner.com/user/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found\|HTTP/2 410' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.trip.skyscanner.com/user/%s\n" $username
printf "https://www.trip.skyscanner.com/user/%s\n" $username >> $username.txt
fi

## Ello

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Ello: \e[0m"
check1=$(curl -s -i "https://ello.co/$username" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://ello.co/%s\n" $username
printf "https://ello.co/%s\n" $username >> $username.txt
fi

## Tracky

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Tracky: \e[0m"
check1=$(curl -s -i "https://tracky.com/user/$username" -H "Accept-Language: en" -L | grep -o 'profile:username' ; echo $?)

if [[ $check1 == *'1'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'0'* ]]; then 

printf "\e[1;92m Found!\e[0m https://tracky.com/~%s\n" $username
printf "https://tracky.com/~%s\n" $username >> $username.txt
fi

## Tripit

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Tripit: \e[0m"
check1=$(curl -s -i "https://www.tripit.com/people/$username#/profile/basic-info" -H "Accept-Language: en" -L | grep -o 'location: https://www.tripit.com/home' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://www.tripit.com/people/%s#/profile/basic-info\n" $username
printf "https://www.tripit.com/people/%s#/profile/basic-info\n" $username >> $username.txt
fi

## Basecamp

printf "\e[1;77m[\e[0m\e[1;92m+\e[0m\e[1;77m] Basecamp: \e[0m"
check1=$(curl -s -i "https://$username.basecamphq.com/login" -H "Accept-Language: en" -L | grep -o 'HTTP/2 404\|404 Not Found' ; echo $?)

if [[ $check1 == *'0'* ]] ; then 
printf "\e[1;93mNot Found!\e[0m\n"
elif [[ $check1 == *'1'* ]]; then 

printf "\e[1;92m Found!\e[0m https://%s.basecamphq.com/login\n" $username
printf "https://%s.basecamphq.com/login\n" $username >> $username.txt

fi
partial
}
banner
scanner
