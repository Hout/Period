//
//  PeriodDescription.swift
//  Pods
//
//  Created by Jeroen Houtzager on 09/11/15.
//
//


extension Period : CustomStringConvertible {

    /// Returns a full description of the class
    ///
    public var description: String {
        let calendar = NSCalendar.currentCalendar()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy HH:mm:ss"
        dateFormatter.calendar = calendar
        dateFormatter.timeZone = calendar.timeZone

        return "\(dateFormatter.stringFromDate(self.startDate)) --> \(dateFormatter.stringFromDate(self.endDate))"
    }

}