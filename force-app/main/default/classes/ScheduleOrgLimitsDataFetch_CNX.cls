public class ScheduleOrgLimitsDataFetch_CNX implements Schedulable {
    public void execute(SchedulableContext context) {
           OPSPortal_Orglimitsdata_CNX obj = new OPSPortal_Orglimitsdata_CNX(); 
           Database.executeBatch(obj);
    }
}