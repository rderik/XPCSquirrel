import Foundation

let listener = NSXPCListener.service()
let delegate = ServiceDelegate()
listener.delegate = delegate;
listener.resume()
RunLoop.main.run()
