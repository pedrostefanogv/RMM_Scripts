#!/usr/bin/python3
import requests

ip_api_url = "http://ip-api.com/json/{{agent.public_ip}}"
response = requests.get(ip_api_url)
data = response.json()

cidade = data["city"]
estado = data["region"]

print(cidade + "/" + estado)
