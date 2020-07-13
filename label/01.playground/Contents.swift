//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.attributedText = amountText(input: "15 Aug")
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }

    private func amountText(input: String) -> NSAttributedString {
        let dayAsString = matchForRegexInText(regex: "\\d+", text: input)
        let dayAsAtributeString = NSMutableAttributedString(string: dayAsString[0],
                                                            attributes:  [.font : UIFont.systemFont(ofSize: 22)])

        print(input)
        let monthAsString = matchForRegexInText(regex: "[a-zA-Z]+", text: input)
        let monthAsAttributeString = NSMutableAttributedString(string: monthAsString[0],
                                                               attributes: [.font: UIFont.systemFont(ofSize: 12)])


        dayAsAtributeString.append(monthAsAttributeString)
        return dayAsAtributeString
    }

    private func matchForRegexInText(regex: String!, text: String!) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}

PlaygroundPage.current.liveView = MyViewController()
