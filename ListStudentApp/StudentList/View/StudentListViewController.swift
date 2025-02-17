//
//  StudentListViewController.swift
//  ListStudentApp
//
//  Created by Hans Arthur Cupiterson on 17/02/25.
//

import UIKit

class StudentListViewController: UIViewController {
    private lazy var studentListView = StudentListView()
    private lazy var viewModel: StudentListViewModelProtocol = StudentListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setup()
        self.studentListView.viewModel = self.viewModel
    }

}

private extension StudentListViewController {
    func setup() {
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "List Student"
        self.navigationItem.largeTitleDisplayMode = .always
        
        self.view.addSubview(studentListView)
        setConstraint()
    }
    
    func setConstraint() {
        NSLayoutConstraint.activate([
            studentListView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            studentListView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            studentListView.leadingAnchor.constraint(
                equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,
                constant: 16
            ),
            studentListView.trailingAnchor.constraint(
                equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,
                constant: -16
            ),
        ])
    }
}
