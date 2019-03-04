//
//  Data.swift
//  Outtatime
//
//  Created by Artem Karmaz on 2/28/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

protocol DataDelegate {
    func createTimeData()
}

struct Time {
    static var hour = [Int]()
    static var minutes = [Int]()
    static var seconds = [Int]()
}

extension DataDelegate {
    func createTimeData() {
        for time in 0..<24 {
            Time.hour.append(time)
        }
        for time in 00..<60 {
            Time.minutes.append(time)
        }
        for time in 00..<60 {
            Time.seconds.append(time)
        }
    }
}
