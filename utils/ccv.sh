#!/usr/bin/env bash
# quickly check a cryptocoin value
# author: eti


# vars
# urls
ethurl="https://ethereumprice.org"
btcurl="https://ethereumprice.org/btc/"
ltcurl="https://ethereumprice.org/ltc/"

# tmp
btctmp="/tmp/btc"
ethtmp="/tmp/eth"
ltctmp="/tmp/ltc"

# strings
str0="<span id=\"ep-price\">"
str1="</span>"
prc0="<span id=\"ep-percent-change\">"
prc1="</span>"

# colors
rst="\e[0m"
ylw="\e[33m"
blu="\e[34m"
dgr="\e[90m"
lgr="\e[37m"

# misc
ctc="f$2"
out="$3"



# funcs
fbtc() {
	url="$btcurl"
	curl -s "$url" > "$btctmp"
	cur="$(cat "$btctmp" | grep -oP "(?<=$str0).*?(?=$str1)")"
	prc="$(cat "$btctmp" | grep -oP "(?<=$prc0).*?(?=$prc1)")"

	if [ "$iiaf" = "yes" ] ; then
		printf "BTC: \$$cur - $prc%% \n"
	else
		printf ""$ylw"BTC:"$rst" \$$cur "$dgr"-"$rst" $prc%% \n"
	fi
	
	rm "$btctmp"
}


feth() {
	url="$ethurl"
	curl -s "$url" > "$ethtmp"
	cur="$(cat "$ethtmp" | grep -oP "(?<=$str0).*?(?=$str1)")"
	prc="$(cat "$ethtmp" | grep -oP "(?<=$prc0).*?(?=$prc1)")"

	if [ "$iiaf" = "yes" ] ; then
		printf "ETH: \$$cur - $prc%% \n"
	else
		printf ""$blu"ETH:"$rst" \$$cur "$dgr"-"$rst" $prc%% \n"
	fi
	
	rm "$ethtmp"
}


fltc() {
	url="$ltcurl"
	curl -s "$url" > "$ltctmp"
	cur="$(cat "$ltctmp" | grep -oP "(?<=$str0).*?(?=$str1)")"
	prc="$(cat "$ltctmp" | grep -oP "(?<=$prc0).*?(?=$prc1)")"

	if [ "$iiaf" = "yes" ] ; then
		printf "LTC: \$$cur - $prc%% \n"
	else
		printf ""$lgr"LTC:"$rst" \$$cur "$dgr"-"$rst" $prc%% \n"
	fi
	
	rm "$ltctmp"
}


fetch() {
	# hide the cursor
	tput civis

	# get the values
	fbtc
	feth
	fltc

	# show the cursor
	tput cnorm
}


file() {
	$ctc > $out
}

loopfile() {
	while :; do
		# fetch the values
		file
		
		# wait
		sleep "$hold"
	done
}


loop() {
	while :; do	
		# clear the window
		printf "\033c"

		# fetch the values
		fetch

		# hide the cursor
		tput civis

		# wait
		printf "$dgr\0refreshing the values in $hold seconds...$rst"
		sleep "$hold"
		
		# clear the window again
		printf "\033c"
	done
}


usage() {
	printf "usage: ccv [options]
options:
	-l [seconds] (loop)
	-h (show this screen)\n"
	exit 0
}


# exec
# show the cursor even on quit
trap "tput cnorm && exit" INT

if [ "$1" = "-l" ] ; then
	# set the arg
	hold="$2"
	loop
elif [ "$1" = "-f" ] ; then
	# is it a file?
	iiaf="yes"
	file
elif [ "$1" = "-lf" ] ; then
	# is it a file?
	iiaf="yes"
	# set the arg
	hold="$4"
	loopfile
elif [ "$1" = "-h" ] ; then
	usage
else
	fetch
fi
