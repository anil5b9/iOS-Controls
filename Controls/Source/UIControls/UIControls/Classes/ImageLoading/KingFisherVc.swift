//
//  KingFisherVc.swift
//  ThirdPartyControls
//
//  Created by Satya on 29/08/18.
//  Copyright © 2018 Hiddenbrains. All rights reserved.
//

import UIKit
import Kingfisher

class KingFisherVc: UIViewController {
    @IBOutlet weak var objCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        objCollection.register(UINib(nibName: "CollectionViewCel", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCel")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension KingFisherVc: UICollectionViewDelegate, UICollectionViewDataSource {
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
     func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        // This will cancel all unfinished downloading task when the cell disappearing.
        (cell as! CollectionViewCel).cellImageView.kf.cancelDownloadTask()
    }
    
     func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let url = URL(string: "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-\(indexPath.row + 1).jpg")!
        
        _ = (cell as! CollectionViewCel).cellImageView.kf.setImage(with: url,
                                                                    placeholder: nil,
                                                                    options: [.transition(ImageTransition.fade(1))],
                                                                    progressBlock: { receivedSize, totalSize in
                                                                        print("\(indexPath.row + 1): \(receivedSize)/\(totalSize)")
        },
                                                                    completionHandler: { image, error, cacheType, imageURL in
                                                                        print("\(indexPath.row + 1): Finished")
        })
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCel", for: indexPath) as! CollectionViewCel
        cell.cellImageView.kf.indicatorType = .activity
        return cell
    }
}

extension KingFisherVc: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        let urls = indexPaths.compactMap {
            URL(string: "https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-\($0.row + 1).jpg")
        }
        
        ImagePrefetcher(urls: urls).start()
    }
}


// Inspired by: https://fdp.io/blog/2018/03/22/supporting-compactmap-in-swift-4/
#if swift(>=4.1)
    // This is provided by the stdlib
#else
    extension Sequence {
        func compactMap<T>(_ transform: (Self.Element) throws -> T?) rethrows -> [T] {
            return try flatMap(transform)
        }
    }
#endif
