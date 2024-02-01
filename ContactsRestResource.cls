@RestResource(urlMapping='/contactAPI/*')
global class ContactsRestResource {
    
    @HTTPGet
    global static list<Contact> getContactsList()
    {
        // Initializing the request parameter from the external request
        RestRequest contactRequest = RestContext.request;
        
        // Getting the URL from the Request
        string requestURL = contactRequest.requestURI;
        
        // Getting the limit specified in the URL
        Integer contactsLimit = Integer.valueOf(requestURL.substring(requestURL.lastIndexOf('/')+1));
        
        return [SELECT ID, Name from Contact LIMIT :contactsLimit]; 
        
    }
}