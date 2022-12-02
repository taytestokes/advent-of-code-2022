defmodule ElfCalorieCalculator do
  def read_input do
    case File.read("input.txt") do
      {:ok, result} ->
        result

      {:error, reason} ->
        raise "There was an error reading the input: #{reason}"
    end
  end

  def structure_input_data do
    input_data = read_input()

    input_data
    |> String.split("\n\n")
    |> Enum.map(fn datum ->
      datum
      |> String.split("\n")
      |> Enum.reduce(0, fn item, acc ->
        acc + String.to_integer(item)
      end)
    end)
  end

  def find_elf_with_most_calories do
    data = structure_input_data()

    data
    |> Enum.reduce(0, fn datum, acc ->
      acc =
        if(datum > acc) do
          datum
        else
          acc
        end
    end)
  end

  def find_sum_of_top_three do
    data = structure_input_data()

    data
    |> Enum.sort(&(&1 > &2))
    |> Enum.take(3)
    |> Enum.sum()
  end
end
