public class ShowCaseStatussController {
    @AuraEnabled
    public static CaseWrapper getCases(){
        List<Case> newCases = new List<Case>();
        List<Case> workingCases = new List<Case>();
        List<Case> closedCases = new List<Case>();
        List<Case> caseList = [SELECT Id,CaseNumber,Subject,Status FROM Case];
        if(caseList != null && caseList.size()>0){
            for(Case c: caseList){
                if(c.Status == 'New'){
                    newCases.add(c);
                }
                else if(c.Status == 'Working'){
                    workingCases.add(c); 
                }
                else if(c.Status == 'Closed'){
                    closedCases.add(c); 
                }
            }
            CaseWrapper cw = new CaseWrapper();
            cw.workingCases = workingCases;
            cw.closedCases = closedCases;
            cw.newCases = newCases;
            cw.caseCount = caseList.size();
            return cw;
        }
        return null;         
    }
    public class CaseWrapper{
        @AuraEnabled
        public List<Case> workingCases;
        @AuraEnabled
        public List<Case> closedCases;
        @AuraEnabled
        public List<Case> newCases;
        @AuraEnabled
        public Integer caseCount;
    }
    @AuraEnabled
    public static CaseWrapper updateCase(Id caseId, String status){
        System.debug(status);
        System.debug(caseId);
        Case c = new Case();
        c.Id = caseId;
        c.Status = status;
        update c;
        return getCases();
    }
}
