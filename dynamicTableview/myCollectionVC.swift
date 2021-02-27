//
//  myCollectionVC.swift
//  dynamicTableview
//
//  Created by 이예진 on 2021/01/14.
//

import Foundation
import UIKit

class myCollectionVC: UIViewController {
    
    @IBOutlet weak var mySegmentControl: UISegmentedControl!
    @IBOutlet weak var myCollectionVIew: UICollectionView!
    
    
    fileprivate let systemImageNameArray = [ "moon","zzz","sparkles","tornado","cloud","smoke.fill","tv.fill","gamecontroller","headphones","flame","bolt.fill","hare","tortoise","moon","zzz","sparkles","tornado","cloud","smoke.fill","tv.fill","gamecontroller","headphones","flame","bolt.fill","hare","tortoise","ant","car","airplane","heart","bandage","signature","cart","bag","creditcard","clock","alarm","stopwatch","timer"
    ]
    
    
    
    //MARK: - Lifecycles  //메소드 찾기가 쉬움
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("myCollectionVC - viewDidLoad called")
        
        //콜렉션뷰에 대한 설정
        myCollectionVIew.autoresizingMask = [.flexibleWidth, .flexibleHeight] //가로세로 크기 유동적으로
        myCollectionVIew.dataSource = self
        myCollectionVIew.delegate = self
        
        
        //사용할 콜렉션뷰 셀을 등록 1
        
        //닙파일을 가져온다 1-1
        //let myTableViewCellNib = UINib(nibName: "myCustomCollectionViewCell", bundle: nil) 이거랑 동일
        let myCustomCollectionViewCellNib = UINib(nibName: String(describing: myCustomCollectionViewCell.self), bundle: nil)
        
        //가져온 닙파일로 콜렉션뷰에 셀로 등록한다 1-2
        self.myCollectionVIew.register(myCustomCollectionViewCellNib, forCellWithReuseIdentifier: String(describing: myCustomCollectionViewCell.self))
        
       //콜렉션뷰의 콜렉션뷰 레이아웃을 설정한다
        self.myCollectionVIew.collectionViewLayout = createCompositionalLayoutForFirst()
        
        
        
    }
    
    
    @IBAction func onCollectionViewTypeChanged(_ sender: UISegmentedControl) {
        
        print("mycollectioVC - onCollectionViewTypeChanged() called / sender.selectedSegmentIndex : \(sender.selectedSegmentIndex)")
        
        switch sender.selectedSegmentIndex {
        case 0: // 테이블뷰 형태
            self.myCollectionVIew.collectionViewLayout = createCompositionalLayoutForFirst()
        case 1: // 2*2 그리드 형태
            self.myCollectionVIew.collectionViewLayout = createCompositionalLayoutForSecond()
        case 2: // 3*3 그리드 형태
            self.myCollectionVIew.collectionViewLayout = createCompositionalLayoutForThird()
        default:
            break
        }
        
        
    }
    
    

}
    
    //MARK: - 콜렉션뷰 콤포지셔널 레이아웃 관련 (너무 길어지니까 익스텐션으로 뺌)
    
    extension myCollectionVC {
        
        //콤포지셔널 레이아웃 설정
        fileprivate func createCompositionalLayoutForFirst() -> UICollectionViewLayout {
            print("createCompositionalLayoutForFirst() called")
            
            //콤포지셔널 레이아웃 생성
            let layout = UICollectionViewCompositionalLayout {
                (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
                
                //아이템에 대한 사이즈 - .absolute:고정값, estimated:추측, fraction:퍼센트,
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                
                //위에서 만든 아이템 사이즈로 아이템 만들기
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                //아이템 간의 간격 설정
                item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
                
                // *변동될 부분 1
                let groupHeight = NSCollectionLayoutDimension.fractionalWidth(1/3)
                
                //그룹 사이즈
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension:groupHeight) //그룹 헤이트의 높이만큼 하겠다
                
                //그룹 사이즈로 그룹 만들기
              //  let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item, item])
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1) // *변동될 부분 2 (카운트만)
                
                //그룹으로 섹션 만들기
                let section = NSCollectionLayoutSection(group: group)
//                section.orthogonalScrollingBehavior = .continuous //옆으로 스크롤하게 하는식도 가능
                
                //섹션에 대한 간격 설정
                section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
                
                        // * 아이템이 모여서 그룹을 만들고 그룹이 모여서 섹션을 만든다 * //
                return section
                
            }
            return layout
        }
        
        
        
        //콤포지셔널 레이아웃 설정
        fileprivate func createCompositionalLayoutForSecond() -> UICollectionViewLayout {
            print("createCompositionalLayoutForSecond() called")
            
            //콤포지셔널 레이아웃 생성
            let layout = UICollectionViewCompositionalLayout {
                (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
                
                //아이템에 대한 사이즈 - .absolute:고정값, estimated:추측, fraction:퍼센트,
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                
                //위에서 만든 아이템 사이즈로 아이템 만들기
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                //아이템 간의 간격 설정
                item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
                
                // *변동될 부분 1
                let groupHeight = NSCollectionLayoutDimension.fractionalWidth(1/2)
                
                //그룹 사이즈
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension:groupHeight) //그룹 헤이트의 높이만큼 하겠다
                
                //그룹 사이즈로 그룹 만들기
              //  let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item, item])
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2) // *변동될 부분 2 (카운트만)
                
                //그룹으로 섹션 만들기
                let section = NSCollectionLayoutSection(group: group)
//                section.orthogonalScrollingBehavior = .continuous //옆으로 스크롤하게 하는식도 가능
                
                //섹션에 대한 간격 설정
                section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
                
                        // * 아이템이 모여서 그룹을 만들고 그룹이 모여서 섹션을 만든다 * //
                return section
                
            }
            return layout
        }
        
        
        //콤포지셔널 레이아웃 설정
        fileprivate func createCompositionalLayoutForThird() -> UICollectionViewLayout {
            print("createCompositionalLayoutForThird() called")
            
            //콤포지셔널 레이아웃 생성
            let layout = UICollectionViewCompositionalLayout {
                (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
                
                //아이템에 대한 사이즈 - .absolute:고정값, estimated:추측, fraction:퍼센트,
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                
                //위에서 만든 아이템 사이즈로 아이템 만들기
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                //아이템 간의 간격 설정
                item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
                
                // *변동될 부분 1
                let groupHeight = NSCollectionLayoutDimension.fractionalWidth(1/3)
                
                //그룹 사이즈
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension:groupHeight) //그룹 헤이트의 높이만큼 하겠다
                
                //그룹 사이즈로 그룹 만들기
              //  let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item, item])
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3) // *변동될 부분 2 (카운트만)
                
                //그룹으로 섹션 만들기
                let section = NSCollectionLayoutSection(group: group)
//                section.orthogonalScrollingBehavior = .continuous //옆으로 스크롤하게 하는식도 가능
                
                //섹션에 대한 간격 설정
                section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
                
                        // * 아이템이 모여서 그룹을 만들고 그룹이 모여서 섹션을 만든다 * //
                return section
                
            }
            return layout
        }
    }
    
    
    


// 데이터 소스 설정 - 데이터와 관련된것들
extension myCollectionVC: UICollectionViewDataSource {
    //각 섹션에 들어가는 아이템 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.systemImageNameArray.count
    }
    //각 콜렉션뷰 셀에 대한 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
      //  let cellID = String(describing: MyCollectionViewCell.self)
      //  print("cellID : \(cellID)")
        
        
        
        // 셀의 인스턴스를 가져온거 (메모리를 재활용하기 위해서 하는거)
     //   let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MyCollectionViewCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: myCustomCollectionViewCell.self), for: indexPath) as! myCustomCollectionViewCell
        
        
        cell.imageName = self.systemImageNameArray[indexPath.item]
        
        
//        cell.contentView.backgroundColor = #colorLiteral(red: 0.5583657512, green: 0.3596042174, blue: 0.6704582254, alpha: 1)
//        cell.contentView.layer.cornerRadius = 10
//        cell.contentView.layer.borderWidth = 2
//        cell.contentView.layer.borderColor = #colorLiteral(red: 0.3865746953, green: 0.2272565577, blue: 0.4456160946, alpha: 1)
//
        
        //데이터에 따른 셀 UI 변경
        //이미지에 대한 설정
     //   cell.profileImg.image = UIImage(systemName: self.systemImageNameArray[indexPath.item])
     //   cell.profileLabel.text = self.systemImageNameArray[indexPath.item]
        /* 주석처리한거 다 콜렉트뷰셀파일로 갖고감 거기서 이름 만들어서(혹은 그냥 옮겨서) 그렇게 할수도 있음 */
        
        return cell
    }
    
    
}
// 콜렉션뷰 딜리게이트 - 액션과 관련된것들
extension myCollectionVC: UICollectionViewDelegate {
    
}
