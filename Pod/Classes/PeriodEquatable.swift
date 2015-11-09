//
//  PeriodEquatable.swift
//  Pods
//
//  Created by Jeroen Houtzager on 09/11/15.
//
//


// MARK: - Protocol Equatable
//
extension Period : Equatable {}

public func ==(left: Period, right: Period) -> Bool {

    // First check if they are not the same objects
    if ObjectIdentifier(left) == ObjectIdentifier(right) {
        return true
    }

    return left.startDate == right.startDate && left.duration == right.duration
}

