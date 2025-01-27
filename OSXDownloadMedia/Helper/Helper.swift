//
//  Helper.swift
//  OSXDownloadMedia
//
//  Created by Angelos Staboulis on 27/1/25.
//

import Foundation
import WebKit
class Helper{
    init(){}
}
extension Helper{
    func removeWebViewCache(completion: @escaping () -> ()) {
        let dataStore = WKWebsiteDataStore.default()
        dataStore.fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
            dataStore.removeData(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), for: records, completionHandler: completion)
        }
    }
}
