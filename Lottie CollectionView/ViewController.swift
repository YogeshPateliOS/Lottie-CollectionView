//
//  ViewController.swift
//  Lottie CollectionView
//
//  Created by Yogesh Patel on 26/12/22.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var animationView: LottieAnimationView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        9
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.lottieAnimationView.animation = LottieAnimation.named("\(indexPath.row + 1)")
        cell.lottieAnimationView.contentMode = .scaleAspectFit
        cell.lottieAnimationView.loopMode = .loop
        cell.lottieAnimationView.animationSpeed = 1.0
        cell.lottieAnimationView.play()
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row % 3 == 0{
            //0,3,6,9
            return CGSize(width: (collectionView.frame.size.width) - 5, height: (collectionView.frame.size.height / 3) - 5)
        }else{
            //1,2,4,5
            return CGSize(width: (collectionView.frame.size.width / 2) - 5, height: (collectionView.frame.size.height / 3) - 5)
        }

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        5
    }

}
