@RestResource(urlMapping='/contactAPIParams/*')
global class contactResourceParams {
    
    @HTTPGet
    global static list<Account> getAccountsList()
    {
        // Initializing the request parameter with the incoming req
        RestRequest AccountRequest = RestContext.request;
        
        // getting the parameters from the URL
        map<String,String> AccountsReqParams = AccountRequest.params;
        
        // getting each parameter from the URL
        Integer accountsLimit = Integer.valueOf(AccountsReqParams.get('limit'));
        
        String accountIndustry = AccountsReqParams.get('industry');
        
        return [SELECT ID,Name, Industry from Account where Industry =:accountIndustry LIMIT :accountsLimit];
    }

}