//
//  ContentView.swift
//  Barbershop Appointment App
//
//  Created by Aleksandar Acev on 27.1.25.
//

import SwiftUI

struct AppointmentListView: View {
    @State private var appointments: [Appointment] = AppointmentStore.shared.load() // Load saved data
    @State private var isShowingAddAppointment = false
    
    var body: some View {
        NavigationStack {
            List(appointments) { appointment in
                AppointmentRowView(appointment: appointment)
            }
            .navigationTitle("Upcoming Appointments")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowingAddAppointment.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isShowingAddAppointment) {
                AddAppointmentView(appointments: $appointments)
            }
        }.onChange(of: appointments) {
            AppointmentStore.shared.save(appointments) // Auto-save when appointments change
        }
    }
}

// Reusable row for each appointment
struct AppointmentRowView: View {
    let appointment: Appointment
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(appointment.clientName)
                    .font(.headline)
                Spacer()
                Text(appointment.date, style: .time)
            }
            
            Text(appointment.serviceType)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            if let notes = appointment.notes {
                Text(notes)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    AppointmentListView()
}
