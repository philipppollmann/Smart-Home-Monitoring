package main

import (
	"Energy-Consumption-Importer/services"
	"fmt"
)

func main() {
	// Beispiel, wie die Funktion verwendet wird
	webhookURL := "https://discord.com/api/webhooks/1235843792154791986/LC-s8uHIhbxWnJrypqK5bYUAoLU-yuUhq6SyNqXVnPW5zzwAprc1BpYRLGS7P4n7YqM5"
	message := "Hallo, das ist eine Testnachricht!"
	response, err := services.SendToDiscord(webhookURL, message)
	if err != nil {
		fmt.Println("Fehler beim Senden der Nachricht:", err)
	} else {
		fmt.Println("Antwort von Discord:", response)
	}
}
