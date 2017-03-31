import Foundation

public func loadSync(contentsOf url: URL?) -> Data? {
    if let path = Bundle.main.url(forResource: url?.lastPathComponent ?? "", withExtension: "json"),
        let data = try? Data(contentsOf: path) {
        return data
    } else {
        return nil
    }
}
