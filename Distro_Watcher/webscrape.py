
import requests
from bs4 import BeautifulSoup

def read_inputfile(distros):
    with open("input.txt", 'r') as f:
        for line in f.readlines():
            distros.append(line.strip())

page = requests.get("https://distrowatch.com/dwres.php?resource=bittorrent")
soup = BeautifulSoup(page.content, "html.parser")

distros = []
read_inputfile(distros)
print(distros)

save_next_link = False
for torrent in soup.find_all("table")[6].find_all("tr"):

    for name_link in torrent.find_all("td", class_="torrent"):
        for distro in distros:
            if name_link.get_text() == distro:
                print("found a sparky: " + name_link.get_text())
                save_next_link = True
            elif save_next_link == True:
                print("this is sparky link: " + name_link.get_text())
                save_next_link = False



#for torrent in soup.find_all("table")[6].find_all("td", class_="torrent"):
#    print(torrent.get_text())
