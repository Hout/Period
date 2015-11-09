// https://github.com/Quick/Quick

import Quick
import Nimble
import Period

class PeriosSpec: QuickSpec {
    override func spec() {

        describe("Period") {

            let startDate = NSDate()
            let duration: NSTimeInterval = 60 * 60 * 24

            context("Initialisations") {

                it("will initialise with a normal start date and positive duration") {
                    let period = Period(startDate: startDate, duration: duration)
                    expect(period.startDate) == startDate
                    expect(period.duration) == duration
                }

                it("will initialise with a normal start date and negative duration") {
                    let period = Period(startDate: startDate, duration: -duration)
                    let expectedStartDate = NSDate(timeInterval: -duration, sinceDate: startDate)
                    expect(period.startDate) == expectedStartDate
                    expect(period.duration) == duration
                }

                it("will initialise with a normal start date and end date") {
                    let endDate = NSDate(timeInterval: duration, sinceDate: startDate)
                    let period = Period(startDate: startDate, endDate: endDate)
                    expect(period).toNot(beNil())
                    expect(period!.startDate) == startDate
                    expect(period!.duration) == duration
                }

                it("will not initialise with a start date later than end date") {
                    let endDate = NSDate(timeInterval: -duration, sinceDate: startDate)
                    let period = Period(startDate: startDate, endDate: endDate)
                    expect(period).to(beNil())
                }
            }

            context("Equations") {

                let period1 = Period(startDate: startDate, duration: duration)
                let period2 = Period(startDate: startDate, duration: duration)

                it("will return true with the same periods") {
                    expect(period1 == period1) == true
                }

                it("will return true with equivalent periods") {
                    expect(period1 == period2) == true
                }

                it("will return false with different start dates") {
                    let period3 = Period(startDate: NSDate(), duration: duration)
                    expect(period1 == period3) == false
                }

                it("will return false with different durations") {
                    let period3 = Period(startDate: startDate, duration: duration + 1)
                    expect(period1 == period3) == false
                }
            }

            context("Comparisons") {

                let startDate2 = NSDate(timeInterval: duration + 1, sinceDate: startDate)
                let startDate3 = NSDate(timeInterval: duration / 2, sinceDate: startDate)
                let period1 = Period(startDate: startDate, duration: duration)
                let period2 = Period(startDate: startDate2, duration: duration) // After period1
                let period3 = Period(startDate: startDate3, duration: duration) // During period1 and period2

                context("Less than") {
                    it("will return false with equal periods") {
                        expect(period1 < period1) == false
                    }

                    it("will return true with the left period earlier than the right period") {
                        expect(period1 < period2) == true
                    }

                    it("will return false when the periods overlap and the left period starts earlier than the right period") {
                        expect(period1 < period3) == false
                    }

                    it("will return false when the left period is after the right period") {
                        expect(period2 < period1) == false
                    }

                    it("will return false when the periods overlap and the left period starts later than the right period") {
                        expect(period2 < period3) == false
                    }
                }

                context("Less than or equal") {
                    it("will return true with equal periods") {
                        expect(period1 <= period1) == true
                    }

                    it("will return true with the left period earlier than the right period") {
                        expect(period1 <= period2) == true
                    }

                    it("will return true when the periods overlap and the left period starts earlier than the right period") {
                        expect(period1 <= period3) == true
                    }

                    it("will return false when the left period is after the right period") {
                        expect(period2 <= period1) == false
                    }

                    it("will return false when the periods overlap and the left period starts later than the right period") {
                        expect(period2 <= period3) == false
                    }
                }

                context("Greater than") {
                    it("will return false with equal periods") {
                        expect(period1 > period1) == false
                    }

                    it("will return false with the left period earlier than the right period") {
                        expect(period1 > period2) == false
                    }

                    it("will return false when the periods overlap and the left period starts earlier than the right period") {
                        expect(period1 > period3) == false
                    }

                    it("will return true when the left period is after the right period") {
                        expect(period2 > period1) == true
                    }

                    it("will return false when the periods overlap and the left period starts later than the right period") {
                        expect(period2 > period3) == false
                    }
                }
                
                context("Greater than or equal") {
                    it("will return true with equal periods") {
                        expect(period1 >= period1) == true
                    }

                    it("will return false with the left period earlier than the right period") {
                        expect(period1 >= period2) == false
                    }

                    it("will return false when the periods overlap and the left period starts earlier than the right period") {
                        expect(period1 >= period3) == false
                    }

                    it("will return true when the left period is after the right period") {
                        expect(period2 >= period1) == true
                    }

                    it("will return true when the periods overlap and the left period starts later than the right period") {
                        expect(period2 >= period3) == true
                    }
                }
            }

            context("date inPeriod") {

                let period = Period(startDate: startDate, duration: duration)

                it("should return true when date is equal to start date") {
                    expect(period.startDate.inPeriod(period)) == true
                }

                it("should return true when date is equal to end date") {
                    expect(period.endDate.inPeriod(period)) == true
                }

                it("should return true when date is in between start date and end date") {
                    let date = NSDate(timeInterval: duration / 2, sinceDate: startDate)
                    expect(date.inPeriod(period)) == true
                }

                it("should return false when date is before start date") {
                    let date = NSDate(timeInterval: -duration, sinceDate: startDate)
                    expect(date.inPeriod(period)) == false
                }

                it("should return false when date is after end date") {
                    let date = NSDate(timeInterval: duration, sinceDate: period.endDate)
                    expect(date.inPeriod(period)) == false
                }

            }

            context("period inPeriod") {

                let startDate2 = NSDate(timeInterval: duration + 1, sinceDate: startDate)
                let startDate3 = NSDate(timeInterval: duration / 2, sinceDate: startDate)
                let period1 = Period(startDate: startDate, duration: duration)
                let period2 = Period(startDate: startDate2, duration: duration) // After period1
                let period3 = Period(startDate: startDate3, duration: duration) // overlapping period1 and period2
                let period4 = Period(startDate: startDate3, duration: duration / 3) // in period1

                it("should return true when periods are equal") {
                    expect(period1.inPeriod(period1)) == true
                }

                it("should return false when receiver starts before and ends after test period") {
                    expect(period1.inPeriod(period4)) == false
                }

                it("should return false when receiver is within test period") {
                    expect(period4.inPeriod(period1)) == true
                }

                it("should return false when receiver is completely later than test period") {
                    expect(period2.inPeriod(period1)) == false
                }

                it("should return false when receiver is completely earlier than test period") {
                    expect(period1.inPeriod(period2)) == false
                }
                
                it("should return false when receiver overlaps and is later than test period") {
                    expect(period3.inPeriod(period1)) == false
                }

                it("should return false when receiver overlaps and is earlier than test period") {
                    expect(period3.inPeriod(period2)) == false
                }
                
            }

            context("period oeverlapsPeriod") {

                let startDate2 = NSDate(timeInterval: duration + 1, sinceDate: startDate)
                let startDate3 = NSDate(timeInterval: duration / 2, sinceDate: startDate)
                let period1 = Period(startDate: startDate, duration: duration)
                let period2 = Period(startDate: startDate2, duration: duration) // After period1
                let period3 = Period(startDate: startDate3, duration: duration) // overlapping period1 and period2
                let period4 = Period(startDate: startDate3, duration: duration / 3) // in period1

                it("should return true when periods are equal") {
                    expect(period1.overlapsPeriod(period1)) == true
                }

                it("should return true when receiver starts before and ends after test period") {
                    expect(period1.overlapsPeriod(period4)) == true
                }

                it("should return false when receiver is within test period") {
                    expect(period4.overlapsPeriod(period1)) == true
                }

                it("should return false when receiver is completely later than test period") {
                    expect(period2.overlapsPeriod(period1)) == false
                }

                it("should return false when receiver is completely earlier than test period") {
                    expect(period1.overlapsPeriod(period2)) == false
                }

                it("should return true when receiver overlaps and is later than test period") {
                    expect(period3.overlapsPeriod(period1)) == true
                }

                it("should return true when receiver overlaps and is earlier than test period") {
                    expect(period3.overlapsPeriod(period2)) == true
                }
                
            }
}
    }
}
