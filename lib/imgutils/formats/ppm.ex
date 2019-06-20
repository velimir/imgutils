defmodule ImgUtils.Formats.PPM do
  @moduledoc """
  PPM image encoding

  ## Usage

  ### Encoding

  ```elixir
  image = File.read!("image.jpeg")
  {:ok, decoded, props} = Jaypeg.decode(image)
  encoded = ImgUtils.Formats.PPM.encode(decoded, props[:width], props[:height])
  File.write!("image.ppm", encoded)
  ```
  """

  @doc """
  Encode image using PPM format

  ## Examples

      iex> ImgUtils.Formats.PPM.encode(<<255, 0, 0>>, 1, 1)
      <<80, 54, 10, 49, 32, 49, 10, 50, 53, 53, 10, 255, 0, 0>>

  """
  @spec encode(binary, pos_integer, pos_integer) :: binary
  def encode(content, width, height) do
    <<"P6\n#{width} #{height}\n255\n", content::binary>>
  end
end
