import UIKit

@IBDesignable
open class RatingBarView: UIView {

    fileprivate let fillStarsView = StarsView()
    fileprivate let strokeStarsView = StarsView()

    @IBInspectable open var score: CGFloat = 0 {
        didSet {
            drawStarViews()
        }
    }

    @IBInspectable open var maxScore: CGFloat = 5 {
        didSet {
            drawStarViews()
        }
    }

    @IBInspectable open var starSize: CGFloat = 14.0 {
        didSet {
            drawStarViews()
        }
    }

    @IBInspectable open var starSpaceSize: CGFloat = 2.0 {
        didSet {
            drawStarViews()
        }
    }

    @IBInspectable open var starColor: UIColor = UIColor(red:0.95, green:0.75, blue:0.30, alpha:1.00) {
        didSet {
            drawStarViews()
        }
    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        drawStarViews()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.white
    }

    func drawStarViews() {
        self.fillStarsView.removeFromSuperview()
        self.strokeStarsView.removeFromSuperview()
        let width = self.frame.width
        let height = self.frame.height
        if width <= 0 || height <= 0 {
            return
        }
        let starsWidth = (self.starSize + self.starSpaceSize) * CGFloat(self.maxScore) - self.starSpaceSize
        var centerX = (width - starsWidth) / 2
        if centerX < 0 {
            centerX = 0
        }
        var centerY = (height - self.starSize) / 2
        if centerY < 0 {
            centerY = 0
        }
        if self.score == 0 {
            self.drawStrokeStarsView(centerX, centerY: centerY, width: starsWidth)
            return
        }
        if self.score >= self.maxScore {
            self.drawFillStarsView(centerX, centerY: centerY, width: starsWidth)
            return
        }
        self.drawStrokeStarsView(centerX, centerY: centerY, width: starsWidth)
        self.drawFillStarsView(centerX, centerY: centerY, width: ceil(self.score / self.maxScore * starsWidth))
    }

    func drawStrokeStarsView(_ centerX: CGFloat, centerY: CGFloat, width: CGFloat) {
        self.strokeStarsView.isOnlyDrawStroke = true
        self.strokeStarsView.numberOfStars = Int(self.maxScore)
        self.strokeStarsView.starColor = self.starColor
        self.strokeStarsView.starSize = self.starSize
        self.strokeStarsView.starSpaceSize = self.starSpaceSize
        self.strokeStarsView.backgroundColor = self.backgroundColor
        self.strokeStarsView.frame = CGRect(x: centerX, y: centerY, width: width, height: self.starSize)
        self.addSubview(self.strokeStarsView)
    }

    func drawFillStarsView(_ centerX: CGFloat, centerY: CGFloat, width: CGFloat) {
        self.fillStarsView.numberOfStars = Int(self.maxScore)
        self.fillStarsView.starColor = self.starColor
        self.fillStarsView.starSize = self.starSize
        self.fillStarsView.starSpaceSize = self.starSpaceSize
        self.fillStarsView.backgroundColor = self.backgroundColor
        self.fillStarsView.frame = CGRect(x: centerX, y: centerY, width: width, height: self.starSize)
        self.addSubview(self.fillStarsView)
    }
}
