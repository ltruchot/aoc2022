package fr.o80.aoc.day01

import arrow.optics.*;

class Day01 {

    fun parse1(input: String): List<String> =
        input.lines()

    fun part1(parsed: List<String>): String =
        splitWhen(parsed) { it === "" }
            .map { mapToInt(it).sum() }
            .max()
            .toString()

    fun parse2(input: String): List<Int> {
        TODO()
    }

    fun part2(parsed: List<Int>): Int {
        TODO()
    }

    fun mapToInt(list: List<String>) =
        list.map { it.toInt()}

    fun <T>splitWhen (list: List<T>, predicate: (cur: T) -> Boolean): List<List<T>> {
        val lastInListLens = lastInMatrix2<T>();
        return when (list.size === 0) {
            true -> listOf<List<T>>()
            false -> list
                .fold(listOf<List<T>>(listOf<T>())) { acc, cur ->
                    when (predicate(cur)) {
                        true -> lastInListLens.set(acc, listOf())
                        false -> lastInListLens.modify(acc) {
                            val last = it.toMutableList()
                            last.add(cur)
                            last.toList()
                        }
                    }
                }
        }
    }

    private fun <T>lastInMatrix2(): Lens<List<List<T>>, List<T>> =
        Lens(
            get = { list -> list.last() },
            set = { list, value ->
                val mutableList = list.toMutableList()
                if (value.size !== 0) {
                    mutableList.removeLast()
                }
                mutableList.add(value)
                mutableList.toList()
            }

        )
}
