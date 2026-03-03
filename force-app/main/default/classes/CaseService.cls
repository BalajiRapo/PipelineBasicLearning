public class CaseService {
    public static void closeCases(Set<Id> caseIds, String closeReason) {
        // Validate input parameters
        if (caseIds == null || caseIds.isEmpty() || String.isBlank(closeReason)) {
            throw new AuraHandledException('Case IDs and close reason cannot be null or empty.');
        }

        // Fetch cases
        List<Case> casesToClose = [SELECT Id, Status FROM Case WHERE Id IN :caseIds];
        if (casesToClose.isEmpty()) {
            throw new AuraHandledException('No valid Case records found for the provided IDs.');
        }

         // Update each case
        for (Case c : casesToClose) {
            c.Status = 'Closed';  // Assuming 'Closed' is valid in your org
            c.Reason = closeReason;
        }

        update casesToClose;
    }
}