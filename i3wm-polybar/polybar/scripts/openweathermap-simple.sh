#!/bin/sh

# https://erikflowers.github.io/weather-icons/
get_icon() {
    case $1 in
        # Icons for weather-icons
        # 01d) icon="$(echo -e '%{T1}\uf00d%{T-}')";;
        01d) icon="";;
        01n) icon="";;
        02d) icon="";;
        02n) icon="";;
        03*) icon="";;
        04*) icon="";;
        09d) icon="";;
        09n) icon="";;
        10d) icon="";;
        10n) icon="";;
        11d) icon="";;
        11n) icon="";;
        13d) icon="";;
        13n) icon="";;
        50d) icon="";;
        50n) icon="";;
        *) icon="";
    esac

    echo $icon
}

KEY="xxxx"
CITY="xxxx"
ID="xxxx"
UNITS="metric"
SYMBOL="°C"

API="https://api.openweathermap.org/data/2.5"

if [ -n "$CITY" ]; then
    if [ "$CITY" -eq "$CITY" ] 2>/dev/null; then
        CITY_PARAM="id=$ID"
    else
        CITY_PARAM="q=$CITY"
    fi

    # Try to retrieve weather information from the API
    if weather=$(curl -sf "$API/weather?appid=$KEY&$CITY_PARAM&units=$UNITS"); then
        weather_temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
        weather_icon=$(echo "$weather" | jq -r ".weather[0].icon")
        set_icon=$(get_icon "$weather_icon")""$weather_temp$SYMBOL
        
        echo -e "$(get_icon "$weather_icon")" "$weather_temp$SYMBOL"
    else
        # Return a default icon in case of an error
        echo -e ""
    fi
fi
