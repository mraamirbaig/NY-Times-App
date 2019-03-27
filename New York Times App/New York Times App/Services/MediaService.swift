//
//  MediaService.swift
//  New York Times App
//
//  Created by Aamir Baig on 3/26/19.
//  Copyright © 2019 Aamir Baig. All rights reserved.
//

import Foundation

class MediaService {
    
    func createMediaArrayFromJSONArray(_ jsonArray: [Any]) -> [Media]? {
        
        var mediaArray: [Media]?
        
        for json in jsonArray {
            if let mediaDict = json as? [String: Any], let type = mediaDict["type"] as? String, let metadataJsonArray = mediaDict["media-metadata"] as? [Any], let mediaMetaData = createMediaMetaDataArrayFromJSONArray(metadataJsonArray) {
                
                var media = Media.init(type: type, metaData: mediaMetaData)
                media.caption = mediaDict["caption"] as? String
                media.copyright = mediaDict["copyright"] as? String
                if mediaArray == nil {
                    mediaArray = [media]
                }else{
                    mediaArray!.append(media)
                }
            }
        }
        return mediaArray
    }
    
    private func createMediaMetaDataArrayFromJSONArray(_ jsonArray: [Any]) -> [Media.MetaData]? {
        
        var metaDataArray: [Media.MetaData]?
        
        for json in jsonArray {
            if let metaDataDict = json as? [String: Any], let urlStr = metaDataDict["url"] as? String, let format = metaDataDict["format"] as? String {
                
                let metaData = Media.MetaData.init(urlStr: urlStr, format: format)
                if metaDataArray == nil {
                    metaDataArray = [metaData]
                }else{
                    metaDataArray!.append(metaData)
                }
            }
        }
        return metaDataArray
    }
}
