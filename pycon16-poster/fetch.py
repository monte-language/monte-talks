import requests

def main():
    r = requests.get("http://example.com/")
    print r
    print r.text

if __name__ == "__main__":
    main()
