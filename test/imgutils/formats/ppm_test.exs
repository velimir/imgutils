defmodule ImgUtils.Formats.PPMTest do
  use ExUnit.Case
  doctest ImgUtils.Formats.PPM

  alias ImgUtils.{Formats.PPM, Test.Helper}

  test "PPM encoding" do
    red = <<255, 0, 0>>
    green = <<0, 255, 0>>
    blue = <<0, 0, 255>>

    content = [red, green, blue, blue, green, red] |> Enum.join()

    expected = Helper.fixture!("rgb.ppm")
    assert expected == PPM.encode(content, 3, 2)
  end
end
