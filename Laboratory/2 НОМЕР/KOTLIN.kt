import java.util.*

fun main() {
    print("Enter the rings configuration: ")
    val rings = readLine()!!
    println("Number of full pegs: ${countFullPegs(rings)}")
}

fun countFullPegs(rings: String): Int {
    val pegs = HashMap<Char, HashSet<Char>>()

    for (i in rings.indices step 2) {
        val color = rings[i]
        val peg = rings[i + 1]

        if (!pegs.containsKey(peg)) {
            pegs[peg] = HashSet()
        }
        pegs[peg]?.add(color)
    }

    var fullPegCount = 0
    for (colors in pegs.values) {
        if (colors.size == 3) {
            fullPegCount++
        }
    }

    return fullPegCount
}