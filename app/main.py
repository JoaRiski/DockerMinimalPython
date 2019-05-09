import requests


def main():
    print(requests.get("http://192.168.11.4:5000/"))
    #  There's no DNS resolution so we can't pull a joke from this API :(
    # print(requests.get("https://api.chucknorris.io/jokes/random").json().get("value", "No joke found, sorry :("))


if __name__ == "__main__":
    print("Test")
    main()
