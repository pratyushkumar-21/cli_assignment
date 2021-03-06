import requests

query = input("enter article name to search : ")
url = "https://en.wikipedia.org/w/api.php?action=opensearch&search=" + query + "&namespace=0&format=json"
response = requests.get(url)
data = response.json()

file = open("link_py.txt", "a")

for link in data[3]:
    file.write(link + "\n")
file.close()
print("All link added to the file")
