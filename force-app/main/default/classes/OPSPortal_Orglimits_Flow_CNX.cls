public class OPSPortal_Orglimits_Flow_CNX {
    @InvocableMethod(callout=true label='Get Account Name')
    public static void fetchLimitsData(List<Id> recordIds) {
        // Set the Named Credential's label
        String namedCredentialLabel = URL.getSalesforceBaseUrl().toExternalForm();
        
        // Create an HTTP request to fetch the limits data using the Named Credential
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:' + namedCredentialLabel + '/services/data/v58.0/limits');
        req.setMethod('GET');

        // This is a Salesforce built-in method provided by the UserInfo class. It returns the session ID of the current user's session.
        req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());

        // Create an HTTP instance and send the request to get the response
        Http http = new Http();
        HttpResponse res = http.send(req);

        // Check if the response status code is 200 (OK)
        if (res.getStatusCode() == 200) {
            // Process the response body (JSON data) from the limits API
            String responseBody = res.getBody();
            System.debug('Response Body: ' + responseBody);
            
            // Parse and extract the desired limits information from the JSON response
            // calls method which fetches the limits information
            Map<String, Object> limitsMap = (Map<String, Object>) JSON.deserializeUntyped(responseBody);
            Map<String, Object> dataStorageLimits = (Map<String, Object>) limitsMap.get('DataStorageMB');
            Map<String, Object> fileStorageLimits = (Map<String, Object>) limitsMap.get('FileStorageMB');

            // Delete existing records from the custom object "OPSPortal_Orglimits_CNX__c"
            deleteExistingRecords();

            // Get the Organization ID dynamically
            String orgId = getOrganizationId();

            // Get Organization Name, Instance Name, and isSandbox fields from Organization object
            Organization orgInfo = [SELECT Name, InstanceName, IsSandbox FROM Organization LIMIT 1];
            String orgName = orgInfo.Name;
            String instanceName = orgInfo.InstanceName;
            Boolean isSandbox = orgInfo.IsSandbox;

            // Store the extracted data along with the Organization ID in a new record of the custom object "OPSPortal_Orglimits_CNX__c"
            storeDataInCustomObject(orgId, dataStorageLimits, fileStorageLimits, orgName, instanceName, isSandbox);
        } else {
            // Handle the response error and log the error message
            String errorMessage = 'Error: ' + res.getStatusCode() + ' - ' + res.getStatus();
            System.debug(errorMessage);
        }
    }

    private static void deleteExistingRecords() {
        try {
            List<OPSPortal_Orglimits_CNX__c> existingRecords = [SELECT Id FROM OPSPortal_Orglimits_CNX__c];
            delete existingRecords;
            System.debug('Existing records deleted successfully.');
        } catch (Exception e) {
            System.debug('Error deleting existing records: ' + e.getMessage());
        }
    }

    private static String getOrganizationId() {
        String orgId;
        try {
            Organization orgInfo = [SELECT Id FROM Organization LIMIT 1];
            orgId = orgInfo.Id;
        } catch (Exception e) {
            System.debug('Error fetching Organization ID: ' + e.getMessage());
            orgId = null;
        }
        return orgId;
    }

    private static void storeDataInCustomObject(String orgId, Map<String, Object> dataStorageLimits, Map<String, Object> fileStorageLimits, String orgName, String instanceName, Boolean isSandbox) {
        try {
            // Create a new record in the custom object "OPSPortal_Orglimits_CNX__c"
            OPSPortal_Orglimits_CNX__c storageDetails = new OPSPortal_Orglimits_CNX__c();
            storageDetails.OrgId__c = orgId;
            storageDetails.DataStorgaeMax_CNX__c = (Double) dataStorageLimits.get('Max');
            storageDetails.DataStorgaeRemaining_CNX__c = (Double) dataStorageLimits.get('Remaining');
            storageDetails.FileStorageMax_CNX__c = (Double) fileStorageLimits.get('Max');
            storageDetails.FileStorageRemaining_CNX__c = (Double) fileStorageLimits.get('Remaining');
            storageDetails.Org_name_CNX__c = orgName;
            storageDetails.InstanceName_CNX__c = instanceName;
            storageDetails.isSandbox_CNX__c = isSandbox;
            // You can add more fields to the custom object and set their values here

            // Insert the record
            insert storageDetails;
            System.debug('Storage details stored successfully.');
        } catch (Exception e) {
            System.debug('Error storing data in custom object: ' + e.getMessage());
        }
    }
}