//
//  MyCollectionViewCell.swift
//  dynamicTableview
//
//  Created by 이예진 on 2021/01/14.
//

import Foundation
import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var profileLabel: UILabel!
    
    var imageName : String = "" {
        didSet{
            print("myCollectionViewCell  / imageName - didSet() : \(imageName)")
            
            //셀의 UI에 대한 설정
            self.profileImg.image = UIImage(systemName: imageName)
            self.profileLabel.text = imageName
            //원래 있던 네임을 이미지네임으로
            }
    
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("myCollectionViewCell - awakeFromeNib() Called")
        self.contentView.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        contentView.layer.cornerRadius = 15
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        //셀프 있어도 되고 아예 없애도 되고 동일함
    }
    
}
