//
//  myTableViewCell.swift
//  dynamicTableview
//
//  Created by 이예진 on 2020/12/23.
//

import Foundation
import UIKit

class myTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var userContentLabel: UILabel!
    
    
    
    
    //셀이 랜더링(뷰가 그려짐)될때
    override func awakeFromNib() {
        super.awakeFromNib()
        
        print("MyTableViewCell - awakeFromNib() called")
        
        userProfileImage.layer.cornerRadius = userProfileImage.frame.width / 2
        
        
        
    }
    
    
    
}



