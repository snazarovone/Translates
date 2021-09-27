//
//  DownloadImgManager.swift
//  Translates
//
//  Created by Sergey Nazarov on 26.09.2021.
//

import Foundation
import Kingfisher

enum DownloadImgManager {
    static func setImage(with url: URL?,
                         imageView: UIImageView,
                         placeholder: UIImage? = nil) {
        
        imageView.image = placeholder
        
        guard let url = url else {
            return
        }
        
        let imageResource = ImageResource(downloadURL: url)
        imageView.kf.setImage(
            with: .network(imageResource),
            placeholder: placeholder,
            options: [],
            progressBlock: nil
        )
    }
}
