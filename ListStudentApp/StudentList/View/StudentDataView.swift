//
//  StudentDataView.swift
//  ListStudentApp
//
//  Created by Hans Arthur Cupiterson on 17/02/25.
//

import UIKit

protocol StudentDataViewProtocol: AnyObject {
    func set(_ student: Student)
}

class StudentDataView: UIView {
    private lazy var studentName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private lazy var studentAddress: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var studentProfilePicture: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    
    private lazy var studentDataStack: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 4
        view.alignment = .leading
        return view
    }()
    
    private lazy var container: UIView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 8
        view.alignment = .leading
        view.backgroundColor = .tertiarySystemFill
        view.layer.cornerRadius = 6
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StudentDataView: StudentDataViewProtocol {
    func set(_ student: Student) {
        self.studentName.text = student.name
        self.studentAddress.text = student.address
        
        if let image = UIImage(named: student.profilePicture) {
            self.studentProfilePicture.image = image
        }
    }
}

private extension StudentDataView {
    func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.studentDataStack.addArrangedSubview(studentName)
        self.studentDataStack.addArrangedSubview(studentAddress)
        
        self.container.addSubview(studentProfilePicture)
        self.container.addSubview(studentDataStack)
        
        self.addSubview(container)
        
        setupConstraint()
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            studentProfilePicture.heightAnchor.constraint(equalToConstant: 100),
            studentProfilePicture.widthAnchor.constraint(equalToConstant: 75),
            
            studentProfilePicture.leadingAnchor.constraint(
                equalTo: container.leadingAnchor,
                constant: 32
            ),
            studentDataStack.leadingAnchor.constraint(
                equalTo: studentProfilePicture.trailingAnchor,
                constant: 16
            ),
            studentDataStack.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            studentProfilePicture.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            studentDataStack.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            
            container.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            container.topAnchor.constraint(equalTo: self.topAnchor),
            container.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
}
