defmodule BrickTest do
  use ExUnit.Case

  import Tetris.Brick
 
  def new_brick, do: new()

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

  
end
