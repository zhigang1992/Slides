private let slideSize = CGSize(width: 1024, height: 768)

let titleLabelStyle = useTextColor(UIColor(0x34A5DA))
    |> useFont(.boldSystemFontOfSize(150))
    |> useAdjustsFontSizeToFitWidth(true)

let subtitleLabelStyle = useTextColor(UIColor(0xA6AAA9))
    |> useFont(.systemFontOfSize(45))
    |> useAdjustsFontSizeToFitWidth(true)

let listTitleStyle = useTextColor(UIColor(0x34A5DA))
    |> useFont(.boldSystemFontOfSize(56))

let listContentStyle = useTextColor(UIColor(0x838787))
    |> useFont(.systemFontOfSize(34))

public struct Slides {
    public let render: () -> UIView
    
    public static func Title(text: String) -> Slides {
        return Slides {
            let view = master()
            view.addSubview(
                UILabel(frame: CGRect(x: 44, y: 250, width: 940, height: 150))
                    |> titleLabelStyle
                    |> useTitle(text)
            )
            return view
        }
    }
    public static func Title(text:String, subtitle: String) -> Slides {
        return Slides {
            let view = master()
            view.addSubview(
                UILabel(frame: CGRect(x: 40, y: 508, width: 940, height: 150))
                    |> titleLabelStyle
                    |> useTitle(text)
            )
            view.addSubview(
                UIView(frame: CGRect(x: 30, y: 480, width: 960, height: 3))
                    |> useBackgroundColor(UIColor(0xA6AAA9))
            )
            view.addSubview(
                UILabel(frame: CGRect(x: 40, y: 420, width: 940, height: 56))
                    |> subtitleLabelStyle
                    |> useTitle(subtitle)
            )
            return view
        }
    }
    public static func Image(image: UIImage) -> Slides {
        return Slides {
            let imageView = UIImageView()
                |> useImage(image)
                |> useContentMode(.ScaleAspectFit)
            imageView.sizeToFit()
            return imageView
        }
    }
    public static func Image(image: String) -> Slides {
        return self.Image(UIImage(named: image)!)
    }
    public static func List(title: String, items: [String]) -> Slides {
        return Slides {
            let view = master()
            view.addSubview(
                UIView(frame: CGRect(x: 30, y: 78, width: 960, height: 3))
                    |> useBackgroundColor(UIColor(0xA6AAA9))
            )
            view.addSubview(
                UILabel(frame: CGRect(x: 30, y: 122, width: 960, height: 60))
                    |> useTitle(title)
                    |> listTitleStyle
            )
            let itemsText = items.map({"• \($0)"}).joinWithSeparator("\n\n")
            view.addSubview(
                UILabel(frame: CGRect(x: 30, y: 208, width: 960, height: 500))
                    |> useTitle(itemsText)
                    |> listContentStyle
                    |> useMultipleLines
            )
            return view
        }
    }
}

extension Slides {
    static func master() -> UIView {
        let container = UIView(frame: CGRect(origin: .zero, size: slideSize))
        container.backgroundColor = UIColor(0x222222)
        return container
    }
}
