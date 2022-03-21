import SwiftUI
import Contacts

struct Contact: Identifiable, Hashable {
    var id = UUID()
    var firstName: String //= "No firstName"
    var lastName: String //= "No lastName"
    var phoneNumbers: [String] //= []
    var emailAddresses: [String]// = []

}

class FetchedContacts: ObservableObject, Identifiable {

    @Published var contacts = [Contact]()

    func fetchContacts() {
        contacts.removeAll()
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { (granted, error) in
            if let error = error {
                print("failed to request access", error)
                return
            }
            if granted {
                let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey, CNContactEmailAddressesKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                do {
                    try store.enumerateContacts(with: request, usingBlock: { (contact, stopPointer) in

                 //       DispatchQueue.main.async {
                            self.contacts.append(Contact(firstName: contact.givenName, lastName: contact.familyName, phoneNumbers: contact.phoneNumbers.map { $0.value.stringValue }, emailAddresses: contact.emailAddresses.map { $0.value as String }
                            ))

                            self.contacts.sort(by: { $0.firstName < $1.firstName })
                   //     }
                    })

                } catch let error {
                    print("Failed to enumerate contact", error)
                }

            } else {
                print("access denied")
            }
        }
    }
}
