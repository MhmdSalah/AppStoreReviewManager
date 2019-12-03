//
//  AppStoreReviewManager.swift
//  videocompress
//
//  Created by Mohammed Ashour on 12/2/19.
//  Copyright © 2019 palwork.com All rights reserved.
//

import UIKit

enum AppStoreReviewManager {
    static let minimumReviewWorthyActionCount = 5
    static let urlString = "https://itunes.apple.com/app/id1484470434"
    // if you are using a UserDefaults with this same key, change it
    static let reviewKey = "reviewWorthyActionCount"
    static let versionKey = "lastReviewRequestAppVersion"

    static func requestReviewIfAppropriate(referennceVC:UIViewController) {
        let defaults = UserDefaults.standard
        let bundle = Bundle.main

        var actionCount = defaults.integer(forKey: reviewKey)

        actionCount += 1
            
        defaults.set(actionCount, forKey: reviewKey)
            
        guard actionCount >= minimumReviewWorthyActionCount else {
          return
        }

        let bundleVersionKey = kCFBundleVersionKey as String
        let currentVersion = bundle.object(forInfoDictionaryKey: bundleVersionKey) as? String
        let lastVersion = defaults.string(forKey: versionKey)

        guard lastVersion == nil || lastVersion != currentVersion else {
          return
        }

        print("should let review for version \(currentVersion ?? "version not availabe")")
            
        defaults.set(0, forKey: reviewKey)
        
        let alert = UIAlertController(title: "Rate this app", message: "Please support us by rating this app!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Rate now", style: .default, handler: { (acr) in
                
            defaults.set(currentVersion, forKey: versionKey)
                
            var components = URLComponents(url: URL(string: urlString)!, resolvingAgainstBaseURL: false)

            // this will show the review prompt when loading the app store page
            // only works on a real device with app store
            components?.queryItems = [
                URLQueryItem(name: "action", value: "write-review")
            ]

            guard let writeReviewURL = components?.url else {
                return
            }

            UIApplication.shared.open(writeReviewURL)
        }))
        alert.addAction(UIAlertAction(title: "Later", style: .destructive, handler: { (act) in
        }))
        referennceVC.present(alert, animated: true, completion: nil)

  }

}

