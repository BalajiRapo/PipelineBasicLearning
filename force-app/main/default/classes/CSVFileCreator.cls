public class CSVFileCreator {
    public static void sendCSVByEmail(String toAddress) {
        // 1. Query data
        List<Lead> leads = [SELECT FirstName, LastName, Company, Email FROM Lead LIMIT 10];

        // 2. Build CSV header
        String csvContent = 'First Name,Last Name,Company,Email\n';

        // 3. Build CSV rows
        for (Lead l : leads) {
            csvContent += 
                '"' + (l.FirstName != null ? l.FirstName : '') + '",' +
                '"' + (l.LastName  != null ? l.LastName  : '') + '",' +
                '"' + (l.Company   != null ? l.Company   : '') + '",' +
                '"' + (l.Email     != null ? l.Email     : '') + '"\n';
        }

        // 4. Convert to Blob
        Blob csvBlob = Blob.valueOf(csvContent);

        // 5. Create Email attachment
        Messaging.EmailFileAttachment attachment = new Messaging.EmailFileAttachment();
        attachment.setFileName('LeadData.csv');
        attachment.setBody(csvBlob);
        attachment.setContentType('text/csv');

        // 6. Create Email
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
        email.setToAddresses(new String[] { 'balajia@cnxsi.com' });
        email.setSubject('Lead Data CSV Export');
        email.setPlainTextBody('Hello,\n\nPlease find attached the CSV export of Leads.\n\nRegards,\nSalesforce');
        email.setFileAttachments(new Messaging.EmailFileAttachment[] { attachment });

        // 7. Send Email
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { email });
        if (results[0].success) {
            System.debug('Email sent successfully with CSV attachment.');
        } else {
            System.debug('Failed to send email: ' + results[0].errors[0].message);
        }
    }
}