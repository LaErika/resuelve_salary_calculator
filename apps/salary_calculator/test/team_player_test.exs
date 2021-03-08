defmodule SalaryCalculator.TeamPlayerTest do
  use ExUnit.Case

  @level "A"

  test "level_player" do
    assert SalaryCalculator.TeamPlayer.goals_expected_by(@level) == 5
  end
end
