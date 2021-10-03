//
//  AppDelegate.swift
//  sKooter
//
//  Created by Vajda Kristóf on 2021. 10. 02..
//

import UIKit
import RxSwift
import Resolver

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    @LazyInjected var locationManager: LocationManagerInterface

    private let bag = DisposeBag()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.locationManager.startLocation()

        locationManager.permissionState
            .filter { $0 == .notDetermined || $0 == .restricted }
            .bind { [weak self] _ in
                self?.locationManager.requestPermission()
            }
            .disposed(by: bag)

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

