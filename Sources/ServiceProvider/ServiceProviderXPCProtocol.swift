import Foundation

@objc(ServiceProviderXPCProtocol) protocol ServiceProviderXPCProtocol {
  func getPublicIp(withReply reply: @escaping (String) -> Void)
}
