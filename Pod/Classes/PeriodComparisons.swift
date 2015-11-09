//
//  PeriodComparable.swift
//  Pods
//
//  Created by Jeroen Houtzager on 09/11/15.
//
//


extension Period: Comparable {}

// MARK: - Protocol Comparable
//
public func <(lperiod: Period, rperiod: Period) -> Bool {
    return lperiod.endDate.compare(rperiod.startDate) == .OrderedAscending
}

public func >(lperiod: Period, rperiod: Period) -> Bool {
    return lperiod.startDate.compare(rperiod.endDate) == .OrderedDescending
}

public func >=(lperiod: Period, rperiod: Period) -> Bool {
    return lperiod.startDate.compare(rperiod.startDate) != .OrderedAscending
}

public func <=(lperiod: Period, rperiod: Period) -> Bool {
    return lperiod.endDate.compare(rperiod.endDate) != .OrderedDescending
}

