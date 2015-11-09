//
//  JHDatePeriod.swift
//  Pods
//
//  Created by Jeroen Houtzager on 09/11/15.
//
//


/// The period class represents a period of time. It is in absolute time so it has no references to calendric
/// properties.
///
public struct Period {

    /// Start date of the period
    /// - Note: the start date is within the period.
    ///
    public let startDate: NSDate

    /// Duration of the period in seconds
    ///
    public let duration: NSTimeInterval

    /// Initialiser. Takes a start date and a duration.
    ///
    /// - Note: If the duration is negative, then the period will be
    ///     going back in time from the specified start date
    ///
    /// - Parameters:
    ///     - startDate: date from which the period starts
    ///     - duration: duration of the period in seconds. If `duration` is negative, then the period will be
    ///     going back in time from the specified start date
    ///
    public init(startDate aStartDate: NSDate, duration aDuration: NSTimeInterval) {
        if aDuration >= 0 {
            duration = aDuration
            startDate = aStartDate
        } else {
            // If duration < 0, then it is a negative period that we want to implement in a neat way
            startDate = NSDate(timeInterval: aDuration, sinceDate: aStartDate)
            duration = -aDuration
        }
    }

    /// Initialiser. Takes a start date and an end date.
    ///
    /// - Parameters:
    ///     - startDate: date from which the period starts
    ///     - endDate: date at which the period ends. 
    /// `EndDate` must not be earlier than `startDate` or the initialiser will return `nil`
    ///
    /// - Returns: a new instance of Period or `nil` is `endDate` is earlier than `startDate`
    ///
    public init?(startDate aStartDate: NSDate, endDate anEndDate: NSDate) {

        let duration = anEndDate.timeIntervalSinceReferenceDate - aStartDate.timeIntervalSinceReferenceDate
        guard duration >= 0 else {
            return nil
        }
        self.init(startDate: aStartDate, duration: duration)
    }
    
    /// End date of the period.
    /// - Note: the end date is within the period.
    ///
    public var endDate: NSDate {
        return NSDate(timeInterval: duration, sinceDate: startDate)
    }
}