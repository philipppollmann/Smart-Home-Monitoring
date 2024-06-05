package services

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
)

// SendToDiscord sendet eine Nachricht an einen Discord-Kanal über einen Webhook.
func SendToDiscord(webhookURL string, message string) (string, error) {
	if webhookURL == "" || message == "" {
		return "", fmt.Errorf("Webhook URL oder Nachricht darf nicht leer sein")
	}

	// Erstelle die Datenstruktur, die als JSON im Body der Anfrage gesendet wird
	data := map[string]string{
		"content": message,
	}
	jsonData, err := json.Marshal(data)
	if err != nil {
		return "", err
	}

	// Erstelle die POST-Anfrage
	resp, err := http.Post(webhookURL, "application/json", bytes.NewBuffer(jsonData))
	if err != nil {
		return "", err
	}
	defer resp.Body.Close()

	// Lies die Antwort aus dem Body
	responseBody, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return "", err
	}
	return string(responseBody), nil
}
