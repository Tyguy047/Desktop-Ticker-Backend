package main

import (
	"fmt" // Standard lib (formatting text for humans).
	"io" // Standard lib (moving raw bytes between systems).
	"net/http" // Go's version of requests.
	"encoding/json" // JSON parsing.
	"strconv" // Convert float64 to string.
)
func fetchMoneroPrice() string {

	resp, err := http.Get("https://api.coingecko.com/api/v3/simple/price?ids=monero&vs_currencies=usd")
	if err != nil {
		fmt.Println("Error fetching price:", err)
		return CURRENT_PRICE
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		fmt.Println("Error reading response:", err)
		return CURRENT_PRICE
	}

	var result map[string]map[string]float64
	if err := json.Unmarshal(body, &result); err != nil {
		fmt.Println("Error parsing JSON:", err)
		return CURRENT_PRICE
	}

	return strconv.FormatFloat(result["monero"]["usd"], 'f', -1, 64)
}