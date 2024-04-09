import SwiftUI
import PerimeterX_SDK

// PX 3.1.3 - does not reproduce
//final class PXDelegate: NSObject, PerimeterXDelegate {
//    
//    func perimeterxDidRequestBlocked(url: URL?, appId: String) {
//        print("perimeterxDidRequestBlocked \(url), \(appId)")
//    }
//
//    func perimeterxDidChallengeSolved(forAppId appId: String) {
//        print("perimeterxDidChallengeSolved \(appId)")
//    }
//
//    func perimeterxDidChallengeCancelled(forAppId appId: String) {
//        print("perimeterxDidChallengeCancelled \(appId)")
//    }
//
//    func perimeterxHeadersWereUpdated(headers: [String : String], forAppId appId: String) {
//        print("perimeterxHeadersWereUpdated \(headers), \(appId)")
//    }
//}

// PX 2.2.4
final class PXDelegate: NSObject, PerimeterXDelegate {
    func perimeterxDidRequestBlocked(forAppId appId: String) {
        print("perimeterxDidRequestBlocked \(appId)")
    }
    
    func perimeterxDidChallengeSolved(forAppId appId: String) {
        print("perimeterxDidChallengeSolved \(appId)")
    }
    
    func perimeterxDidChallengeCancelled(forAppId appId: String) {
        print("perimeterxDidChallengeCancelled \(appId)")
    }
    
}

struct ContentView: View {
    private let del = PXDelegate()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            self.initPX()
        }
    }
    // PX 2.2.4
    private func initPX() {
        PerimeterX.start(appId: "PutYourKey", delegate: self.del, enableDoctorCheck: false) { success, error in
            if success {
                print("success")
                let policy = PXPolicy()
                policy.delayResponseUntilChallengeSolvedOrCancelled = true
                policy.requestsInterceptedAutomaticallyEnabled = true
                policy.domains.insert("example.com")
                PerimeterX.setPolicy(policy: policy) {
                    print("policy set")
                }
            } else {
                print("failure")
                print(error)
            }
        }
    }
    
        // PX 3.1.3 - does not happen
//    private func initPX() {
//        let policy = PXPolicy()
//        policy.doctorCheckEnabled = false
//        policy.urlRequestInterceptionType = .interceptWithDelayedResponse
//        policy.hybridAppSupportEnabled = true
//        do {
//            try PerimeterX.start(appId: "PutYourKey", delegate: self.del, policy: policy)
//        } catch {
//            print(error)
//        }
//    }
}

#Preview {
    ContentView()
}
