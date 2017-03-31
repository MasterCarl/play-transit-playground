//#-hidden-code
import UIKit
import Foundation
import PlaygroundSupport
//#-end-hidden-code

let lineEmbarcaderoUrl = URL(string: "http://restbus.info/api/agencies/sf-muni/routes/E")

//: > The following function is called a **callback**. Normally, you would just get your data like this: `let data = load(contentsOf: lineEmbarcaderoUrl)`. However, because  requests over the internet take some time, we just continue doing other stuff until `load(contentsOf: lineEmbarcaderoUrl)` *calls back* the function you see below. This behavious is called *asynchronous*.

//: The parsed JSON we get is a Dictionary that maps from `String`s to other `String`s, numbers, or sub-`Dictionary`s. That's why its type is `Any` - It could be anything!

load(contentsOf: lineEmbarcaderoUrl) { data, error in
    // let's see if we received anything
    let numberOfBytes = data?.count
    // All bytes there? Let's check the contents!
    let structuredData = try! JSONSerialization.jsonObject(with: data!) as! [String: Any]
    // As you might notice, this is kind of clunky. But don't worry, we'll get to that on the next pages.
}

//#-hidden-code

//#-end-hidden-code
