package fr.o80.aoc.day01

class Day01 {

    fun parse1(input: String): List<List<Int>> =
        input
            .split("\n\n")
            .map { it.split("\n").map { it.toInt()} }

    fun part1(parsed: List<List<Int>>): String =
        parsed
            .map{ it.sum() }
            .max()
            .toString()

    fun parse2(input: String): List<Int> {
        TODO()
    }

    fun part2(parsed: List<Int>): Int {
        TODO()
    }

}
