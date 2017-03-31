import Foundation
import UIKit


public class LineViewer {
    public let viewController = UIViewController(nibName: "LineViewer", bundle: Bundle.main)
    
    public let idLabel: UILabel
    public let nameLabel: UILabel
    let letterView: UIView
    
    public init() {
        let signView = viewController.view.viewWithTag(4)!
        self.letterView = signView.viewWithTag(1)!
        self.idLabel = self.letterView.viewWithTag(0) as! UILabel
        self.nameLabel = signView.viewWithTag(2) as! UILabel
    }
    
    public func updateCorderRadius() {
        self.letterView.layer.cornerRadius = self.letterView.frame.size.width / 2.0   // nicely rounded
    }
    
    public var circleColor: String {
        set {
            print(newValue)
            let uiColor = hexStringToUIColor(hex: newValue)
            letterView.backgroundColor = uiColor
        }
        get {
            return "#000000"    // hackathon spirit
        }
    }
    
    public var nameColor: String {
        set {
            let uiColor = hexStringToUIColor(hex: newValue)
            nameLabel.textColor = uiColor
        }
        get {
            return "#000000"    // hackathon spirit
        }
    }
    
    /// Taken from http://stackoverflow.com/questions/24263007/how-to-use-hex-colour-values-in-swift-ios
    func hexStringToUIColor(hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}

