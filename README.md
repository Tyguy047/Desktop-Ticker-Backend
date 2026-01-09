# Desktop Ticker Backend

## About
I coded this for a hardware project of mine where my goal was to make a standalone device to sit on top of my desk to show the current price of a spesific ticker. I chose Monero XMR since it is my favorite crypto currency. I originally made the backend using Python with yfinance and flask. However my Proxmox server is a computer I refurbished myself and the CPU is pretty old. Python was throwing an error when I would try to run the program saying it essentially couldn’t give the CPU instructions. I run most of my services in LXC containers since they’re lighter than a full VM. So instead of just giving up and using the full VM I decided to finally start to learn Go which is something I have been wanting to do for a while. This is my second real project (not just a calculator, temperature converter CLI program, etc.). You can check out my first [here](https://github.com/Tyguy047/Go-WebDAV) which is a WebDAV server so you can self host your own mini iCloud or Google Drive.

- Serves the current price of 1 XMR in USD.
- Updated every 5 minutes.
- Data is pulled from the CoinGecko API (*No API key needed!*)

---

## How to use:
*This tutorial will assume you are on Debian (or Debian based) Linux. The binary should work fine on other platforms but Debian is very stable and common for servers so we will only cover that here.*

1. Build from source or download an official pre built binary [here](https://github.com/Tyguy047/Desktop-Ticker-Backend/releases/latest).
 
2. Install `screen` or another persistent terminal so you can run the software once you log out or disconnect from SSH.
```
sudo apt update && sudo apt upgrade
sudo apt install screen
```

3. Now type `screen` to create a new session and run the binary within the new terminal (screen). Once it’s running you can type `Ctrl + a` and then `d`.
 
4. Congrats, your server is up and running! If you want to have a secure connection with your server, look into setting up [Caddy](https://caddyserver.com) as a reverse proxy. You will likely be fine if your server is running at home but if you are using a remote server or want to access your server over HTTPS remotely you should use Caddy.

---

## Build guide

### Requirements:
- Go
- Make

#

### How to build from source:
1. Start by downloading the source code. You should download the code from the latest release on the releases page so you know the executable will work the same as the prebuilt binary. You can find the latest release [here](https://github.com/Tyguy047/Desktop-Ticker-Backend/releases/latest). Copy the download link to the source code for the latest release and use `wget` to download it directly on your server.
 
2. Once it is downloaded extract it and then `cd` into the new `Desktop-Ticker-Backend` folder.
  
3. Now you can use `make` to build the code for your chosen platform or use the Go compiler to try to build it for a platform that’s not in the `Makefile`. (*If you successfully build for a platform that’s not in the `Makefile` please submit a pull request adding it to the file so I can include it in the next release.*)
  
4. Using the `Makefile` will put the binaries in the `bin` folder. You can now move your binary out of there or run it directly from there.

---

# About The Dev:
To see more of my projects follow me on GitHub or check out my websites to read my tech blog posts:

- [https://tylercaselli.com](https://tylercaselli.com)
- [https://tyguy047.dev](https://tyguy047.dev)

---
