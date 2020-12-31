import UIKit
import AWSCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let accessKey = Constans.accessKey
        let secretKey = Constans.secretKey
        let provider = AWSStaticCredentialsProvider(accessKey: accessKey, secretKey: secretKey)

        let configuration = AWSServiceConfiguration(
            region: AWSRegionType.APNortheast1,
            credentialsProvider: provider)

        AWSServiceManager.default().defaultServiceConfiguration = configuration

        return true
    }
}
