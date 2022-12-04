defmodule RockPaperScissors do
  @opponent_moves %{rock: "A", paper: "B", scissors: "C"}
  @player_moves %{rock: "X", paper: "Y", scissors: "Z"}

  def read_input() do
    case File.read("input.txt") do
      {:ok, result} ->
        result

      {:error, reason} ->
        raise "There was an error reading the input: #{reason}"
    end
  end

  def format_input(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn datum ->
      datum |> String.split(" ")
    end)
  end

  def play_games_part_one(input) do
    input
    |> Enum.reduce(0, fn game, acc ->
      case game do
        ["A", "X"] ->
          acc + 3

        ["A", "Y"] ->
          acc + 2 + 6

        ["A", "Z"] ->
          acc + 3

        ["B", "X"] ->
          acc + 1

        ["B", "Y"] ->
          acc + 2 + 3

        ["B", "Z"] ->
          acc + 3 + 6

        ["C", "X"] ->
          acc + 1 + 6

        ["C", "Y"] ->
          acc + 2

        ["C", "Z"] ->
          acc + 3 + 3
      end
    end)
  end

  def play_games_part_two(input) do
    input
    |> Enum.reduce(0, fn game, acc ->
      case game do
        # X = lose
        # Y = draw
        # Z = win
        ["A", "X"] ->
          acc + 3

        ["A", "Y"] ->
          acc + 3 + 1

        ["A", "Z"] ->
          acc + 6 + 2

        ["B", "X"] ->
          acc + 1

        ["B", "Y"] ->
          acc + 3 + 2

        ["B", "Z"] ->
          acc + 6 + 3

        ["C", "X"] ->
          acc + 2

        ["C", "Y"] ->
          acc + 3 + 3

        ["C", "Z"] ->
          acc + 6 + 1
      end
    end)
  end
end

player_score_part_one =
  RockPaperScissors.read_input()
  |> RockPaperScissors.format_input()
  |> RockPaperScissors.play_games_part_one()

player_score_part_two =
  RockPaperScissors.read_input()
  |> RockPaperScissors.format_input()
  |> RockPaperScissors.play_games_part_two()
