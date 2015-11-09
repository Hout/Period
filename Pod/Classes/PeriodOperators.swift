//
//  PeriodOperators.swift
//  Pods
//
//  Created by Jeroen Houtzager on 09/11/15.
//
//

extension NSDate {

    func inPeriod(period: Period) -> Bool {
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

    func inPeriod(period: Period) -> Bool {
        if startDate.compare(period.startDate) != NSComparisonResult.OrderedDescending {
            return false
        }
        if endDate.compare(period.endDate) != NSComparisonResult.OrderedAscending {
            return false
        }
        return true
    }
}
