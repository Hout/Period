# Period

[![CI Status](http://img.shields.io/travis/Hout/Period.svg?style=flat)](https://travis-ci.org/Hout/Period)
[![Version](https://img.shields.io/cocoapods/v/Period.svg?style=flat)](http://cocoapods.org/pods/Period)
[![License](https://img.shields.io/cocoapods/l/Period.svg?style=flat)](http://cocoapods.org/pods/Period)
[![Platform](https://img.shields.io/cocoapods/p/Period.svg?style=flat)](http://cocoapods.org/pods/Period)

The `Period` class represents a period of time after an NSDate object.
It is in absolute time so it has no references to calendrical properties.
Various operations are implemented e.g.:
- check whether an NSDate instance lies within a Period instance.
- check whether an Period instance lies within a Period instance.
- check whether an Period instance overlaps a Period instance.
- check whether an Period instance is earlier/later than a Period instance without overlap (< or > operators).
- check whether an Period instance is earlier/later than or overlaps than a Period instance (<= or >= operators).
- implements Equatable & Comparable protocols.

## Usage

Check the included playground for examples:
````Swift
//: Playground - noun: a place where people can play

import Foundation
import Period

// Let us first initialise the test periods
// This is laboursome and looks complicated as I use only native Cocoa routines
// You might want to use helper classes to assign values to dates.

let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
let components = NSDateComponents()
components.year = 2000
components.month = 1
components.day = 1
let y2000Start = calendar.dateFromComponents(components)!
components.year = 2001
let y2001Start = calendar.dateFromComponents(components)!
components.second = -1
let y2000End = calendar.dateFromComponents(components)!
components.year = 2002
let y2001End = calendar.dateFromComponents(components)!

components.year = 2000
components.month = 6
components.day = 21
components.hour = NSDateComponentUndefined
components.minute = NSDateComponentUndefined
components.second = NSDateComponentUndefined
let y2000summerStart = calendar.dateFromComponents(components)!
components.year = 2001
components.month = 3
let y2000winterEnd = calendar.dateFromComponents(components)!

let day = Double(60*60*24)
let quarter = day * 91

// Create the periods

let y2000 = Period(startDate: y2000Start, endDate: y2000End)!
let y2001 = Period(startDate: y2001Start, endDate: y2001End)!
let y2000summer = Period(startDate: y2000summerStart, duration: quarter)

// Note how we create a period with a negative duration
let y2000winter = Period(startDate: y2000winterEnd, duration: -quarter)

// Note that initialiser with end dates returns an optional value
// That is to force the end date not to be earlier than the start date.
// See how this one returns nil:
let errorPeriod = Period(startDate: y2001Start, endDate: y2000End)

// Period operators

y2000summer.inPeriod(y2000) // true
y2000summer.inPeriod(y2001) // false
y2000summer.overlapsPeriod(y2000) // true
y2000summer.overlapsPeriod(y2001) // false

y2000winter.inPeriod(y2000) // false
y2000winter.inPeriod(y2001) // false
y2000winter.overlapsPeriod(y2000) // true
y2000winter.overlapsPeriod(y2001) // true

// Date operators

y2000summerStart.inPeriod(y2000) // true
y2000summerStart.inPeriod(y2001) // false

// Comparisons

y2000summer < y2000 // false
y2000summer < y2001 // true

y2000winter >= y2000 // true
y2000winter >= y2001 // false

y2000winter <= y2000 // false
y2000winter <= y2001 // true

// Equations

y2000 == y2001 // false
y2000 == y2000 // true
y2000 == Period(startDate: y2000Start, endDate: y2000End)! // true

````

## Requirements

## Installation

Period is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Period"
```

## Author

Jeroen Houtzager, pls contact me through [GitHub](https://github.com/Hout)

## License

Period is available under the MIT license. See the LICENSE file for more info.

