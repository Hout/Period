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
/// Implements "less than" comparisons for periods.
///
/// - Parameters:
///     - lperiod: the left hand period
///     - rperiod: the right hand period
///
/// - Returns: `true` if `lperiod` is earlier than `rperiod` without overlap.
///
public func <(lperiod: Period, rperiod: Period) -> Bool {
    return lperiod.endDate.compare(rperiod.startDate) == .OrderedAscending
}

/// Implements "greater than" comparisons for periods.
///
/// - Parameters:
///     - lperiod: the left hand period
///     - rperiod: the right hand period
///
/// - Returns: `true` if `lperiod` is later than `rperiod` without overlap.
///
public func >(lperiod: Period, rperiod: Period) -> Bool {
    return lperiod.startDate.compare(rperiod.endDate) == .OrderedDescending
}

/// Implements "greater than or equal" comparisons for periods.
///
/// - Parameters:
///     - lperiod: the left hand period
///     - rperiod: the right hand period
///
/// - Returns: `true` if `lperiod` starts later than `rperiod` does.
///
public func >=(lperiod: Period, rperiod: Period) -> Bool {
    return lperiod.startDate.compare(rperiod.startDate) != .OrderedAscending
}

/// Implements "less than or equal" comparisons for periods.
///
/// - Parameters:
///     - lperiod: the left hand period
///     - rperiod: the right hand period
///
/// - Returns: `true` if `lperiod` ends earlier than `rperiod` does.
///
public func <=(lperiod: Period, rperiod: Period) -> Bool {
    return lperiod.endDate.compare(rperiod.endDate) != .OrderedDescending
}

