defmodule CampCleanup do
  def read_input() do
    case File.read("input.txt") do
      {:ok, result} ->
        result

      {:error, reason} ->
        raise "There was an error reading the input: #{reason}"
    end
  end

  def part_one(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn assignment_pair ->
      assignment_pair
      |> String.split(",")
      |> Enum.map(fn assignment_range ->
        [start, finish] = assignment_range |> String.split("-")

        Range.new(String.to_integer(start), String.to_integer(finish))
      end)
    end)
    |> Enum.filter(fn [r1, r2] ->
      range1_mapset = MapSet.new(r1)
      range2_mapset = MapSet.new(r2)

      MapSet.subset?(range1_mapset, range2_mapset) || MapSet.subset?(range2_mapset, range1_mapset)
    end)
    |> Enum.count()
  end

  def part_two(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn assignment_pair ->
      assignment_pair
      |> String.split(",")
      |> Enum.map(fn assignment_range ->
        [start, finish] = assignment_range |> String.split("-")

        Range.new(String.to_integer(start), String.to_integer(finish))
      end)
    end)
    |> Enum.filter(fn [r1, r2] ->
      not Range.disjoint?(r1, r2)
    end)
    |> Enum.count()
  end
end

part_one =
  CampCleanup.read_input()
  |> CampCleanup.part_one()

part_two =
  CampCleanup.read_input()
  |> CampCleanup.part_two()
