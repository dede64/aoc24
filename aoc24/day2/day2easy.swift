//
//  day2easy.swift
//  aoc24
//
//  Created by Dan Ridzon on 02.12.2024.
//

import Foundation

class Day2Easy {
    func solve() {
        let lines = input.split(separator: "\n")
        var correctLines: Int = 0
        
        for line in lines {
            let numbers = line.split(separator: " ").map { Int($0)! }
            var differences: [Int] = []
            for i in 0..<(numbers.count - 1) {
                differences.append(numbers[i + 1] - numbers[i])
            }
            
            var isIncreasing: Bool = true
            var isDecrasing: Bool = true
            for difference in differences {
                if difference > 3 || difference < -3 || difference == 0 {
                    isDecrasing = false
                    isIncreasing = false
                }
                
                if difference > 0 {
                    isIncreasing = false
                } else if difference < 0 {
                    isDecrasing = false
                }
            }
            
            if isIncreasing || isDecrasing {
                correctLines += 1
            }
        }
        
        print(correctLines)
    }
    
    let easyInput: String = """
        7 6 4 2 1
        1 2 7 8 9
        9 7 6 2 1
        1 3 2 4 5
        8 6 4 4 1
        1 3 6 7 9
    """
    
    let input: String = """
        11 12 15 18 19 18
        84 86 88 89 92 92
        18 19 21 23 24 25 29
        56 59 60 61 63 66 73
        11 13 15 13 15
        36 38 36 39 42 43 40
        21 22 23 21 21
        35 37 38 39 37 41
        56 58 55 57 58 60 61 68
        77 78 80 80 83 85 88 89
        79 81 82 82 83 80
        89 90 91 91 91
        69 71 73 73 76 78 82
        2 4 5 8 8 13
        60 63 67 70 72 73 74 75
        15 16 18 22 19
        18 21 25 28 31 31
        58 61 65 66 67 71
        50 53 56 58 61 63 67 74
        51 54 56 58 59 62 67 70
        78 81 82 84 90 89
        62 64 65 71 73 73
        68 71 76 79 81 85
        23 25 30 32 34 36 37 44
        68 66 67 69 72 73 76
        52 51 54 56 59 58
        26 24 25 27 29 31 32 32
        80 78 80 83 85 89
        4 1 2 5 8 10 17
        11 8 9 10 9 12 13 14
        32 30 29 30 31 28
        89 87 84 87 89 90 91 91
        50 47 44 45 49
        11 9 10 9 12 14 16 21
        35 33 34 37 37 38
        29 27 30 30 27
        23 22 22 23 25 28 31 31
        88 87 90 93 94 94 98
        18 15 17 17 18 20 22 29
        46 45 47 49 53 55
        55 52 54 58 55
        73 71 73 75 78 82 85 85
        54 51 53 56 59 63 67
        37 36 39 42 46 47 52
        56 53 60 63 66
        76 73 78 79 78
        61 58 59 66 67 68 69 69
        42 41 44 47 48 50 55 59
        53 50 57 58 65
        10 10 11 13 16 18 21 24
        14 14 16 19 20 21 18
        93 93 95 98 98
        86 86 87 89 93
        35 35 37 39 41 43 45 52
        15 15 17 18 20 17 20
        77 77 76 79 80 82 80
        43 43 42 45 45
        81 81 80 81 84 86 90
        76 76 78 80 82 80 82 88
        86 86 89 89 91
        25 25 28 28 30 27
        93 93 94 95 95 95
        2 2 2 5 9
        57 57 58 61 61 67
        45 45 49 51 52
        3 3 6 10 12 14 11
        50 50 52 53 57 60 60
        67 67 69 71 75 76 80
        12 12 14 18 20 25
        67 67 68 75 77
        44 44 49 51 48
        41 41 47 50 52 52
        56 56 59 66 70
        9 9 11 14 20 27
        41 45 47 48 50
        52 56 59 60 63 65 68 67
        19 23 24 26 28 31 31
        62 66 69 70 71 72 76
        20 24 27 28 29 35
        30 34 35 34 37 39 41
        5 9 7 8 7
        34 38 37 39 42 42
        10 14 17 18 20 19 20 24
        62 66 68 71 73 70 73 78
        78 82 83 83 86 87
        60 64 65 67 68 68 66
        63 67 70 71 71 71
        60 64 66 66 70
        21 25 28 28 33
        29 33 36 40 43 46
        74 78 80 84 87 86
        40 44 45 49 52 52
        37 41 45 48 52
        33 37 40 44 46 47 52
        9 13 19 20 21
        61 65 67 73 74 75 78 75
        72 76 77 83 84 84
        65 69 71 76 77 81
        47 51 58 59 60 65
        18 25 26 29 31
        70 75 76 78 80 82 79
        45 50 53 54 56 57 59 59
        79 86 88 90 94
        14 19 21 23 29
        47 52 54 57 54 57
        50 57 58 60 63 60 61 60
        24 29 30 29 31 33 33
        12 18 19 20 18 21 25
        56 62 60 63 65 67 69 76
        8 14 14 15 16
        50 56 56 59 56
        81 86 86 87 89 89
        29 34 36 36 40
        43 49 49 50 51 56
        74 81 82 83 84 86 90 92
        35 42 43 44 48 46
        69 74 77 79 83 83
        30 35 39 40 42 46
        42 47 48 50 54 56 63
        65 71 77 78 80
        15 20 21 27 25
        27 32 34 39 39
        65 72 78 80 81 82 84 88
        49 54 57 62 65 66 73
        99 98 97 95 93 91 92
        22 21 20 19 16 15 13 13
        63 60 58 56 53 50 47 43
        29 28 25 22 17
        42 41 40 39 42 41
        92 89 90 87 85 88
        26 24 23 25 25
        69 68 66 64 67 63
        67 66 67 66 61
        67 66 66 64 62
        65 63 63 60 61
        78 77 75 72 72 72
        14 12 9 8 8 4
        77 74 74 71 70 64
        93 91 89 85 84 83
        77 76 74 72 70 69 65 67
        61 58 54 53 50 48 47 47
        30 27 25 24 20 16
        23 20 18 16 13 9 4
        44 42 39 38 35 34 27 24
        22 20 17 15 10 13
        25 22 19 12 10 10
        29 28 27 24 19 15
        43 41 34 32 30 27 22
        92 93 92 89 86
        39 42 41 39 37 35 33 35
        88 91 89 86 84 82 82
        18 21 19 17 15 12 10 6
        88 89 87 85 83 80 78 73
        98 99 97 98 97
        23 24 21 22 20 18 19
        59 60 57 59 58 58
        25 27 25 26 22
        47 49 47 44 46 41
        32 34 34 33 31
        90 92 89 89 86 88
        98 99 97 95 93 93 90 90
        14 17 16 16 15 14 12 8
        84 87 84 84 83 76
        36 37 36 32 31 30 29 27
        63 65 61 58 57 56 55 58
        15 18 16 14 10 8 8
        92 94 91 90 88 84 80
        91 93 90 86 84 82 76
        58 59 57 56 51 48 46
        69 71 65 62 60 57 58
        93 95 94 92 90 83 83
        45 46 44 41 36 35 31
        48 49 46 44 38 31
        96 96 95 94 93 92 90 87
        54 54 53 50 48 49
        40 40 39 38 38
        57 57 56 54 52 51 50 46
        44 44 43 40 37 36 33 28
        19 19 16 13 11 9 10 8
        43 43 46 43 41 43
        92 92 89 88 87 89 89
        14 14 13 15 11
        62 62 64 62 61 54
        56 56 55 53 51 48 48 46
        72 72 71 69 69 70
        70 70 68 68 68
        73 73 71 71 70 68 66 62
        70 70 70 68 61
        14 14 11 7 4
        49 49 47 43 45
        39 39 36 32 30 27 25 25
        26 26 25 24 20 16
        25 25 21 18 16 11
        28 28 27 24 21 19 12 11
        18 18 13 11 10 9 11
        40 40 33 31 29 26 26
        37 37 35 29 27 23
        81 81 78 71 65
        72 68 66 65 64 61 60 59
        66 62 59 57 56 58
        25 21 19 17 14 11 10 10
        47 43 41 40 36
        41 37 34 31 29 22
        11 7 6 7 4 3 2
        76 72 69 71 68 66 64 67
        78 74 71 74 72 72
        62 58 57 58 54
        74 70 71 69 66 63 57
        49 45 45 43 41 38 37
        32 28 27 25 23 23 26
        26 22 19 19 19
        86 82 81 81 77
        23 19 18 18 11
        38 34 32 30 27 25 21 18
        63 59 55 52 53
        24 20 17 16 15 11 8 8
        18 14 11 10 6 2
        60 56 55 53 49 42
        75 71 64 63 60
        33 29 27 22 25
        38 34 29 28 27 25 24 24
        27 23 16 13 11 7
        82 78 77 74 69 64
        54 48 45 42 41 39 36
        99 92 90 89 87 86 89
        78 73 71 70 69 66 65 65
        53 46 44 42 39 35
        51 44 41 39 36 34 27
        24 19 18 19 16
        27 20 18 21 19 21
        39 34 33 35 35
        55 50 51 49 47 43
        26 20 19 22 19 12
        34 28 27 27 26 24 23 20
        78 71 70 68 65 65 68
        60 54 51 51 51
        89 83 83 82 80 78 74
        28 22 20 20 15
        17 10 9 5 3
        24 19 16 15 13 9 10
        43 37 33 31 30 28 27 27
        23 16 13 10 6 2
        87 80 77 73 71 70 63
        27 21 15 13 10
        24 19 14 12 9 12
        54 48 45 38 38
        63 58 53 51 47
        30 23 20 17 12 5
        72 74 76 79 77
        90 91 94 95 96 98 98
        44 45 47 48 49 51 55
        71 72 75 76 79 85
        26 28 31 34 33 34
        2 5 6 3 1
        9 10 11 8 10 10
        63 64 66 64 67 71
        68 69 72 75 77 80 77 84
        47 48 48 49 52
        76 79 81 83 83 80
        55 58 59 59 60 63 63
        6 8 8 11 12 15 17 21
        15 16 17 17 19 22 25 31
        40 43 45 49 51 53
        82 84 85 86 88 92 89
        63 65 66 67 70 74 74
        29 31 33 34 36 40 44
        69 71 72 76 78 83
        76 79 82 87 88 89 90 92
        70 73 76 77 84 85 88 85
        10 13 15 16 17 24 24
        47 48 50 55 58 60 62 66
        1 3 5 6 8 13 20
        47 45 48 49 52 53
        65 63 64 66 68 69 70 68
        51 50 51 53 55 55
        41 40 41 44 48
        63 61 62 63 64 67 73
        9 8 6 8 10
        71 70 71 72 69 66
        60 59 61 62 64 66 65 65
        89 87 89 88 92
        96 93 91 92 97
        77 74 77 80 80 83 86 87
        64 63 66 68 68 69 70 69
        23 22 25 27 27 27
        15 13 16 16 17 21
        85 82 82 83 85 86 91
        7 4 8 10 12
        65 64 65 69 67
        3 1 5 8 9 11 13 13
        83 81 85 86 90
        81 78 80 84 86 89 92 98
        50 49 52 53 59 62 64
        70 67 70 73 78 75
        42 41 44 45 52 54 56 56
        50 48 49 54 58
        41 40 42 43 49 52 53 58
        46 46 49 51 53 54
        85 85 87 88 85
        2 2 3 6 8 9 11 11
        71 71 74 77 79 80 84
        78 78 80 83 84 90
        53 53 56 58 61 64 61 64
        86 86 85 88 91 89
        62 62 59 61 64 64
        45 45 46 49 52 51 53 57
        55 55 56 58 57 62
        83 83 86 86 89
        58 58 58 61 59
        86 86 89 91 93 94 94 94
        63 63 63 65 66 68 72
        19 19 21 22 23 26 26 31
        5 5 6 10 11 14 15 16
        33 33 35 39 42 43 41
        27 27 29 30 31 35 38 38
        31 31 35 36 40
        61 61 62 64 67 71 77
        49 49 52 53 58 59 61
        58 58 61 63 68 66
        23 23 26 31 34 37 37
        7 7 9 12 17 21
        36 36 39 46 53
        71 75 76 77 80 83 86 89
        59 63 66 69 71 68
        32 36 37 38 41 44 47 47
        70 74 75 77 81
        78 82 83 86 89 96
        64 68 70 68 71 72 75 78
        35 39 41 42 43 41 44 42
        87 91 92 93 94 97 95 95
        38 42 41 44 48
        48 52 51 53 59
        29 33 36 39 39 40 41 42
        80 84 85 86 86 84
        11 15 16 19 19 19
        64 68 68 70 72 73 77
        2 6 8 8 9 10 17
        33 37 40 42 46 49 52
        72 76 78 82 83 85 83
        41 45 47 51 53 53
        62 66 70 71 74 78
        30 34 36 39 43 48
        65 69 71 78 79 82 85 87
        5 9 14 15 14
        34 38 43 46 47 50 50
        75 79 84 87 91
        68 72 75 80 87
        81 88 90 92 94 96 97
        61 68 70 72 75 78 79 78
        85 90 92 95 96 96
        31 37 39 42 43 47
        1 7 9 11 12 18
        38 45 47 45 47
        76 83 82 85 88 85
        88 94 96 94 94
        1 8 10 7 8 11 12 16
        46 51 52 51 52 57
        31 37 40 43 44 47 47 49
        36 42 42 43 45 42
        35 42 43 43 46 47 49 49
        53 60 60 62 64 66 70
        4 11 11 13 18
        82 89 93 96 97 99
        32 38 40 41 42 46 47 46
        74 79 80 84 87 89 90 90
        35 40 44 47 51
        77 83 85 89 94
        6 12 19 21 22 25
        67 72 73 80 82 83 85 84
        31 36 37 43 46 49 50 50
        1 6 7 8 14 17 21
        5 11 13 19 22 25 28 35
        57 54 52 49 48 50
        23 22 19 17 15 12 10 10
        12 11 9 8 4
        48 45 44 41 40 37 35 30
        63 61 62 61 60
        57 55 53 55 57
        59 58 56 59 59
        46 44 46 43 42 40 38 34
        40 39 38 36 38 33
        67 64 64 61 58
        54 53 53 50 47 48
        96 95 95 94 94
        30 29 27 24 24 20
        77 74 74 73 68
        73 71 67 64 61
        39 37 34 30 28 26 29
        24 23 21 17 15 15
        68 67 63 60 59 55
        31 29 28 25 23 19 18 13
        57 54 53 46 44 43 40
        48 46 39 36 38
        85 82 77 74 74
        93 92 90 89 86 79 75
        55 52 50 48 47 42 36
        78 79 76 75 74 73 72 69
        63 64 62 61 60 62
        33 34 33 31 29 29
        59 61 60 59 55
        70 71 70 67 66 63 57
        39 42 41 40 37 39 37 35
        9 11 10 7 9 6 7
        60 63 60 59 60 60
        66 69 66 68 64
        80 83 80 83 82 80 75
        38 41 41 40 38 37
        42 43 43 40 37 34 37
        64 65 65 63 63
        35 38 36 33 32 29 29 25
        11 13 11 11 10 9 4
        90 92 88 85 83 80 78
        41 42 39 35 32 31 28 29
        95 98 94 92 90 89 86 86
        14 17 14 10 8 4
        55 57 55 53 49 48 45 39
        86 87 82 81 79 76
        76 78 75 74 67 70
        87 89 83 81 81
        45 48 43 40 36
        87 90 88 87 80 75
        12 12 11 8 7 4 3 2
        20 20 17 14 17
        88 88 85 82 80 77 75 75
        12 12 11 8 4
        38 38 35 34 32 29 26 19
        98 98 99 97 95
        99 99 97 98 95 93 91 92
        23 23 20 18 17 20 20
        72 72 71 74 72 68
        87 87 88 87 84 79
        85 85 84 81 81 80 79 78
        71 71 68 67 67 69
        88 88 85 82 82 82
        56 56 53 50 50 46
        98 98 95 93 93 88
        40 40 36 34 32 29
        49 49 46 42 40 38 39
        82 82 79 76 72 71 71
        40 40 36 35 32 28
        89 89 85 84 78
        37 37 31 30 27 24 23
        9 9 8 2 5
        98 98 93 91 89 89
        57 57 56 50 46
        54 54 51 45 40
        72 68 65 62 59 56 55 54
        91 87 85 83 81 79 81
        31 27 25 24 22 20 20
        37 33 30 27 25 22 20 16
        22 18 17 16 9
        46 42 41 40 38 35 37 36
        66 62 60 57 55 57 59
        76 72 70 71 70 68 68
        80 76 74 73 75 73 71 67
        64 60 57 60 57 54 53 46
        87 83 82 82 79 78
        23 19 17 16 16 15 16
        35 31 31 30 28 25 24 24
        44 40 40 38 36 32
        21 17 14 14 11 10 9 3
        93 89 87 86 82 79
        57 53 49 46 44 45
        56 52 51 47 46 44 44
        80 76 74 71 67 63
        49 45 41 38 31
        69 65 63 56 55
        25 21 19 17 10 9 7 8
        82 78 72 71 68 66 66
        65 61 55 52 51 50 46
        19 15 14 8 7 1
        88 83 80 78 77
        82 75 74 73 75
        28 22 19 18 15 12 12
        51 44 41 40 37 35 31
        93 87 84 83 80 79 78 72
        93 87 84 83 81 83 81
        60 54 51 49 46 43 46 49
        58 53 52 53 51 51
        84 79 78 81 78 77 73
        25 20 19 22 20 18 16 10
        76 69 67 67 65
        28 23 21 21 18 21
        44 39 39 36 34 32 30 30
        39 33 30 27 27 24 20
        86 79 79 78 75 68
        22 17 16 14 10 8
        78 71 70 67 63 61 64
        47 42 41 40 36 34 34
        42 36 33 30 26 23 19
        71 65 61 59 52
        76 69 66 63 57 55
        83 76 74 72 65 64 63 65
        34 29 28 22 20 20
        60 54 53 47 43
        53 47 46 44 38 35 33 26
        24 24 25 25 26 29 36
        46 50 51 54 56 55 55
        37 33 30 28 24 21 23
        46 44 41 38 35 31
        33 32 30 27 21 18 17 20
        32 35 35 38 41
        45 45 49 52 55 58 57
        73 75 74 68 66 64 66
        59 55 53 51 48 48 48
        74 71 69 67 65 65
        60 63 64 64 66 70
        88 85 84 85 88 90
        44 41 39 38 36 32 31 31
        62 66 69 70 76 78 76
        8 10 13 15 16 13 12
        80 80 77 73 72 69 68 63
        61 60 57 51 51
        35 32 33 34 37 39 45 47
        27 24 24 22 21 21
        78 71 69 71 71
        43 38 35 31 28 27 24 20
        2 6 9 11 15 18 24
        75 75 78 75 78 79 83
        81 77 76 69 62
        1 2 3 7 9
        33 37 40 43 46 49
        35 31 28 27 29 27 24 26
        75 73 70 70 63
        99 93 91 89 86 88 86
        77 73 70 70 68 67 63
        73 77 79 81 83 87
        86 83 86 89 94 94
        66 72 75 77 80 77 77
        45 41 41 40 34
        80 83 84 81 78 75 71
        31 26 24 24 22
        25 24 22 20 18 20 19 12
        51 52 51 54 53
        77 81 82 85 86 91 94
        22 27 30 31 32 34 37 37
        32 36 37 40 43 41
        93 90 87 86 84 81 80 78
        61 64 66 69 71 74 76
        12 9 8 7 5
        19 17 15 12 9 6 4 3
        69 68 65 63 62
        86 87 90 91 92
        72 70 69 66 63
        89 88 86 85 84 82 79 76
        33 35 38 39 41
        74 73 70 68 66
        54 53 52 49 48 47 44 42
        65 63 61 59 56 53 51 50
        47 46 45 44 41 39 38 35
        97 95 92 89 86 84 83 81
        33 36 38 41 44 45
        11 13 14 17 20
        47 46 45 42 41
        57 54 52 50 48 46 44
        80 82 85 86 89 92
        5 6 7 9 10 13
        48 50 53 55 57 58 61
        27 26 23 21 18
        64 63 61 60 57 54 53
        31 30 29 28 26
        94 93 90 88 86 85
        8 9 10 11 13
        10 8 7 4 3
        74 71 68 67 64 61 60
        65 63 60 58 57 56 54 52
        91 89 88 85 83 80
        39 41 44 45 46 49 51
        18 19 22 24 25 27 30
        92 89 87 84 82
        52 55 57 58 60 62
        29 32 35 38 40 42 44
        60 59 56 54 52 49 47 45
        56 55 53 51 49 47 44 42
        11 12 15 18 20 21
        29 28 26 25 23
        31 32 34 37 40 43 45 48
        17 20 22 23 26 29
        78 75 72 71 70 67 65 62
        40 41 44 46 47 48
        42 39 37 35 33 30 29 28
        40 42 44 45 46 49 50 51
        32 29 27 24 23 20 17 15
        17 15 13 10 8 7 6 4
        66 67 68 70 73 76
        18 20 21 23 24 25 28
        84 81 79 76 73 72
        31 29 27 25 23 20 17
        47 45 43 40 39
        72 74 75 77 80 81
        79 82 83 84 85 86 87 89
        18 16 15 14 12 10 9 8
        97 95 94 91 88 85 83 82
        86 87 88 89 92 95
        64 62 61 59 58 55
        29 32 35 36 37 39 41
        78 77 74 71 69 68
        58 56 55 52 50 49 46
        45 48 51 52 53 54 57
        15 18 20 23 24 25 28 30
        88 90 92 94 96
        43 40 39 37 35
        61 64 67 69 72 75 78
        43 41 38 36 35 32
        25 28 31 32 34 35 37
        55 56 59 62 64 65 67 68
        70 72 73 74 77 79 81 83
        53 51 49 46 45 44
        80 82 85 88 90 93
        92 91 88 85 84 82 81 78
        67 65 64 62 59 56 54 51
        56 53 52 50 49
        82 83 86 88 89 90
        46 44 43 41 39
        22 19 17 16 13
        57 55 53 51 49 48 47
        88 87 84 83 82 79 78 75
        71 73 76 78 81
        12 15 16 19 20 21
        16 13 12 11 8
        49 47 45 43 42 41 39
        66 67 69 70 72 75
        22 21 20 18 15 12 9
        72 75 77 80 81 82 84
        3 4 6 7 8
        68 67 64 62 60
        31 29 26 24 22 21 20 17
        29 30 32 35 37 40 43
        32 29 26 24 23 21 20
        66 65 64 63 61 60 58
        60 58 56 55 54
        43 45 47 50 52 53 55
        14 12 9 6 3
        39 40 41 44 45 48
        73 71 69 68 65 63
        49 48 47 44 43 40 37
        50 49 48 46 45 44 41
        38 39 40 43 44 46 47
        78 75 73 71 70
        47 49 52 55 57 58 60
        55 52 50 49 46 45 43 42
        89 88 85 82 80 77
        94 91 89 86 83 82 79 76
        40 37 36 35 33 30
        76 77 80 81 83
        82 80 78 77 74 73 72 70
        34 32 30 29 27 25
        36 38 39 40 43 46
        26 23 21 20 17 14 13
        69 66 64 63 62
        65 68 70 71 73 74 77 78
        57 56 53 50 49
        42 40 38 35 33
        5 7 8 11 14 15 17 18
        57 55 54 52 49
        99 96 95 93 90 87
        37 39 41 42 45
        30 33 34 36 38 39 40
        29 27 26 23 20 18 15
        74 73 71 69 66 63
        79 76 73 72 70 67
        66 69 72 73 75 77
        80 81 83 84 87 89 92
        23 26 29 31 33 34 37
        70 68 65 62 60 58 57 56
        30 28 26 25 22 21 18 17
        40 39 36 33 32 30 29 27
        80 82 85 88 89 90 93
        90 87 86 83 82
        19 17 16 14 13
        16 18 21 23 26
        48 50 51 54 56 58
        1 3 6 9 10 11 13
        11 13 15 16 18 19 21
        78 75 72 69 66 65 64 61
        41 39 36 34 32 30 29
        62 59 58 55 53
        81 80 78 76 74
        91 89 86 85 84
        26 27 30 33 34
        93 92 89 86 83 82 81 78
        56 54 52 50 49 46 43 41
        50 52 53 56 58 61 62
        74 71 69 67 66
        18 21 23 24 26 27
        68 71 72 74 75
        83 80 79 77 76 75
        63 61 59 56 54 53
        9 11 13 16 19 20
        44 41 39 38 36 33 30
        72 74 76 79 82 85
        20 19 16 13 11
        84 86 89 91 92 93 96
        76 73 71 69 66
        68 66 64 62 59
        63 61 58 57 56 55
        39 40 42 44 47 50 53 55
        55 54 53 52 50 47 44 41
        30 31 32 34 36 37 39 42
        21 24 25 27 28
        28 25 24 22 21
        49 46 43 40 38
        90 89 88 85 82
        32 35 37 39 42 45
        32 33 35 38 40
        96 95 93 90 87 85 84
        4 7 9 11 12 14 15
        70 72 75 76 77 79 82 84
        82 81 80 79 76 75
        45 44 43 40 38 37 35 34
        10 12 13 16 17 18
        46 47 50 53 56 58 61 62
        34 36 39 41 43 44
        25 24 22 19 18 16
        14 12 10 7 6
        5 8 9 10 11 13 16
        1 3 6 7 8 10 11
        10 12 13 16 18
        79 77 74 73 72
        38 35 32 29 28
        17 16 13 11 9 7
        76 74 71 69 67 64 61
        75 76 77 79 80
        20 17 15 13 11 10 7
        16 13 10 8 6 5 3
        69 68 67 65 63 60
        34 37 40 42 43
        80 77 75 74 73 72 71 70
        92 91 90 87 86 83 82
        86 87 89 90 92 95
        60 61 63 66 68 70 71 73
        11 9 8 7 5
        92 89 86 83 81 80 79
        79 81 82 84 85 86
        87 90 92 94 97 99
        50 51 52 55 58 60 62
        3 4 7 9 11 13 14
        94 92 91 88 87
        83 81 79 76 74 71
        67 70 73 74 77 78 81 82
        21 23 26 27 30 31
        78 80 83 86 87 90 92 95
        49 47 44 41 38 37
        59 60 62 64 67 70 72 75
        80 77 76 73 71 68 67 65
        82 84 86 88 91 94 97 99
        72 69 67 64 63 60 57
        28 31 32 35 36
        23 21 20 19 16 13 12 9
        26 24 21 18 16 15 14
        28 25 24 22 20 19 18 15
        99 97 94 91 88
        64 66 67 69 70 73 76 79
        61 59 57 56 54 52 50 47
        48 50 53 56 59 62 63 64
        79 78 76 74 71 69 67 64
        44 47 48 50 51 53
        75 74 73 72 70 69 66
        17 15 12 9 7
        5 7 10 13 15 16 19 22
        3 6 7 9 11 14 15
        62 63 64 67 69 72 73 74
        15 13 12 10 8
        41 43 46 48 50 51
        73 71 70 67 66 64 61 59
        80 79 76 73 72 69 67 66
        56 58 60 62 64 66
        29 31 32 34 37
        49 47 46 43 41 40
        18 15 14 11 9 8
        46 48 51 52 54 57
        47 45 43 41 38 35 32 30
        14 15 17 20 23 26 28 31
        18 15 13 10 8 5
        79 78 75 73 72 71 68 65
        71 72 74 76 78 81
        59 57 55 54 52 49
        56 53 51 48 46 45 43 40
        30 29 27 24 23
        75 74 72 70 68 67
        18 17 16 14 11
        77 80 82 83 84
        79 81 83 85 88
        40 39 36 33 31
        61 63 65 68 69 72 74
        31 28 26 23 20 18 16
        46 47 48 50 53
        27 25 23 22 21 19 16 14
        8 11 13 14 17 19 21
        34 31 28 26 23 20 17
        55 53 51 48 45
        33 30 29 27 24 21 18
        42 45 48 51 52
        38 36 35 33 31 29 27
        11 14 17 20 22 25 28 30
        14 16 17 18 21 24
        74 71 70 69 67 65 64
        53 52 49 48 47 44 42 41
        77 76 73 71 70 68 65
        79 82 83 84 86 88 91
        78 75 72 70 69 67 64 62
        14 11 9 8 5
        52 55 56 58 61 63 64
        29 32 33 35 38 39
        25 28 31 34 36 39 41 42
        3 5 7 8 10 12 15 18
        73 70 67 66 64
        86 87 90 91 92 94 95
        68 69 72 75 77
        71 72 75 78 81 84 87 89
        40 43 45 47 50 51 52
        95 92 91 90 89 88
        27 30 32 34 35
        46 44 42 39 37 34 33
        65 62 61 60 57 56
        53 55 57 58 60 63 65 68
        68 70 73 74 75
        33 35 36 39 41 44 47
        35 33 30 28 26
        47 49 52 54 55 57 58
        29 30 32 35 38 39 40
        23 26 29 31 34 35 36
        68 65 62 61 58
        29 28 27 26 23 20 18
        9 12 14 16 19
        45 43 41 38 35 32 29 26
        76 78 80 83 84
        57 59 62 64 67 70 73
        38 39 41 44 46 48 50
        45 47 50 51 52 53 56
        18 15 12 11 9 7 5
        96 94 92 89 88
        22 21 19 17 15 12 10 7
        86 84 83 82 81
        11 12 15 18 19 22
        83 85 87 89 91 92
        44 43 42 40 37 34 31 28
        82 81 80 78 75 73 71
        66 68 69 71 74 76 78 81
        36 34 32 29 27 24
        60 59 56 53 51 49
        96 94 92 89 87 84 82
        98 96 94 92 91 88 85
        97 96 94 92 90 89
        65 68 71 73 74 77 78
        69 66 65 64 62
        6 7 10 12 13 16 19
        60 57 55 53 52 50
        7 9 12 15 18 19 22
        1 4 7 8 9
        29 30 32 35 36 38 41 44
        34 32 31 29 28 27
        85 82 79 77 75 74 72
        18 16 15 13 12 9
        30 29 27 25 22 21 19 18
        82 83 85 88 89
        48 51 53 56 59 62 64
        48 47 45 43 42 40 37 35
        23 24 26 27 30
        37 38 40 42 43 44 45
        24 25 28 29 32 33 34 35
        84 81 78 77 74 72 71
        45 42 40 39 38 35 33 32
        24 25 26 28 30
        31 29 27 25 24 21 20
        74 73 71 70 68 67 65
        35 36 37 39 41 43 45 47
        96 95 94 91 89 88
        54 51 50 49 48
        63 66 69 70 73 76
        76 77 80 81 82
        55 54 52 51 50
        27 30 31 33 35 37 38
        10 9 7 5 3 1
        91 88 87 86 84 83 80 78
        82 84 86 88 89 92 94 96
        58 57 55 53 50
        25 26 28 29 30
        83 85 88 89 90 91
        92 91 89 87 86 85 82
        40 43 45 46 49
        80 77 76 73 70
        23 20 18 16 15 12
        78 75 74 72 71 69
        74 76 78 81 83 86 87 90
        41 43 46 49 51 53 55
        42 43 44 46 47 49 51 53
        24 21 18 15 12 9 8 6
        82 85 87 89 92 94
        44 47 50 52 53 54 57
        89 87 85 83 81 80 77
        20 19 18 17 16 14 13
        45 43 41 40 38 35 32 29
        27 25 24 21 20 17 15 12
        84 86 88 89 90 92 94 97
        65 62 59 57 56
        51 48 46 43 42 39
        22 23 25 26 28
        71 74 77 78 81
        50 47 45 44 41 39 38
        52 50 47 45 44 42
        53 52 51 49 46
        34 33 32 29 26 24
        5 8 10 13 16 18 21
        43 44 47 50 51 54 55 58
        94 92 91 90 89
        94 93 90 89 88 86
        25 24 23 22 21
        84 86 89 92 95 96
        11 10 8 5 3
        63 60 59 56 53 51 50 48
        56 55 53 52 49 47 44
        67 68 71 72 75 78 79 82
        31 32 34 37 40 41 43
        51 53 54 57 60 63
        51 52 53 55 56 59
        33 32 30 29 28
        70 72 75 76 78 81 84
        47 48 51 53 54 56 58
        15 13 10 9 6 4
        37 36 35 32 30 28
        50 49 46 45 42 40 38
        54 53 52 49 48
        96 94 92 89 87
        35 34 33 30 28
        24 22 19 16 13 10
        83 81 78 77 75 74 71
        43 42 41 39 36 33 31 30
        61 63 65 68 69 71 74 76
        89 90 91 92 94 96 98
        5 8 9 12 15 16 18
        47 48 51 52 54 57
        35 37 40 43 44 46
        12 9 7 5 3 2
        28 31 34 36 38 40 41
        96 94 92 91 90 87 85
        63 66 67 68 69 71 73 74
        59 57 55 52 50 48
        15 16 18 21 24 26 27
        12 10 9 7 4
        35 34 31 28 25 22 20
        34 32 29 28 25 22 21 18
        57 59 60 62 63 64
        53 51 49 46 43 41 38 36
        44 42 40 39 36 34 31
        61 62 64 67 68
        89 91 93 94 96 98
        61 64 66 67 69 70 73
        15 17 19 21 22
        60 58 57 56 54 53
        16 13 12 10 9 7 6
        1 4 7 10 11
        91 89 86 84 81
        54 56 59 61 63 65 66 69
        81 78 75 74 71
        36 39 40 42 44 46 47
        43 41 39 37 36 35 34
        60 63 66 68 70 71 73
        83 84 86 87 90 92
        54 57 60 62 63
        99 98 96 95 94
        31 32 34 37 38
        95 93 92 89 88 87
        69 67 64 63 61
        23 21 18 15 13 11 8 7
        50 53 54 55 58 61 64
        59 61 64 66 68
        39 36 35 32 29
        72 70 68 65 64 61
        64 62 61 58 56 55
        14 13 12 9 7
        72 69 68 67 64 63 60
        47 49 52 54 57 60 62 63
        79 81 83 84 85
        51 53 55 57 60 62 63 64
        70 73 75 78 81
        19 17 16 14 11 10
        69 66 65 62 59
        51 49 48 47 46 45
        31 32 33 36 38
        14 16 18 21 24
        84 85 87 89 90 92 93 95
        51 48 45 44 41 38 37
        48 49 51 53 55 58
        30 29 27 25 23 21
        34 35 38 39 41 43 44
        61 62 63 64 67 69 70
        26 28 30 32 34
        50 52 54 56 59 61 64
        14 11 10 8 6 3
        29 31 33 36 38 39
        40 37 36 35 32 31 30 28
        84 82 79 78 75 74 71 68
        3 5 8 11 12 14
        59 58 56 55 53 52 49 47
        81 78 77 74 71 68 65
        40 43 44 46 48 49 52
        76 79 81 83 86 89 91
        69 68 67 65 63
        3 6 8 11 14 17 19 20
    """
}
