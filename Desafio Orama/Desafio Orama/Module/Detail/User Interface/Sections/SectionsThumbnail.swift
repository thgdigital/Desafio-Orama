//
//  SectionsThumbnail.swift
//  Desafio Orama
//
//  Created by THIAGO on 07/10/19.
//  Copyright © 2019 Thiago Santos. All rights reserved.
//

import UIKit
import SafariServices

class SectionsThumbnail: Sections {
    
    override func willDisplayCell(_ cell: CollectionViewCell, at indexPath: IndexPath) {
        if let cellVideo = cell as? ThumbnailCell, let itemDetail = item as? DetailItem {
            cellVideo.populate(urlImage: itemDetail.thumbnailVideo)
        }
    }
    
    override func cell(for indexPath: IndexPath) -> CollectionViewCell.Type {
        return ThumbnailCell.self
    }
    
    override func shouldHighlight(at indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func didSelectCell(_ cell: CollectionViewCell, at indexPath: IndexPath) {
        
        if let itemDetail = item as? DetailItem, let urlVideo = URL(string: itemDetail.urlVideo) {
            let webView = SFSafariViewController(url: urlVideo)
            UIApplication.shared.keyWindow?.visibleViewController()?.present(webView, animated: true)
        }
    }
}
