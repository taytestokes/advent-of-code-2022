defmodule Rutsack do
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
    |> Enum.map(fn line ->
      line_length = String.length(line)

      line
      |> String.split("", trim: true)
      |> Enum.split(div(line_length, 2))
    end)
    |> Enum.map(fn {left, right} ->
      hd(left -- left -- right)
    end)
    |> Enum.map(fn character ->
      char_codepoint = character |> String.to_charlist() |> hd

      cond do
        char_codepoint in ?a..?z ->
          char_codepoint - ?a + 1

        char_codepoint in ?A..?Z ->
          char_codepoint - ?A + 27
      end
    end)
    |> Enum.sum()
  end

  def part_two(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      line
      |> String.split("", trim: true)
    end)
    |> Enum.chunk_every(3)
    |> Enum.map(fn group ->
      [one, two, three] = group

      four = one -- one -- two
      hd(four -- four -- three)
    end)
    |> Enum.map(fn character ->
      char_codepoint = character |> String.to_charlist() |> hd

      cond do
        char_codepoint in ?a..?z ->
          char_codepoint - ?a + 1

        char_codepoint in ?A..?Z ->
          char_codepoint - ?A + 27
      end
    end)
    |> Enum.sum()
  end
end

part_one = Rutsack.read_input() |> Rutsack.part_one()
part_two = Rutsack.read_input() |> Rutsack.part_two()
