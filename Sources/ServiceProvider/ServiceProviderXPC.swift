import Foundation

@objc class ServiceProviderXPC: NSObject, ServiceProviderXPCProtocol{

  func getPublicIp(withReply reply: @escaping (String) -> Void) {
    let pmset = Process()
      let pipe = Pipe()
      if #available(OSX 13, *) {
        pmset.executableURL = URL(fileURLWithPath: "/usr/bin/env")
      } else {
        pmset.launchPath = "/usr/bin/env"
      }
      // We are going to use `dig` to obtain our public IP using
      // Cisco's opendns.com domain:
      // dig +short myip.opendns.com @resolver1.opendns.com
      pmset.arguments = ["dig", "+shor", "myip.opendns.com", "@resolver1.opendns.com"]
      pmset.standardOutput = pipe
      do {
      if #available(OSX 13, *) {
        do {
          try pmset.run()
        } catch {
         reply("")
        }
      } else {
        pmset.launch()
      }
        pmset.waitUntilExit()
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        if let output = String(data: data, encoding: String.Encoding.utf8) {
          reply(output.trimmingCharacters(in: .whitespacesAndNewlines))
        }
      }
  }
}
