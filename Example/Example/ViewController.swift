import UIKit
import SnapKit
import ZMRatingBarView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let ratingBarView = RatingBarView()
        ratingBarView.score = 4.5
        ratingBarView.maxScore = 5
        ratingBarView.starColor = UIColor(red:0.95, green:0.75, blue:0.30, alpha:1.00)
        ratingBarView.starSize = 14
        ratingBarView.starSpaceSize = 2
        self.view.addSubview(ratingBarView)
        ratingBarView.snp.makeConstraints { (make) in
            make.left.right.centerY.equalTo(self.view)
            make.height.equalTo(100)
        }
    }
}

