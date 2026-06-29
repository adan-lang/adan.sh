import constants

import gleam/erlang/process

import mist

import router/router

import wisp
import wisp/wisp_mist

pub fn main() {
  wisp.configure_logger()

  let assert Ok(_) =
    wisp_mist.handler(router.handle, constants.secret_keybase)
    |> mist.new()
    |> mist.port(8080)
    |> mist.start()

  process.sleep_forever()
}
