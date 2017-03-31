//#-hidden-code
import UIKit
import Foundation
import PlaygroundSupport
//#-end-hidden-code

/*:
 # Play Transit
 
 ![Transit icons](transport.png "")
 In this playground, we are going to explore the data made available by public transit companies. You can access all this data by their API.
 ---
 > API is an abbreviation for *application programming interface*. Just like regular websites provide content for humans, APIs provide information that can easily be read by computers.
 You can still access that information the same way - just put the URL in your browser.
 */
//: For example, this URL gives you an overview of all the transit routes in San Francisco:

//#-editable-code
let routesUrl = URL(string: "http://restbus.info/api/agencies/sf-muni/routes")
//#-end-editable-code
//: Curious what it looks like? Tap **run code** to see it in a browser!
let browser = MicroBrowser()
browser.load(url: routesUrl)

//: > This is not a real browser - it only loads  files that are part of this playground.
//#-hidden-code
PlaygroundPage.current.liveView = browser.viewController
//#-end-hidden-code