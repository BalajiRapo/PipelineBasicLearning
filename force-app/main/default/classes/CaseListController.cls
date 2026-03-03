public class CaseListController {
    public List<Case> caseList { get; set; }
    
    public CaseListController() {
        // Query for Case records
        caseList = [SELECT Id, CaseNumber, Subject, Status, CreatedDate FROM Case];
    }
}