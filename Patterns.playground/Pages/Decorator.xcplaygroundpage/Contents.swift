//
//  main.swift
//  Patterns
//
//  Created by Олег Колбаса on 23.02.2022.
//

import Foundation

protocol FillingStudentData {
    func record() -> String
}

final private class StudentData: FillingStudentData {
    
    func record() -> String {
        return "Student's record-book"
    }
    
}

private class Decorator: FillingStudentData {
    
    private var subject: FillingStudentData
    
    init(subject: FillingStudentData) {
        self.subject = subject
    }
    
    func record() -> String {
        return subject.record()
    }
    
}

final private class PhoneNumberDecorator: Decorator {
    override func record() -> String {
        return "+7(853)666-55-44\n\(super.record())"
    }
}

final private class FullNameDecorator: Decorator {
    override func record() -> String {
        return "Andrew Hopkins\n\(super.record())"
    }
}

final private class BirthdayDecorator: Decorator {
    override func record() -> String {
        return "21.02.1976\n\(super.record())"
    }
}

final private class CourseNumberDecorator: Decorator {
    override func record() -> String {
        return "2 course\n\(super.record())"
    }
}

final class Client {
    static func someClientCode(subject: FillingStudentData) {
        print("Result:\n\(subject.record())")
    }
    
    static func printOut() {
        someClientCode(subject: BirthdayDecorator(subject: FullNameDecorator(subject: PhoneNumberDecorator(subject: StudentData()))))
    }
}

Client.printOut()
