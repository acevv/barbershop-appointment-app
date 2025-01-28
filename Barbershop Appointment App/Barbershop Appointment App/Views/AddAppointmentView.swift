//
//  AddAppointmentView.swift
//  Barbershop Appointment App
//
//  Created by Aleksandar Acev on 28.1.25.
//

import SwiftUICore
import SwiftUI

struct AddAppointmentView: View {
    @Binding var appointments: [Appointment]
    @Environment(\.dismiss) private var dismiss
    
    // Form state variables
    @State private var clientName = ""
    @State private var selectedDate = Date()
    @State private var serviceType = "Haircut"
    @State private var phoneNumber = ""
    @State private var notes = ""
    
    let serviceTypes = ["Haircut", "Beard Trim", "Shave", "Coloring"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Client Info") {
                    TextField("Name", text: $clientName)
                    TextField("Phone Number", text: $phoneNumber)
                        .keyboardType(.phonePad)
                }
                
                Section("Appointment Details") {
                    DatePicker("Date & Time", selection: $selectedDate)
                    Picker("Service Type", selection: $serviceType) {
                        ForEach(serviceTypes, id: \.self) { service in
                            Text(service)
                        }
                    }
                }
                
                Section("Notes") {
                    TextField("Additional notes (optional)", text: $notes, axis: .vertical).lineLimit(4, reservesSpace: true)
                }
            }
            .navigationTitle("New Appointment")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newAppointment = Appointment(
                            clientName: clientName,
                            date: selectedDate,
                            serviceType: serviceType,
                            phoneNumber: phoneNumber,
                            notes: notes.isEmpty ? nil : notes
                        )
                        appointments.append(newAppointment)
                        dismiss()
                    }
                    .disabled(clientName.isEmpty || phoneNumber.isEmpty)
                }
            }
        }
    }
}

#Preview {
    AddAppointmentView(appointments: .constant([]))
}
