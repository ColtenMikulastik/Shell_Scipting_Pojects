
import requests
from bs4 import BeautifulSoup

page = requests.get("https://distrowatch.com/dwres.php?resource=bittorrent")
soup = BeautifulSoup(page.content, "html.parser")

save_next_link = False
for torrent in soup.find_all("table")[6].find_all("tr"):

    for name_link in torrent.find_all("td", class_="torrent"):
        if name_link.get_text() == "Manjaro Linux":
            print("found a sparky: " + name_link.get_text())
            save_next_link = True
        elif save_next_link == True:
            print("this is sparky link: " + name_link.get_text())
            save_next_link = False



#for torrent in soup.find_all("table")[6].find_all("td", class_="torrent"):
#    print(torrent.get_text())
