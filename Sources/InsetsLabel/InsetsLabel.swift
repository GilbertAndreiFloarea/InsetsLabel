import UIKit

@IBDesignable public class InsetsLabel: UILabel {

    @IBInspectable var topInset: CGFloat = 5.0
    @IBInspectable var bottomInset: CGFloat = 5.0
    @IBInspectable var leadingInset: CGFloat = 7.0
    @IBInspectable var trailingInset: CGFloat = 7.0

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(
            top: topInset,
            left: leadingInset,
            bottom: bottomInset,
            right: trailingInset
        )
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(
            width: size.width + leadingInset + trailingInset,
            height: size.height + topInset + bottomInset
        )
    }

    override var bounds: CGRect {
        didSet {
            preferredMaxLayoutWidth = bounds.width - leadingInset - trailingInset
        }
    }
}
