defmodule ImgUtils do
  @moduledoc """
  TODO: write documentation for ImgUtils.
  """

  @on_load :load_nifs

  @doc """
  TODO: Write documentation.

  ## Examples

  iex> ImgUtils.resize()
  :ok

  """
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
