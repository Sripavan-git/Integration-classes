@RestResource(urlMapping='/CreateContactAPI1/')
global with sharing class ContactResourcePostDeserialize {
    
    @HTTPPost
    global static Contact createContact()
    {
        // initializing the request parameter with the incoming request
        RestRequest contactRequest = RestContext.request;

        // getting the request body from the URL request
        string reqBody = contactRequest.requestBody.toString();

        // Deserializing the JSON response body and assign that JSON response to a Contacts instance
        Contact contactRec = (Contact) JSON.deserialize(reqBody, Contact.class);

        insert contactRec;

        return contactRec;
    }
}