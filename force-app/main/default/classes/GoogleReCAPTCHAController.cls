public class GoogleReCAPTCHAController {
    public Boolean verified { get; private set; }
    public String response {
        get {
            return ApexPages.currentPage().getParameters().get('g-recaptcha-response');
        }
    }
    public String firstName { get; set; }
    public String lastName { get; set; }
    public String email { get; set; }
    public String publicKey { get; set; }

    private String remoteHost {
        get {
            String ret = '127.0.0.1';
            Map<String, String> hdrs = ApexPages.currentPage().getHeaders();
            if (hdrs.get('x-original-remote-addr') != null)
                ret = hdrs.get('x-original-remote-addr');
            else if (hdrs.get('X-Salesforce-SIP') != null)
                ret = hdrs.get('X-Salesforce-SIP');
            return ret;
        }
    }

    private static String secretKey = '6Le6hyEnAAAAANXTIVu2r0lx5H3ZlyhGoKN39GVm';
    private static String baseUrl = 'https://www.google.com/recaptcha/api/siteverify';

    private static final String DEFAULT_ACCOUNTNAME = 'ALANGATI BALAJI';
    private static final String EXTERNAL_USER_PROFILE = 'Custom Community User';
    private static final String TZSID = [SELECT timezonesidkey FROM User WHERE profile.name = 'System Administrator' LIMIT 1].timezonesidkey;

    public GoogleReCAPTCHAController() {
        this.publicKey = '6Le6hyEnAAAAAGCygeRFcd-0Et1bvPp6aQ4sI6NH';
        this.verified = false;
    }

    public PageReference submit() {
        if (response == null) {
            // Google reCAPTCHA empty response
            return null;
        }

        HttpResponse res = getGoogleReCAPTCHAResponse(baseUrl, 'secret=' + secretKey + '&remoteip=' + remoteHost + '&response=' + response);
        System.debug('reCAPTCHA Response-' + res);
        System.debug('reCAPTCHA Body-' + res.getBody());

        if (res != null) {
            JSONParser parser = JSON.createParser(res.getBody());
            while (parser.nextToken() != null) {
                if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'success')) {
                    parser.nextToken();
                    this.verified = parser.getBooleanValue();
                    break;
                }
            }
        }

        if (this.verified) {
            system.debug('verified');
            Contact newContact = createContact(firstName, lastName, email);
                User u = new User();
                u.Username = email;
                u.Email = email;
                u.LastName = lastName;
                u.FirstName = firstName;
                String alias = firstName + lastName;
                if (alias.length() > 8) {
                    alias = alias.substring(0, 8);
                }
                u.Alias = alias;
                u.LanguageLocaleKey = UserInfo.getLanguage();
                u.LocaleSidKey = UserInfo.getLocale();
                u.EmailEncodingKey = 'UTF-8';
                u.TimeZoneSidKey = TZSID;

                Profile p = [SELECT Id FROM Profile WHERE Name = 'Custom Community User'];
                System.debug('Found profile: ' + p);

                u.ProfileId = p.Id;

                // Associate the contact with the user
                u.ContactId = newContact.Id;

                try {
                    system.debug('new contact data'+newContact);
                   // upsert newContact;
                    System.debug('Contact created for ' + email + ', ID: ' + newContact.Id);

                    insert u;
                    System.debug('User created: ' + u);

                    // Add your logic here
                    return forwardToAuthPage();
                } catch (Exception e) {
                    System.debug('Error creating contact or user: ' + e.getMessage());
                    return null;
                }
            
        }

        String startUrl = System.currentPageReference().getParameters().get('startURL');
        String displayType = System.currentPageReference().getParameters().get('display');
        return Network.forwardToAuthPage(startUrl, displayType);
    }

    private static HttpResponse getGoogleReCAPTCHAResponse(String requestURL, String body) {
        HttpResponse response = null;
        HttpRequest req = new HttpRequest();
        req.setEndpoint(requestURL);
        req.setMethod('POST');
        req.setBody(body);

        try {
            Http http = new Http();
            response = http.send(req);
            System.debug('reCAPTCHA Response-' + response);
            System.debug('reCAPTCHA Body-' + response.getBody());
        } catch (System.Exception ex) {
            System.debug('ERROR Message-' + ex.getMessage());
        }

        return response;
    }

    public PageReference forwardToAuthPage() {
        String startUrl = System.currentPageReference().getParameters().get('startURL');
        String displayType = System.currentPageReference().getParameters().get('display');
        return Network.forwardToAuthPage(startUrl, displayType);
    }

    private static Contact createContact(String firstName, String lastName, String email) {
        System.debug('Creating Contact: firstName-' + firstName + ', lastName-' + lastName + ', email-' + email);
        Contact contact = new Contact();
        contact.FirstName = firstName;
        contact.LastName = lastName;
        contact.Email = email;

        // Set Account Id
        List<Account> accounts = [SELECT Id FROM Account WHERE Name = :DEFAULT_ACCOUNTNAME];
        if (!accounts.isEmpty()) {
            contact.AccountId = accounts[0].Id;
        }

        try {
            insert contact;
            System.debug('Contact created for ' + email + ', ID: ' + contact.Id);
            return contact;
        } catch (Exception e) {
            System.debug('Error creating contact: ' + e.getMessage());
            return null;
        }
    }
}