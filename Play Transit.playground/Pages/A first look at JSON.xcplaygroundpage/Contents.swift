//#-hidden-code
import UIKit
import Foundation
import PlaygroundSupport
//#-end-hidden-code
/*:
 Now, let's take a look at the **E-Embarcadero** line. Luckily, it's the first one in the document! Can you find the URL that gives us all the information about it?
 
 Just tap **run code** again and take another look at the JSON we just received.
 
 **Hint**  The link URL can be found at `_links.self.href`.
 
 */

//#-editable-code
let routesUrl = URL(string: "http://restbus.info/api/agencies/sf-muni/routes")
//#-end-editable-code
//: Edit this URL to get a list of all the stops on the E line

//#-hidden-code
let browser = MicroBrowser()
browser.load(url: routesUrl)
PlaygroundPage.current.liveView = browser.viewController
//#-end-hidden-code
