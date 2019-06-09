// Copyright 2019 <chaishushan{AT}gmail.com>. All rights reserved.
// Use of this source code is governed by a GPL-style
// license that can be found in the LICENSE file.

package main

import (
	"github.com/gin-gonic/gin"

	"github.com/mholt/caddy/caddy/caddymain"
	_ "github.com/mholt/caddy/caddyhttp/httpserver"
)

func main() {
	go caddyMain()
	go ginMain()

	<-make(chan bool)
}

func caddyMain() {
	caddymain.Run()
}

func ginMain() {
	r := gin.Default()
	r.GET("/ping", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"message": "pong",
		})
	})
	r.Run() // listen and serve on 0.0.0.0:8080
}
