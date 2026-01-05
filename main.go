package main

import (
	"fmt" // Standard lib (formatting text for humans).
	"net/http" // Go's version of requests.
	"time" // Used to do Go's version of time.sleep(x)
)

var CURRENT_PRICE string

func main() {
	// Fetch price immediately at startup
	updatePrice()

	// Start a background goroutine to update the price every 5 minutes
	go func() {
		for {
			updatePrice()
			time.Sleep(5 * time.Minute)
		}
	}()

	// HTTP endpoint just returns the cached price
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprint(w, CURRENT_PRICE)
	})

	fmt.Println("Server running on http://localhost:8080")
	http.ListenAndServe(":8080", nil)
}

func updatePrice() {
	price := fetchMoneroPrice()
	if price != "" {
		CURRENT_PRICE = price
		fmt.Println(CURRENT_PRICE)
	}
}