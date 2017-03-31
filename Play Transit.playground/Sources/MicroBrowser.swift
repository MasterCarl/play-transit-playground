import Foundation
import UIKit

public class MicroBrowser: NSObject {

    public let viewController = UIViewController(nibName: "MicroBrowser", bundle: Bundle.main)
    let webView: UIWebView
    let textField: UITextField
    
    public override init() {
        self.webView = viewController.view.viewWithTag(2) as! UIWebView
        self.textField = viewController.view.viewWithTag(1) as! UITextField
        super.init()
        
        self.textField.delegate = self
    }
    
    public func load(url: URL?) {
        textField.text = url?.absoluteString ?? "The URL seems to be invalid 😕"
        if let path = Bundle.main.url(forResource: url?.lastPathComponent ?? "", withExtension: "json"),
            let data = try? Data(contentsOf: path),
        data.count > 0 {
            webView.load(data, mimeType: "application/json", textEncodingName: "utf-8", baseURL: Bundle.main.bundleURL)
        }   else {
            webView.loadHTMLString("<html><body style=\" font-family: Helvetica Neue; text-align: center;\"><b>Error</b><br>Unfortunately, this is an offline demo, so other paths don't work. But why don't you try this in a real browser?</body></html>", baseURL: nil)
        }
    }
}

extension MicroBrowser: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        load(url: URL(string: textField.text ?? ""))
        return true
    }
}
