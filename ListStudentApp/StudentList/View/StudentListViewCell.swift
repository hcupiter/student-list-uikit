//
//  StudentListViewCell.swift
//  ListStudentApp
//
//  Created by Hans Arthur Cupiterson on 17/02/25.
//

import Foundation
import UIKit

class StudentListViewCell: UICollectionViewCell {
    private var studentDataView: StudentDataView?
    var student: Student? {
        didSet {
            guard let student = student else { return }
            studentDataView?.set(student)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension StudentListViewCell {
    func setup() {
        guard studentDataView == nil else { return }
        
        let view = StudentDataView()
        view.translatesAutoresizingMaskIntoConstraints = false
        self.studentDataView = view
        self.contentView.addSubview(view)
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            view.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            view.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        ])
    }
}
