import Foundation

public func load(contentsOf url: URL?, onCompletion: ((Data?, Error?) -> Void)) {
    if let path = Bundle.main.url(forResource: url?.lastPathComponent ?? "", withExtension: "json"),
        let data = try? Data(contentsOf: path) {
        onCompletion(data, nil)
    } else {
        onCompletion(nil, nil)
    }
}
