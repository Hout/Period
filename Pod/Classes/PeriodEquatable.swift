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


/// Implements the equatable protocol by comparing for equality
public func ==(left: Period, right: Period) -> Bool {
    return left.startDate == right.startDate && left.duration == right.duration
}

