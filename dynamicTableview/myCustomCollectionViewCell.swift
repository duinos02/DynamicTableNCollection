//
//  myCustomCollectionViewCell.swift
//  dynamicTableview
//
//  Created by 이예진 on 2021/01/18.
//

import Foundation
import UIKit

class myCustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var profileLabel: UILabel!
    
    
    var imageName : String = "" {
        didSet{
            print("myCustomCollectionViewCell  / imageName - didSet() : \(imageName)")
            
            //셀의 UI에 대한 설정
            self.profileImg.image = UIImage(systemName: imageName)
            self.profileLabel.text = imageName
            //원래 있던 네임을 이미지네임으로
            }
    
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("myCustomCollectionViewCell - awakeFromeNib() Called")
        self.contentView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.8731460754, blue: 0.5010856202, alpha: 1)
        contentView.layer.cornerRadius = 15
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = #colorLiteral(red: 0.4711787565, green: 0.4262515447, blue: 0.2424872644, alpha: 1)
        //셀프 있어도 되고 아예 없애도 되고 동일함
    }
    
}
