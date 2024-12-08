import Foundation

class Day8Hard {
    struct Location: Hashable {
        let x: Int
        let y: Int
    }
    
    struct Antena {
        let frequency: Character
        let location: Location
    }
    
    func solve() {
        let text = input
        let lines = text.split(separator: "\n")
        
        let height = lines.count
        let width = lines[0].count
        
        var frequencies: Set<Character> = []
        var antinodes: Set<Location> = []
        
        let antenas: [Antena] = lines.enumerated().flatMap { (y, line) in
            line.enumerated().compactMap { (x, character) in
                guard character != "." else { return nil }
                frequencies.insert(character)
                return Antena(frequency: character, location: Location(x: x, y: y))
            }
        }
        
        // Iterate over antenas with same frequency
        for frequency in frequencies {
            let frequencyaAntenas = antenas.filter { $0.frequency == frequency }
            
            // Get each combination of the same frequency antenas to calculate the antinodes
            for i in 0..<frequencyaAntenas.count {
                for j in i+1..<frequencyaAntenas.count {
                    let antenna1 = frequencyaAntenas[i]
                    let antenna2 = frequencyaAntenas[j]
                    
                    antinodes.insert(antenna1.location)
                    antinodes.insert(antenna2.location)
                    
                    let difX = antenna2.location.x - antenna1.location.x
                    let difY = antenna2.location.y - antenna1.location.y
                    
                    var k = 1
                    while true {
                        let antinodeLocation = Location(x: antenna1.location.x - k * difX, y: antenna1.location.y - k * difY)
                        if locationIsValid(antinodeLocation, width: width, height: height) {
                            antinodes.insert(antinodeLocation)
                        } else {
                            break
                        }
                        k += 1
                    }
                    
                    k = 1
                    while true {
                        let antinodeLocation = Location(x: antenna2.location.x + k * difX, y: antenna2.location.y + k * difY)
                        if locationIsValid(antinodeLocation, width: width, height: height) {
                            antinodes.insert(antinodeLocation)
                        } else {
                            break
                        }
                        k += 1
                    }
                }
            }
        }
        
        print(antinodes.count)
    }
    
    func locationIsValid(_ location: Location, width: Int, height: Int) -> Bool {
        location.x >= 0 && location.x < width && location.y >= 0 && location.y < height
    }
    
    let easyInput: String = """
    ............
    ........0...
    .....0......
    .......0....
    ....0.......
    ......A.....
    ............
    ............
    ........A...
    .........A..
    ............
    ............
    """
    
    let input: String = """
    .E..........m..0N.........f.......................
    ........N........P0...............................
    .......j..................................F.......
    ........1j............P........................C..
    ...........................3..K......f..........E.
    ...........V...y...0.....................F........
    1.......j.....P....y.N.......................F....
    ....................m...................C.........
    ..L......P....p..................w.m..............
    ............E......p..AU........8......f..........
    ..............C...............w....d..............
    j1...............E..........3.........f........w..
    .................p...A..........3.................
    .................3..p........KU...w..r..F.........
    7.........y........8.......................r......
    ........y..u......K...............................
    ...1..................8....C...K..................
    ...........h.......................6..............
    ......................U.........A.r..t........6...
    ...........5.........8..c.........................
    .................U................t...............
    .....L...O...................t.............d......
    .........7........................................
    ......L..H...c.....9....t.................6.......
    ...........................c.M..................4.
    .....R..7...O.....................................
    .......................9......................d...
    ..................................................
    .........L..9...R..........................6c.....
    ..M.....T.5.................................d.....
    .......5OR...................T....................
    .......D......o.........v...................r.....
    ...u....o.........5...............................
    .......WR.....Y...........................e...4...
    T............O......M..................4..a.......
    .Y...................M............................
    ........W..D...............oh............e........
    .......7......Do...................A...e.......4..
    .W...Y..D........................h...v..........e.
    ..........V.....9.l.......h.......a.........n..v..
    .......................H.....a2...................
    ..................................................
    ...V............Y....J..H2................vn......
    ..............................H2.................n
    ................V..........l...........k..........
    .T..u........................J...ak...............
    ..................J.....l.........................
    .................l................................
    ......u.........................................n.
    ......................J..k............2...........
    """
}
