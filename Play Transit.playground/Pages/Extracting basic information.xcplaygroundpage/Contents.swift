//#-hidden-code
import UIKit
import Foundation
import PlaygroundSupport
//#-end-hidden-code

let lineUrl = URL(string: /*#-editable-code*/"http://restbus.info/api/agencies/sf-muni/routes/E"/*#-end-editable-code*/)
//: Feel free to try line **F**!
//: ___
//#-hidden-code
let json: [String: Any]
if let data = loadSync(contentsOf: lineUrl) {
    json = try! JSONSerialization.jsonObject(with: data) as! [String: Any]
} else {
    json = [String: Any]()
}
//<#T##Template for placeholders##String#
//#-end-hidden-code
let lineViewer = LineViewer()
//: Data in a `Dictionary` is accessed by the keys - in this case, `String`s. To know which to use, have a look at the `keys` property.
let keys = Array(json.keys)
//: Here, we set the title of our line viewer. Now, try to set the next property accordingly:
lineViewer.nameLabel.text = json["title"] as? String
let key = /*#-editable-code*/"<#key for the id#>"/*#-end-editable-code*/
let id = json[key]
//: > The `??` operator can only be used on `Optional`s. If the left-hand side is `nil` (having no value), the alternative right-hand side will be used. To see it in action, enter a key like "foo" above.
lineViewer.idLabel.text = id as? String ?? /*#-editable-code*/"🤷‍♂️"/*#-end-editable-code*/

//: Finally, that color seems off. Can you set the color to the correct value from the JSON?
//#-editable-code
lineViewer.circleColor = json[""] as? String ?? "#66CCFF"
//#-end-editable-code
//#-hidden-code

//let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//let viewController = storyboard.instantiateViewController(withIdentifier: "LineViewer") as! LineViewer
PlaygroundPage.current.liveView = lineViewer.viewController
//#-end-hidden-code
