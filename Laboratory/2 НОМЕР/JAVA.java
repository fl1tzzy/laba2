import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter the rings configuration: ");
        String rings = scanner.nextLine();
        System.out.println("Number of full pegs: " + countFullPegs(rings));
    }

    public static int countFullPegs(String rings) {
        Map<Character, Set<Character>> pegs = new HashMap<>();

        for (int i = 0; i < rings.length(); i += 2) {
            char color = rings.charAt(i);
            char peg = rings.charAt(i + 1);

            if (!pegs.containsKey(peg)) {
                pegs.put(peg, new HashSet<>());
            }
            pegs.get(peg).add(color);
        }

        int fullPegCount = 0;
        for (Set<Character> colors : pegs.values()) {
            if (colors.size() == 3) {
                fullPegCount++;
            }
        }

        return fullPegCount;
    }
}