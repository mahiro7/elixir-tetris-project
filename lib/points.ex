defmodule Tetris.Points do
  @type t :: [{integer, integer}]

  ## Fn to controll bricks' points translation by x and y
  def move_to_location(points, {x, y}=_location) do
    Enum.map(points, fn {dx, dy} -> {dx + x, dy + y} end)
  end

  @spec transpose(t) :: t
  def transpose(points) do
    points
    |> Enum.map(fn {x, y} -> {y, x} end)
  end

  @spec mirror(t) :: t
  def mirror(points) do
    points
    |> Enum.map(fn {x, y} -> {5 - x, y} end)
  end

  @spec mirror(t, boolean()) :: t
  def mirror(points, false), do: points
  def mirror(points, true), do: mirror(points)

  @spec flip(t) :: t
  def flip(points) do
    points
    |> Enum.map(fn {x, y} -> {x, 5 - y} end)
  end

  ## Transpose + Mirror = Rotate 90°
  @spec rotate_90(t) :: t
  def rotate_90(points) do
    points
    |> transpose
    |> mirror
  end

  @spec rotate(t, integer) :: t
  def rotate(points, 0), do: points

  def rotate(points, degrees) do
    rotate(
      rotate_90(points),
      degrees - 90
    )

    ## Repeat rotate till degrees == 0
  end

  def with_color(points, color) do
    Enum.map(points, fn point -> add_color(point, color) end)
  end

  defp add_color({_x, _y, _c} = point, _color), do: point
  defp add_color({x, y}, color), do: {x, y, color}

  def to_string(points) do
    map =
      points
      |> Enum.map(fn key -> {key, "1"} end)
      |> Map.new()

    for x <- 1..4, y <- 1..4 do
      Map.get(map, {y, x}, "0")
    end
    |> Enum.chunk_every(4)
    |> Enum.map(&Enum.join/1)
    |> Enum.join("\n")
  end

  def print(points) do
    IO.puts(__MODULE__.to_string(points))
    points
  end
end
