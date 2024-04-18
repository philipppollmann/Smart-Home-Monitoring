package main

import (
	"github.com/gin-gonic/gin"
)

func main() {
	request := gin.Default()
	request.GET("/speed-test", func(context *gin.Context) {
		context.JSON(200, gin.H{
			"message": "200mbps",
		})
	})

	err := request.Run()
	if err != nil {
		return
	}
}
