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

    func fetchContacts( ) {
        contacts.removeAll()
        let store = CNContactStore()
        var bos:String = "1";
        
        store.requestAccess(for: .contacts) { (granted, error) in
            if let error = error {
                print("failed to request access", error)
                bos = "2";
                return
            }
            if granted {
                print("si acepto")
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
                    bos = "3"
                }
                
            } else {
                print("access denied")
              bos = "4"
            }
        }
        
    }
}
