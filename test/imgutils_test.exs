defmodule ImgUtilsTest do
  use ExUnit.Case
  doctest ImgUtils

  alias ImgUtils.{Formats.PPM, Test.Helper}

  test "image resizing" do
    red = <<255, 0, 0>>
    green = <<0, 255, 0>>
    blue = <<0, 0, 255>>

    arr = [red, green, blue]
    content = arr |> Enum.join()

    width = 3
    height = 1
    channels = length(arr)
    out_width = 3
    out_height = 5

    {:ok, resized} =
      ImgUtils.resize(
        content,
        width,
        height,
        channels,
        out_width,
        out_height
      )

    encoded = PPM.encode(resized, out_width, out_height)
    expected = Helper.fixture!("resized-rgb.ppm")

    assert expected == encoded
  end
end
