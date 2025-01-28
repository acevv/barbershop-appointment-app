//
//  AppointmentStore.swift
//  Barbershop Appointment App
//
//  Created by Aleksandar Acev on 28.1.25.
//

import Foundation

class AppointmentStore {
    static let shared = AppointmentStore() // Singleton instance
    
    private let key = "SavedAppointments"
    
    // Save appointmets to UserDefaults
    func save(_ appointments: [Appointment]) {
        do {
            let encoded = try JSONEncoder().encode(appointments)
        } catch {
            print("Error saving appointments: \(error)")
        }
    }
    
    //Load appointments from UserDefaults
    func load() -> [Appointment] {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return []
        }
        do {
            return try JSONDecoder().decode([Appointment].self, from: data)
        } catch {
            print("Error loading appointments: \(error)")
            return []
        }
    }
    
}

