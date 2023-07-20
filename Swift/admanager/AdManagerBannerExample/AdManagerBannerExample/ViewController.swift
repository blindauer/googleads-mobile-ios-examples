//
//  Copyright (C) 2015 Google, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import GoogleMobileAds
import UIKit

class ViewController: UIViewController, GADBannerViewDelegate {

  /// The AdManager banner view.
  @IBOutlet weak var bannerView: GAMBannerView!


    override func viewDidLoad() {
        super.viewDidLoad()
        print("Google Mobile Ads SDK version: \(GADMobileAds.sharedInstance().sdkVersion)")

        // GAM test ad
//        bannerView.adUnitID = "/6499/example/banner"

        // TN banner test ad
//        bannerView.adUnitID = "/2897118/test-mobile-in-app-mediation/test_tn_ios_banner"
        
        // Evan's test ad
        bannerView.adUnitID = "/2897118/adopsplayground/testdevice-medrect"
        //"/2897118/test-mobile-in-app-mediation/test_tn_ios_keyboardmedrect"
        
        bannerView.rootViewController = self
        bannerView.isAutoloadEnabled = false
        bannerView.delegate = self
        
        let request = GAMRequest()
        bannerView.load(request)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Uncomment to see the ad inspector
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { _ in
            GADMobileAds.sharedInstance().presentAdInspector(from: self) { error in
                print(error)
            }
        }
    }
    
    func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("bannerViewDidReceiveAd")
    }
    
    func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
        print("bannerView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    
    func bannerViewDidRecordImpression(_ bannerView: GADBannerView) {
        print("bannerViewDidRecordImpression")
    }
    
    func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
        print("bannerViewWillPresentScreen")
    }
    
    func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
        print("bannerViewWillDIsmissScreen")
    }
    
    func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
        print("bannerViewDidDismissScreen")
    }
}
