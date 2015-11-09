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
        }
    }
}
