#!/bin/sh
#
# z3bra - (c) wtfpl 2014
# Fetch infos on your computer, and print them to stdout every second.

font="${BAR_FONT:-"-*-lemon-*"}"
icon="${BAR_ICON:-"-*-siji-*"}"
clock() {
    date '+%H:%M'
}

battery() {
    BATC=/sys/class/power_supply/BAT1/capacity
    BATS=/sys/class/power_supply/BAT1/status

    test "`cat $BATS`" = "Charging" && echo -n '+' || echo -n '-'

    sed -n p $BATC
}

volume() {
    amixer get Master | sed -n 'N;s/^.*\[\([0-9]\+%\).*$/\1/p'
}

cpuload() {
    LINE=`ps -eo pcpu |grep -vE '^\s*(0.0|%CPU)' |sed -n '1h;$!H;$g;s/\n/ +/gp'`
    bc <<< $LINE
}

memused() {
    read t f <<< `grep -E 'Mem(Total|Free)' /proc/meminfo |awk '{print $2}'`
    bc <<< "scale=2; 100 - $f / $t * 100" | cut -d. -f1
}

network() {
    read lo int1 int2 <<< `ip link | sed -n 's/^[0-9]: \(.*\):.*$/\1/p'`
    if iwconfig $int1 >/dev/null 2>&1; then
        wifi=$int1
        eth0=$int2
    else
        wifi=$int2
        eth0=$int1
    fi
    ip link show $eth0 | grep 'state UP' >/dev/null && int=$eth0 ||int=$wifi

    #int=eth0

    ping -c 1 8.8.8.8 >/dev/null 2>&1 && 
        echo "$int connected" || echo "$int disconnected"
}

groups() {
    cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'`
    tot=`xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{print $3}'`

    for w in `seq 0 $((cur - 1))`; do line="${line}="; done
    line="${line}|"
    for w in `seq $((cur + 2)) $tot`; do line="${line}="; done
    echo $line
}

get_volume() {
    # Get the system volume.
    volume="$(amixer sget Master | grep -o -m 1 -E "[[:digit:]]+%")"

    case "$volume" in
        0%|[0-9]%)   vol_icon="" ;;
        1?%|2?%|3?%) vol_icon="" ;;
        4?%|5?%|6?%) vol_icon="" ;;
        *) vol_icon="" ;;
    esac

    printf "%s\\n" "$(icon "$vol_icon") ${volume}"

}

# This loop will fill a buffer with our infos, and output it to stdout.
while true; do
#    buf=""
#    buf="${buf} [$(groups)]"
#    buf="${buf} %{c} $(clock)"
#    buf="${buf} %{r} '\f0c1' $(network) -"
#    buf="${buf}  CPU: $(cpuload)%"
#    buf="${buf} RAM: $(memused)%% -"
#    buf="${buf} VOL: $(volume)%%"
#    buf="${buf} MPD: $(nowplaying)"

echo -e "[$(groups)] %{c} $(clock) %{r}  $(network) -CPU: $(cpuload)% $(get_volume) " 
    sleep 1 # The HUD will be updated every second
done |
lemonbar -p -B#c0262626 -F#A0A0A0\
 -f "$icon"\
-f "Font Awesome"\

 | bash
