import UIKit

func task() async {
    try? await Task.sleep(nanoseconds: 5 * 1_000_000_000) // 1 second
}

//-----------------------------------------------------------------------------------------------------------------------------------

// Time Difference using DateInterval

let DTStartDate = Date()
let DTTimer = Timer()
DTTimer.fire()

Task {
    await task()
    DTTimer.invalidate()
    let dateInterval = DateInterval(start: DTStartDate, end: Date())
    print("DateInterval - the difference between starData and endData is: \(Int(dateInterval.duration)) seconds")
}

//-----------------------------------------------------------------------------------------------------------------------------------

// Time Difference using Date and TimeInterval

let DStartDate = Date()
let DDateTimer = Timer()
DDateTimer.fire()

Task {
    await task()
    DDateTimer.invalidate()
    let interval = abs(DStartDate.timeIntervalSinceNow)
    print("Date - the difference between starData and endData is: \(Int(interval)) seconds")
}

