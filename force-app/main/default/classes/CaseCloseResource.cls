@RestResource(urlMapping='/case/*/close')
global with sharing class CaseCloseResource {

    @HttpPost
    global static String closeCase(String reason) {
        RestRequest req = RestContext.request;

        // Extract caseId from the URL and validate it
        // 
        String[] uriParts = req.requestURI.split('/');
        String caseIdString = uriParts[2]; 
        System.debug('Request URI: ' + req.requestURI);

        
        system.debug('case ids'+caseIdString);
        system.debug('case reason'+reason);
        if (String.isBlank(caseIdString)) {
            RestContext.response.statusCode = 400;
            return 'Error: Case ID is missing in the URL.';
        }

        if (String.isBlank(reason)) {
            RestContext.response.statusCode = 400;
            return 'Error: Close reason cannot be null or empty.';
        }

        try {
            Id caseId = Id.valueOf(caseIdString);
            Set<Id> caseIds = new Set<Id> { caseId };
           system.debug('caseIds data'+caseIds);
            system.debug('caseIds reason'+reason);
            // Call the service method
            CaseService.closeCases(caseIds, reason);
            
            return 'Case ' + caseId + ' has been successfully closed with reason: ' + reason;
        } catch (AuraHandledException e) {
            RestContext.response.statusCode = 404;
            return 'Error: ' + e.getMessage();
        } catch (Exception e) {
            RestContext.response.statusCode = 500;
            return 'Unexpected error: ' + e.getMessage();
        }
    }
}