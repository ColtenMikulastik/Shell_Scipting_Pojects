
import requests
from bs4 import BeautifulSoup

def read_inputfile(distros):
    with open("input.txt", 'r') as f:
        for line in f.readlines():
            distros.append(line.strip())

def write_outputfile(dict_distros, history_value):
    with open("output.txt", 'w') as f:
        for key,value in dict_distros.items():
            f.write(str(key) + ": ")
            for link in value[:history_value:]:
                f.write(str(link) + ", ")
            f.write("\n")
            
# how many torrents back do you want to save
history_value = 3

page = requests.get("https://distrowatch.com/dwres.php?resource=bittorrent")
soup = BeautifulSoup(page.content, "html.parser")

distros = []
read_inputfile(distros)
print(distros)

dict_distros = {}
for distro in distros:
    dict_distros[distro] = list()


save_next_link = False
for torrent in soup.find_all("table")[6].find_all("tr"):

    for distro in distros:
        for name_link in torrent.find_all("td", class_="torrent"):
            if name_link.get_text() == distro:
                print("found a sparky: " + name_link.get_text())
                save_next_link = True
            elif save_next_link == True:
                print("this is sparky link: " + name_link.get_text())
                save_next_link = False
                all_relivant_links = list(dict_distros[distro])
                all_relivant_links.append(name_link.get_text())
                dict_distros[distro] = all_relivant_links



print(dict_distros)

for key,value in dict_distros.items():
    print(str(key) + ": ", end='')
    for link in value[:history_value:]:
        print(str(link) + ", ", end='')
    print("")

write_outputfile(dict_distros, history_value)

