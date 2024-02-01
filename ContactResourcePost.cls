@RestResource(urlMapping='/CreateContactAPI/*')
global with sharing class ContactResourcePost {
    
    @HTTPPost
    global static Contact createContact(string firstName,string lastName,string birthDate, string description)
    {

        Contact contactRec = new Contact();
        contactRec.FirstName = firstName;
        contactRec.LastName = lastName;
        contactRec.Birthdate = date.parse(birthDate);
        contactRec.Description = description;

        insert contactRec;

        return contactRec;
    }
}