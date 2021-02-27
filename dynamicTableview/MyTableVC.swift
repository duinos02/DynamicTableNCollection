//
//  ViewController.swift
//  dynamicTableview
//
//  Created by 이예진 on 2020/12/22.
//

import UIKit

class MyTableVC: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    let contentArray = [
    "안녕하세요"
      ,"반갑습니다"
       ,"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        ,"강아지 고양이"
        ,"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
        ,"HI"
        ,"좋은 하루 되세요!"
        
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
      
        //셀 리소스 파일 가져오기
      //  let myTableViewCellNib = UINib(nibName: "myTableViewCell", bundle: nil)
        let myTableViewCellNib = UINib(nibName: String(describing: myTableViewCell.self), bundle: nil)
        
        //셀에 리소스 등록
        self.myTableView.register(myTableViewCellNib, forCellReuseIdentifier: "myTableViewCell")
        self.myTableView.rowHeight = UITableView.automaticDimension
        self.myTableView.estimatedRowHeight = 150        //예상하는 셀의 높이
      //  self.myTableView.rowHeight = 200;       //위 코드만 쓰면 높이가 잘려나와서 추가 ++ xib파일에서 밑에 버튼을 바닥으로부터 앵커를 새로 잡아줬더니 이제 제대로 나옴
        
        
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
       
        
        print("contentArray.count : \(contentArray.count)")
        
    }

    
}
    
    
    extension MyTableVC : UITableViewDelegate {
        
        
    }
    
extension MyTableVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myTableViewCell", for: indexPath) as! myTableViewCell
        cell.userContentLabel.text = contentArray[indexPath.row]
    
        return cell
    }
    
}



