defmodule ImgUtils do
  @moduledoc """
  Collection of image processing utilities.
  """

  @on_load :load_nifs

  @doc """
  Resize an image.

  ## Examples

  iex> image = <<255, 0, 0, 0, 255, 0, 0, 0, 255>>
  iex> width = 3; height = 1; channels = 3; out_width = 3; out_height = 5
  iex> ImgUtils.resize(image, width, height, channels, out_width, out_height)
  {:ok,
   <<241, 14, 0, 14, 227, 14, 0, 14, 241, 241, 14, 0, 14, 227, 14, 0, 14, 241,
   241, 14, 0, 14, 227, 14, 0, 14, 241, 241, 14, 0, 14, 227, 14, 0, 14, 241,
   241, 14, 0, 14, 227, 14, 0, 14, 241>>}

  """
  @spec resize(
          in_content :: binary,
          in_width :: pos_integer,
          in_height :: pos_integer,
          num_channels :: pos_integer,
          out_width :: pos_integer,
          out_height :: pos_integer
        ) :: {:ok, binary} | {:error, :resize}
  def resize(
        _in_binary,
        _in_width,
        _in_height,
        _num_channels,
        _out_width,
        _out_height
      ) do
    :erlang.nif_error(:nif_not_loaded)
  end

  def load_nifs do
    :ok = :erlang.load_nif(Application.app_dir(:imgutils, "priv/imgutils"), 0)
  end
end
