//
//  StudentListView.swift
//  ListStudentApp
//
//  Created by Hans Arthur Cupiterson on 17/02/25.
//

import UIKit

class StudentListView: UICollectionView {
    weak var viewModel: StudentListViewModelProtocol?
    
    init(viewModel: StudentListViewModelProtocol? = nil) {
        self.viewModel = viewModel
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: UIScreen.main.bounds.width, height: 130)
        
        super.init(frame: .zero, collectionViewLayout: layout)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension StudentListView {
    func setup(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.register(StudentListViewCell.self, forCellWithReuseIdentifier: "StudentListViewCell")
        self.dataSource = self
        self.delegate = self
    }
}

extension StudentListView: UICollectionViewDelegate {
    
}

extension StudentListView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.studentList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "StudentListViewCell",
            for: indexPath
        ) as? StudentListViewCell
        else {
            debugPrint("Failed to create cell in Student List View")
            return UICollectionViewCell()
        }
        
        guard let viewModel = viewModel else {
            debugPrint("Student List ViewModel not detected at Student List View")
            return cell
        }
        
        let student = viewModel.studentList[indexPath.item]
        cell.student = student
        return cell
    }
    
    
}
