// Copyright (C) 2024 Toitware ApS.
// Use of this source code is governed by a Zero-Clause BSD license that can
// be found in the tests/LICENSE file.

/**
Example code for communicating with the external echo service.
*/

import system.external

main:
  echo := external.Client.open "toitlang.org/demo-echo"
  echo.set-on-notify:: print "Got message: $it.to-string"
  echo.notify "Hello, world!"

  function-id := 0
  response := echo.request function-id #[1, 2, 3]
  print "Got response: $response"

  echo.close
