#!/usr/bin/python3
''' Weather acquirer for: https://github.com/miklhh/i3blocks-config '''
import os
import datetime
import xml.etree.ElementTree as ET
import requests

# Forecast URL.
YR_URL = "https://www.yr.no/place/Sverige/%C3%96sterg%C3%B6tland/Link%C3%B6ping/forecast.xml"

# Good to have data + funky emojicons.
FORECAST_CACHE_FILE = os.path.dirname(os.path.realpath(__file__)) + "/forecast.xml"

# Emojis associatted with weather        # Day  # Night
WEATHER_TYPES = { "Fair"               : ["☀️",   "🌙"], #pylint: disable=C0326
                  "Partly cloudy"      : ["⛅",  "☁️"],  #pylint: disable=C0326
                  "Clear sky"          : ["☀️",   "🌙"], #pylint: disable=C0326
                  "Cloudy"             : ["☁️",   "☁️"],  #pylint: disable=C0326
                  "Light rain"         : ["🌧️",  "🌧️"], #pylint: disable=C0326
                  "Rain"               : ["🌧️",  "🌧️"], #pylint: disable=C0326
                  "Heavy Rain"         : ["🌧️",  "🌧️"], #pylint: disable=C0326
                  "Light snow"         : ["🌨️",  "🌨️"], #pylint: disable=C0326
                  "Snow"               : ["🌨️",  "🌨️"], #pylint: disable=C0326
                  "Heavy snow"         : ["🌨️",  "🌨️"], #pylint: disable=C0326
                  "Foggy"              : ["🌫️",  "🌫️"], #pylint: disable=C0326
                  "Fog"                : ["🌫️",  "🌫️"], #pylint: disable=C0326
                  "Light snow showers" : ["🌨️",  "🌨️"]} #pylint: disable=C0326


def get_xml_root():
    """ Returns a weather XML root, cached from old data if necessary. """
    yr_response = 0
    try:
        # Request data from YR.
        yr_response = requests.get(YR_URL)
        if yr_response.status_code != 200:
            raise RuntimeError('Error: YR status code ' + str(yr_response.status_code))

        # New response, store in cache file and return XML root.
        with open(FORECAST_CACHE_FILE, "w") as file_handle:
            file_handle.write(yr_response.text)
        return ET.fromstring(yr_response.text)

    except requests.ConnectionError:
        # Probably just no internet. Use cached forecast.
        if os.path.isfile(FORECAST_CACHE_FILE):
            with open(FORECAST_CACHE_FILE) as file_handle:
                yr_response = file_handle.read()
            # Print recycle emoji and continue using cached forecast.
            print("(♻️)", end=" ")
            return ET.fromstring(yr_response)

        # Dead end, no XML-root acquired.
        raise RuntimeError('No forecast data available.')


def main():
    """ Entry point for program. """
    # Get the XML root.
    try:
        xml_root = get_xml_root()
    except RuntimeError as exception:
        print(exception)

    # Parse the sun rise and set time. Appearntly, they are not always available and
    # so we need to make sure they exist in the recieved data.
    rise_fall_available = True
    sun_rise_time = sun_set_time = ""
    try:
        sun_rise_time = xml_root.find("sun").attrib.get("rise")
        sun_rise_time = sun_rise_time[sun_rise_time.find('T')+1 : len(sun_rise_time)-3]
        sun_set_time = xml_root.find("sun").attrib.get("set")
        sun_set_time = sun_set_time[sun_set_time.find('T')+1 : len(sun_set_time)-3]
    except (ET.ParseError, AttributeError):
        rise_fall_available = False

    # Get the current weather information.
    forecast = xml_root.find("forecast").find("tabular").find("time")
    weather = forecast.find("symbol").attrib.get("name")
    temperature = forecast.find("temperature").attrib.get("value")
    wind_direction = forecast.find("windDirection").attrib.get("code")
    wind_speed = forecast.find("windSpeed").attrib.get("mps")
    precipitation = forecast.find("precipitation").attrib.get("value")

    # Night time?
    is_night = 0
    now = datetime.datetime.now()
    if rise_fall_available:
        # Use sun rise and fall time to determine.
        sun_rise = datetime.datetime.strptime(sun_rise_time, "%H:%M")
        sun_set = datetime.datetime.strptime(sun_set_time, "%H:%M")
        is_night = 1 if now.time() < sun_rise.time() or sun_set.time() < now.time() else 0
    else:
        # No rise/fall time available. Approximate daytime as [07:00 - 21:00].
        sun_rise = datetime.datetime.strptime("07:00", "%H:%M")
        sun_set = datetime.datetime.strptime("21:00", "%H:%M")
        is_night = 1 if now.time() < sun_rise.time() or sun_set.time() < now.time() else 0

    # Print the weather.
    if weather in WEATHER_TYPES:
        # Emoji is avaiable for usage.
        print(weather + ": " + WEATHER_TYPES.get(weather)[is_night] + " ", end="")
    else:
        # No emoji available, use regular text.
        print(weather + " ", end="")

    # Print the temperature and sun times.
    print(temperature, end="°C ")

    # Print the sun rise and set time.
    if rise_fall_available:
        print("[" + sun_rise_time + " 🌅 " + sun_set_time + "]", end=" ")

    # Print the precipitation (if there is any).
    if precipitation != "0":
        # Print with a wet umbrella
        print("| ☔ " + precipitation + "mm", end=" ")

    # Print wind data.
    print("| 🍃 " + wind_speed + "m/s " + "(" + wind_direction + ")", end="")

# Go gadget, go!
main()
