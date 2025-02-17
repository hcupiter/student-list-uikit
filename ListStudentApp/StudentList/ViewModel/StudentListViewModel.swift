//
//  StudentListViewModel.swift
//  ListStudentApp
//
//  Created by Hans Arthur Cupiterson on 17/02/25.
//

protocol StudentListViewModelDelegate: AnyObject {
    
}

protocol StudentListViewModelProtocol: AnyObject {
    var studentList: [Student] { get set }
}

class StudentListViewModel: StudentListViewModelProtocol {
    var studentList: [Student] = []
    
    init() {
        studentList = Student.getStudent()
    }
}
