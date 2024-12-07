import Foundation

class Day6Hard {
    struct Coord: Hashable {
        let x: Int
        let y: Int
    }
    
    enum Direction: Hashable {
        case up
        case right
        case down
        case left
        
        var rotate: Direction {
            switch self {
            case .up: return .right
            case .right: return .down
            case .down: return .left
            case .left: return .up
            }
        }
    }
    
    struct CD: Hashable {
        let c: Coord
        let d: Direction
    }
    
    enum ValidationResult {
        case valid
        case obstacle
        case outside
        case special
    }
    
    func solve() {
        let startTime = Date()
        var obstacleMap: Set<Coord> = .init()
        var guardCoord: Coord = .init(x: 0, y: 0)
        var guardDirection: Direction = .up
        var areaWidth: Int = 0
        var areaHeight: Int = 0
        var checkedCoords: Set<Coord> = .init()
        
        
        let text = input
        let lines = text.split(separator: "\n")
        
        areaWidth = lines[0].count
        areaHeight = lines.count
        
        for i in lines.indices {
            let line = lines[i].split(separator: "")
            
            for j in line.indices {
                let char = line[j]
                
                if char == "#" {
                    obstacleMap.insert(Coord(x: j, y: i))
                } else if char == "^" {
                    guardCoord = Coord(x: j, y: i)
                    guardDirection = .up
                } else if char == ">" {
                    guardCoord = Coord(x: j, y: i)
                    guardDirection = .right
                } else if char == "v" {
                    guardCoord = Coord(x: j, y: i)
                    guardDirection = .down
                } else if char == "<" {
                    guardCoord = Coord(x: j, y: i)
                    guardDirection = .left
                }
            }
        }
        let initialGuardCoord = guardCoord
        
        var validPaths = 0
        var isOk: Bool = true
        while isOk {
            let newCoord: Coord
            
            switch guardDirection {
            case .up:
                newCoord = .init(x: guardCoord.x, y: guardCoord.y - 1)
            case .right:
                newCoord = .init(x: guardCoord.x + 1, y: guardCoord.y)
            case .down:
                newCoord = .init(x: guardCoord.x, y: guardCoord.y + 1)
            case .left:
                newCoord = .init(x: guardCoord.x - 1, y: guardCoord.y)
            }
            
            let validationResult = validateCoord(
                newCoord,
                dir: guardDirection,
                width: areaWidth,
                height: areaHeight,
                obstacles: obstacleMap
            )
            
            switch validationResult {
            case .valid:
                if !checkedCoords.contains(newCoord), newCoord != initialGuardCoord {
                    checkedCoords.insert(newCoord)
                    if validatePath(obstacles: obstacleMap, specialObstacle: newCoord, guardCoord: guardCoord, guardDirection: guardDirection, width: areaWidth, height: areaHeight) {
                        validPaths += 1
                    }
                }
                guardCoord = newCoord
            case .obstacle:
                guardDirection = guardDirection.rotate
            case .outside:
                isOk = false
            case .special:
                continue
            }
        }
        print("time: \(Date().timeIntervalSince(startTime))")
        
        print(validPaths)
    }
    
    func validatePath(obstacles: Set<Coord>, specialObstacle: Coord, guardCoord: Coord, guardDirection: Direction, width: Int, height: Int) -> Bool {
        var guardCoord: Coord = guardCoord
        var visitedObstacles: Set<CD> = [.init(c: guardCoord, d: guardDirection)]
        var guardDirection: Direction = guardDirection.rotate
        
        while true {
            let newCoord: Coord
            
            switch guardDirection {
            case .up:
                newCoord = .init(x: guardCoord.x, y: guardCoord.y - 1)
            case .right:
                newCoord = .init(x: guardCoord.x + 1, y: guardCoord.y)
            case .down:
                newCoord = .init(x: guardCoord.x, y: guardCoord.y + 1)
            case .left:
                newCoord = .init(x: guardCoord.x - 1, y: guardCoord.y)
            }
            
            let validationResult = validateCoord(
                newCoord,
                dir: guardDirection,
                width: width,
                height: height,
                obstacles: obstacles,
                specialObstacle: specialObstacle,
                visitedObstacles: visitedObstacles
            )
            
            switch validationResult {
            case .valid:
                guardCoord = newCoord
            case .obstacle:
                visitedObstacles.insert(.init(c: newCoord, d: guardDirection))
                guardDirection = guardDirection.rotate
            case .outside:
                return false
            case .special:
                return true
            }
        }
    }
    
    func validateCoord(
        _ coord: Coord,
        dir: Direction,
        width: Int,
        height: Int,
        obstacles: Set<Coord>,
        specialObstacle: Coord? = nil,
        visitedObstacles: Set<CD>? = nil
    ) -> ValidationResult {
        if let visitedObstacles, visitedObstacles.contains(.init(c: coord, d: dir)) {
            return .special
        }
        
        if coord.x < 0 || coord.x >= width || coord.y < 0 || coord.y >= height {
            return .outside
        }
        
        if obstacles.contains(coord) {
            return .obstacle
        }
        
        if specialObstacle == coord {
            return .obstacle
        }
        
        return .valid
    }
    
    let easyInput: String = """
    ....#.....
    .........#
    ..........
    ..#.......
    .......#..
    ..........
    .#..^.....
    ........#.
    #.........
    ......#...
    """
    
    let input: String = """
    ............#...........................................#.......#.............#...........#.......................................
    ..........#....................#.........................................#............#............#.....##...................#...
    .#.........#..........#.....#......##...............................................................#..................#..........
    ...........#.#...................#..................#.......................#........#............#...............................
    ...#..........................#............................#..................#..................#..........##..................#.
    ..............................................................................#...................................#..........#.#..
    .#......##........#.........#...........#...............................#...................#........#..#............#.........##.
    .....................................#...................................................................#........................
    ......................#......................#.............................................#......................................
    ....................................................#...........#........................#...................#......#.#.........##
    ..................#..#..........#...........................#.#..........#.......##....................#.#....#..#................
    ............#...#..........................#.............................................................................#........
    ...............................#.............#.........#..........................................................................
    .....#......#........#.#...............#.........................#.......#.......#.........................#......................
    ...#....#........................##.................#..#...............................#..........#...............................
    ..........#......#..............................................................#...................#..........#.........#.#......
    #.............#.........#.................................#....................#....................#......................#......
    ....#.............................................#..................#.........#...#................#........#....#..........#....
    .......#......................................#.......#..........................................................#................
    ...#..#..............#.........#......#...........................................#..............................###.....#........
    ......................................................#........#..............................#..................#................
    .......................................#.....#.........................................................................#..........
    ...........................#...........#....................................#.........#...........................................
    ....#........#...................................................................#...................................#............
    ....#..#.................................................#........................#...............................................
    ............................................................##..#......................#.......#...........#..#........#..........
    ........#.........................................................................................................................
    ............#......#.........#...............##...............................#......#......................#......#..............
    .#......#...............................................#.#........................#....#.....#..#................##..............
    .........#.....#.............#.........#.............................#.................#.........##.......#.......................
    ...#..............................................................................#....................#..........................
    .#...#.....#..............#.................................................#..............................................#......
    ....................................................#...#..................................................................#......
    ..............#................#.......................................................................#.........#................
    ...........#..............................#.....#.........#..#............................#.......................................
    .........................#............#..................................#...#.....#......#.......................................
    ..........#......................#...#....#......#.....................#..................................#.....#........#........
    .............#...#........#.........................................#..#........................................................#.
    .....#...............#......#.........##.....#.......................#..............#....................................#...#....
    .....................#..........................................................................................#.............#...
    .................#.............#..............##...................................................#..............................
    ..................................#.......#.......................................#...........#...................................
    ...#..............#............................#.#................................................................................
    ..........#.......#...........................#...........................#..............................#....................#...
    .....#...#...#.................#..........................................................#............#.....................#.#..
    ...#...#......#.............#...............................................................................#...##................
    ..........#.....#.......#............#........................#..........................................#.............#..........
    ..................................................#.................#.........................#.#.......#.........................
    .............................#...............................#.#............#................#...................#...............#
    ..#...........#........................#............................................#...........#............#....................
    .......................#...#...........................#............#..#..#............#..#..............................#........
    .......#...........#...............#.............................................................................#................
    ...........................#................................#....#....#...#..................#...................#.#..........##..
    ...#.#.......................................................................................#.....#..........#..........#........
    ....#......#.......................................................#.......#.#............................#.......................
    .#.................#...#........#...#...........................#...#.................^......#............#.......................
    ...........#................##..........................................................................#.........................
    ...........................................................#....#............................#........#...........................
    .#......#....#..#.......#....................#...............................................#........#...........................
    ......................##..............##.......................#...#...............#........................#................#....
    #..................................................................................................#..........#...................
    .....................#...................................................................................#............#.....#.....
    ..........................##.#............................................#........#.#.......#.#....#...#.........................
    ....#...............#.................................................................................#..#...........##...........
    .................................................................#.#.....#.........#...............#..............................
    .......................................................#.......#.........#............#....#..........#.....................#.....
    #..............................................#..#..................#....................#.......................#....#....#.....
    ................#...............#..............................................................#....#...........................#.
    .#...............#..#....................#...........................................#............................................
    ................................#...........................................#.........................#..#........................
    .......#......#........................................#....................................................#.....................
    .#......................#........................#...............#......................#...........#.............................
    ........#.......#..................#.......................#.........#.....................................................#.....#
    ..................#.....................#...#..........................................................#.............#............
    ....#........................#......#...#.....................#....##.........#...................................................
    ......................#....................#....................................................#..........#..................#...
    .......#..........#.....................#.................................................#.......................................
    ....................#.......................................................#....##...................................#...........
    ................................#.............................................#.....#..............#..............................
    ..#.....#.......#..................................#........................#.....................................................
    ...##........#.#........#.........................................#..............#......................................#.........
    ........................................................................................#.........................................
    .......................#......#...........................................................................#.......................
    .........#...................#.............................................................#.........#............................
    ..........................#.................................................#................#...................................#
    ...............................#......................................#.........................#....#......#................#....
    ..........#.......................................................................................................................
    ....#......#.#.................#.#.......#.........#...#................#...............#..............#.....................#....
    ....#.........#....#................#..........#........#...................#.............#...............#..........#...#........
    ................#...............#.....#.....#...........#....#....................#.....#...................#.....................
    .......................#.......................#...........................................................#.....................#
    #.................................................................................................#...............................
    .........................................##..#........#............................#............#........................#........
    ....................#...............#............#................................................................................
    ...#................#............#..............................................................#.#.................###...........
    ......#...........................#.......#....#...............#....................................................#.....#.......
    ..#.......##.....................#................#.....................................................#.#......................#
    .................................................................#.................................##.............................
    ....#..............................................#................................................................#....#........
    ................#................................................#..............................................#...#...........#.
    ...................................##...............................................................................#.............
    ............#.................#..#.........................#..........................#.......#...................................
    .......##........#.#...#......................................#..............#...............................#.............#......
    ............#.............................................##..............................#............................#..........
    .................................................#..........................#.........#...#...............................#.......
    ..#............#......................#.....................................#.....##.........................#....................
    ...........#......#............#...................#.......................#..##........................................#.........
    .................................##......#.........#.......#..................##...............#..................................
    ........#.........#...##.........#.#......#.........#.......#.....#.......................#.......................................
    ..................................#..............#................#.....#..............##...............#.........................
    ................#..........................................#..#.......#....................................#......................
    ..................................................#...........#..........................#.................#......................
    .........#....................................................#..........#........................................#...............
    ..........................#..............................................#.................................................#......
    ...#....................................#.......................#.#.......#............##........#........................#.......
    ...#..................................#.....#...........................................................#...#........#............
    ................#...........#.........................................................#...............#....................#....#.
    .................#...........#..............................#..........#........#............................#..........#.........
    .........#.............................................#..........#....#.................#...................#...#................
    ......#....................#.................#.......#..............#............................#..#.......................#...#.
    #.....#..........................#.....#...................................#...##.....#.....#...........#................#......#.
    .##................#.........#.........#...#.#....................................................................................
    .............................................................#..#...............#..#...............#.....#....#.............#..#..
    .............#.........#.......#....#.........#...#......#........#.............................#.................................
    #.....................................#.......#..................#..................#............#...#......#.........#...........
    .......##............#.............#..............#.....#........#.................#..#..........#......................#..#......
    ......#......#.............#....#...............#.......#....................##.................................................##
    ...............#........#........#........................#.#........#.............#...................................#...##.....
    ................#........................#.......#......#..........................#................#............#...#....#.......
    #.................#.....................#..........#.....................#...................##..........................#........
    """
}
