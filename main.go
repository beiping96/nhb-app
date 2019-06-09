// Copyright 2019 The OpenPitrix Authors. All rights reserved.
// Use of this source code is governed by a Apache license
// that can be found in the LICENSE file.

package main

import (
	"github.com/mholt/caddy/caddy/caddymain"
	_ "github.com/mholt/caddy/caddyhttp/httpserver"
)

func main() {
	caddymain.Run()
}
