//
//  Appointment.swift
//  Barbershop Appointment App
//
//  Created by Aleksandar Acev on 28.1.25.
//

import Foundation

struct Appointment: Identifiable, Codable, Equatable { // Add Codable for saving to UserDefaults
    let id = UUID()
    var clientName: String
    var date: Date
    var serviceType: String
    var phoneNumber: String
    var notes: String?
}

// Sample data for testing
extension Appointment {
    static let sampleAppointments = [
        Appointment(
            clientName: "John Doe",
            date: Date().addingTimeInterval(86400), // Tomorrow
            serviceType: "Haircut",
            phoneNumber: "+1 555 123 4567"
        ),
        Appointment(
            clientName: "Jane Smith",
            date: Date().addingTimeInterval(172800), // Day after tomorrow
            serviceType: "Beard Trim",
            phoneNumber: "+1 555 765 4321",
            notes: "Prefers clipper guard #3"
        )
    ]
}
