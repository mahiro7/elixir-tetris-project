defmodule Tetris.Points do

  ## Fn to controll bricks' points translation by x and y
  def translate(points, {x, y}) do
    Enum.map(points, fn {dx, dy} -> {dx + x, dy + y} end )
  end


  def transpose(points) do
    points
    |> Enum.map(fn {x, y} -> {y, x} end)
  end

  def mirror(points) do
    points
    |> Enum.map(fn {x, y} -> {5 - x, y} end)
  end

  def flip(points) do
    points
    |> Enum.map(fn {x, y} -> {x, 5 - y} end)
  end

  ## Transpose + Mirror = Rotate 90°
  def rotate_90(points) do
    points
    |> transpose
    |> mirror
  end

  def rotate(points, 0), do: points
  def rotate(points, degrees) do
    rotate(
      rotate_90(points),
      degrees - 90
    ) ## Repeat rotate till degrees == 0
  end
end
