//
//  PeriodOperators.swift
//  Pods
//
//  Created by Jeroen Houtzager on 09/11/15.
//
//

extension NSDate {

    /// Returns `true` when the receiver date is within the period.
    ///
    /// - Parameters:
    ///     - period: the period to evaluate the date against
    ///
    /// - Returns: `true` if the date is within the period, `false` if it is before the start date or after the end date.
    ///
    /// - Note: start- and end dates are part of the period!
    public func inPeriod(period: Period) -> Bool {
        if self.compare(period.startDate) == NSComparisonResult.OrderedAscending {
            return false
        }
        if self.compare(period.endDate) == NSComparisonResult.OrderedDescending {
            return false
        }
        return true
    }
}

extension Period {

    /// Returns `true` when the receiver period is within the given period.
    ///
    /// - Parameters:
    ///     - period: the period to evaluate the receiver against
    ///
    /// - Returns: `true` if the receiver period is completely within the given period,
    ///     `false` if the receiver start date is before `period` start date or the receiver end date is after `period` end date.
    ///
    /// - Note: start- and end dates are part of the period!
    public func inPeriod(period: Period) -> Bool {
        if startDate.compare(period.startDate) == NSComparisonResult.OrderedAscending {
            return false
        }
        if endDate.compare(period.endDate) == NSComparisonResult.OrderedDescending {
            return false
        }
        return true
    }

    /// Returns `true` when the receiver period overlaps the given period.
    ///
    /// - Parameters:
    ///     - period: the period to evaluate the receiver against
    ///
    /// - Returns: `true` if the receiver period overlaps within the given period,
    ///     `false` if the receiver ends before `period` or the receiver starts after `period`.
    ///
    /// - Note: start- and end dates are part of the period!
    public func overlapsPeriod(period: Period) -> Bool {
        if startDate.compare(period.endDate) == NSComparisonResult.OrderedDescending {
            return false
        }
        if endDate.compare(period.startDate) == NSComparisonResult.OrderedAscending {
            return false
        }
        return true
    }
}
