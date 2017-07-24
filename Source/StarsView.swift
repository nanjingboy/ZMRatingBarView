import UIKit

class StarsView: UIView {

    var numberOfStars: Int = 5 {
        didSet {
            setNeedsDisplay()
        }
    }

    var starSize: CGFloat = 14.0 {
        didSet {
            setNeedsDisplay()
        }
    }

    var starSpaceSize: CGFloat = 2.0 {
        didSet {
            setNeedsDisplay()
        }
    }

    var starColor: UIColor = UIColor.yellow {
        didSet {
            setNeedsDisplay()
        }
    }

    var isOnlyDrawStroke: Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        var point = CGPoint(x: 0, y: 0)
        for _ in 0..<self.numberOfStars {
            let frame = CGRect(x: point.x, y: point.y, width: self.starSize, height: self.starSize)
            drawStar(frame)
            point.x = point.x + self.starSize + self.starSpaceSize
        }
    }

    func drawStar(_ frame: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: frame.minX + 0.50000 * frame.width, y: frame.minY + 0.00000 * frame.height))
        path.addLine(to: CGPoint(x: frame.minX + 0.60940 * frame.width, y: frame.minY + 0.34942 * frame.height))
        path.addLine(to: CGPoint(x: frame.minX + 0.97553 * frame.width, y: frame.minY + 0.34549 * frame.height))
        path.addLine(to: CGPoint(x: frame.minX + 0.67702 * frame.width, y: frame.minY + 0.55752 * frame.height))
        path.addLine(to: CGPoint(x: frame.minX + 0.79389 * frame.width, y: frame.minY + 0.90451 * frame.height))
        path.addLine(to: CGPoint(x: frame.minX + 0.50000 * frame.width, y: frame.minY + 0.68613 * frame.height))
        path.addLine(to: CGPoint(x: frame.minX + 0.20611 * frame.width, y: frame.minY + 0.90451 * frame.height))
        path.addLine(to: CGPoint(x: frame.minX + 0.32298 * frame.width, y: frame.minY + 0.55752 * frame.height))
        path.addLine(to: CGPoint(x: frame.minX + 0.02447 * frame.width, y: frame.minY + 0.34549 * frame.height))
        path.addLine(to: CGPoint(x: frame.minX + 0.39060 * frame.width, y: frame.minY + 0.34942 * frame.height))
        path.close()
        let context = UIGraphicsGetCurrentContext()
        context?.addPath(path.cgPath)
        if self.isOnlyDrawStroke {
            context?.setStrokeColor(self.starColor.cgColor)
            context?.strokePath()
        } else {
            context?.setFillColor(self.starColor.cgColor)
            context?.fillPath()
        }
    }
}
