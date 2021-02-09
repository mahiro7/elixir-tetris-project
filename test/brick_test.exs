defmodule BrickTest do
  use ExUnit.Case

  import Tetris.Brick
  alias Tetris.Points

  def new_brick(attributes \\ []), do: new(attributes)

  test "Creates a new brick" do
    assert new_brick().name == :i
  end

  test "Creates a new random brick" do
    actual = new_random()

    assert actual.name in [:i, :l, :z, :t, :o]
    assert actual.rotation in [0, 90, 180, 270]
    assert actual.reflection in [true, false]
  end

  test "Should manipulate brick" do
    actual =
      new_brick()
      |> left
      |> rigth
      |> rigth
      |> down
      |> spin_90

    assert actual.location == {41, 1}
    assert actual.rotation == 90
    assert actual.reflection in [true, false]
  end

  test "Should return points for i shape" do
    points =
      new_brick(name: :i)
      |> shape()

    assert {2, 2} in points
  end

  test "Should return points for o shape" do
    points =
      new_brick(name: :o)
      |> shape()

    assert {3, 3} in points
  end

  test "Should rotate, flip and mirror" do
    [{1, 1}]
    |> Points.mirror()
    |> assert_point({4, 1})
    |> Points.flip()
    |> assert_point({4, 4})
    |> Points.rotate_90()
    |> assert_point({1, 4})
    |> Points.rotate_90()
    |> assert_point({1, 1})
  end

  test "Should convert brick to string" do
    actual = new_brick |> Tetris.Brick.to_string
    expected = "0100\n0100\n0100\n0100"

    assert actual == expected
  end

  test "Should inspect bricks" do
    expected = """
    0100
    0100
    0100
    0100
    {#{x_center()}, 0} false 0
    """
    actual = new_brick |> inspect

    assert "#{actual}\n" == expected
  end

  def assert_point([actual], expected) do
    assert actual == expected
    [actual]
  end
end
