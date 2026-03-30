@isTest
private class KJ_Tool_TestDataFactory_Test {
    // Utility functions for test
    private static void logAssert(String label, Object expected, Object actual){
        String logString;
        if(expected == actual){
            logString = '\n' + label + '\nPASS\nExpected: ' + expected + '\tActual: ' + actual + '\n';
            System.Debug(logString);
        } else {
            logString = '\n' + label + '\nFail\nExpected: ' + expected + '\tActual: ' + actual + '\n';
            System.Debug(logString);
            Assert.areEqual(expected, actual);
        }
    }

    // Leads
    @isTest
    static void test_CreateTestLead(){
        // Test Runtime
        Test.startTest();
        Lead testLead1 = KJ_Tool_TestDataFactory.createTestLead();
        Test.stopTest();


        // Assertions
        System.debug('\nCREATE TEST LEAD\n');
        Assert.isNotNull(testLead1);

        logAssert('Company Name',KJ_Tool_TestDataFactory.DEFAULT_COMPANY_NAME, testLead1.Company);
        logAssert('First Name', KJ_Tool_TestDataFactory.DEFAULT_FIRST_NAME,testLead1.FirstName);
        logAssert('Last Name', KJ_Tool_TestDataFactory.DEFAULT_LAST_NAME,testLead1.LastName);
        logAssert('Sector','Commercial',testLead1.Sector__c);
        logAssert('Service Type','Repair',testLead1.Service_Type__c);
        logAssert('Lead Notes', 'Test Lead Notes', testLead1.Lead_Notes__c);

        logAssert('Phone', KJ_Tool_TestDataFactory.DEFAULT_PHONE, testLead1.Phone);
        logAssert('Email', KJ_Tool_TestDataFactory.DEFAULT_EMAIL, testLead1.Email);
        logAssert('Street', KJ_Tool_TestDataFactory.DEFAULT_STREET, testLead1.Street);
        logAssert('City', KJ_Tool_TestDataFactory.DEFAULT_CITY, testLead1.City);
        logAssert('State', KJ_Tool_TestDataFactory.DEFAULT_STATE, testLead1.State);
        logAssert('Postal Code', KJ_Tool_TestDataFactory.DEFAULT_POSTAL_CODE, testLead1.PostalCode);
        logAssert('Country', KJ_Tool_TestDataFactory.DEFAULT_COUNTRY, testLead1.Country);

        logAssert('Lead Source', 'Existing Customer', testLead1.Lead_Source__c);
    }

    // Accounts
    @isTest
    static void test_CreateTestAccount(){
        // Test Runtime
        Test.startTest();
        Account testAccount1 = KJ_Tool_TestDataFactory.createTestAccount();
        Test.stopTest();

        // Assertions
        System.debug('\nCREATE TEST ACCOUNT\n');
        Assert.isNotNull(testAccount1);

        logAssert('Sector', 'Commercial', testAccount1.Account_Sector__c);

        logAssert('Street', KJ_Tool_TestDataFactory.DEFAULT_STREET, testAccount1.BillingStreet);
        logAssert('City', KJ_Tool_TestDataFactory.DEFAULT_CITY, testAccount1.BillingCity);
        logAssert('State', KJ_Tool_TestDataFactory.DEFAULT_STATE, testAccount1.BillingState);
        logAssert('Postal Code', KJ_Tool_TestDataFactory.DEFAULT_POSTAL_CODE, testAccount1.BillingPostalCode);
        logAssert('Country', KJ_Tool_TestDataFactory.DEFAULT_COUNTRY, testAccount1.BillingCountry);

        logAssert('Lead Source', 'Existing Customer', testAccount1.Account_Lead_Source__c);
    }

    // Contacts
    @isTest
    static void test_CreateTestContact(){
        // Test Runtime
        Test.startTest();
        Contact testContact1 = KJ_Tool_TestDataFactory.createTestContact();
        Test.stopTest();
        
        // Assertions
        System.debug('\nCREATE TEST ACCOUNT\n');
        Assert.isNotNull(testContact1);

        logAssert('First Name', KJ_Tool_TestDataFactory.DEFAULT_FIRST_NAME, testContact1.FirstName);
        logAssert('Last Name', KJ_Tool_TestDataFactory.DEFAULT_LAST_NAME, testContact1.LastName);

        logAssert('Phone', KJ_Tool_TestDataFactory.DEFAULT_PHONE, testContact1.Phone);
        logAssert('Email', KJ_Tool_TestDataFactory.DEFAULT_EMAIL, testContact1.Email);

        logAssert('Street', KJ_Tool_TestDataFactory.DEFAULT_STREET, testContact1.MailingStreet);
        logAssert('City', KJ_Tool_TestDataFactory.DEFAULT_CITY, testContact1.MailingCity);
        logAssert('State', KJ_Tool_TestDataFactory.DEFAULT_STATE, testContact1.MailingState);
        logAssert('Postal Code', KJ_Tool_TestDataFactory.DEFAULT_POSTAL_CODE, testContact1.MailingPostalCode);
        logAssert('Country', KJ_Tool_TestDataFactory.DEFAULT_COUNTRY, testContact1.MailingCountry);
    }

    // Projects
    @isTest 
    static void test_CreateTestProject(){
        // Test Runtime
        Test.startTest();
        Project__c testProject1 = KJ_Tool_TestDataFactory.createTestProject();
        Test.stopTest();

        // Assertions
        System.debug('\nCREATE TEST PROJECT\n');
        Assert.isNotNull(testProject1);

        logAssert('Project Name', 'TestProject Name', testProject1.Project_Name__c);
        logAssert('Branch Territory', KJ_Tool_TestDataFactory.DEFAULT_BRANCH_TERRITORY, testProject1.Branch_Territory__c);

    } 

    // Jobs
    @isTest 
    static void test_CreateTestJob(){
        // Test Runtime
        Test.startTest();
        Job__c testJob1 = KJ_Tool_TestDataFactory.createTestJob();
        Test.stopTest();

        // Assertions
        System.debug('\nCREATE TEST JOB\n');
        Assert.isNotNull(testJob1);

        logAssert('Job Status', 'Needs Scheduling', testJob1.Job_Status__c);
        logAssert('Job Sector', 'Commercial', testJob1.Job_Sector__c);
        logAssert('Service Type', 'Repair', testJob1.Service_Type__c);
        logAssert('Branch Territory', KJ_Tool_TestDataFactory.DEFAULT_BRANCH_TERRITORY, testJob1.Branch_Territory__c);

        logAssert('Due Date', KJ_Tool_TestDataFactory.DEFAULT_DATETIME, testJob1.Due_Date__c);
        logAssert('Scheduled Start', KJ_Tool_TestDataFactory.DEFAULT_DATETIME, testJob1.Scheduled_Start__c);
        logAssert('Scheduled End', KJ_Tool_TestDataFactory.DEFAULT_DATETIME, testJob1.Scheduled_End__c);
        logAssert('Actual Start', KJ_Tool_TestDataFactory.DEFAULT_DATETIME, testJob1.Actual_Start__c);
        logAssert('Actual End', KJ_Tool_TestDataFactory.DEFAULT_DATETIME, testJob1.Actual_End__c);
        logAssert('Travel Start', KJ_Tool_TestDataFactory.DEFAULT_DATETIME, testJob1.Travel_Start__c);
        logAssert('Travel End', KJ_Tool_TestDataFactory.DEFAULT_DATETIME, testJob1.Travel_End__c);
    }

    // Customer Properties
    @isTest 
    static void test_CreateTestCustomerProperty(){
        // Test Runtime
        Test.startTest();
        Customer_Property__c testCustomerProperty1 = KJ_Tool_TestDataFactory.createTestCustomerProperty();
        Test.stopTest();

        // Assertions
        System.debug('\nCREATE TEST JOB\n');
        Assert.isNotNull(testCustomerProperty1);

        logAssert('Street', KJ_Tool_TestDataFactory.DEFAULT_STREET, testCustomerProperty1.Property_Address__Street__s);
        logAssert('City', KJ_Tool_TestDataFactory.DEFAULT_CITY, testCustomerProperty1.Property_Address__City__s);
        logAssert('State', KJ_Tool_TestDataFactory.DEFAULT_STATE, testCustomerProperty1.Property_Address__StateCode__s);
        logAssert('Postal Code', KJ_Tool_TestDataFactory.DEFAULT_POSTAL_CODE, testCustomerProperty1.Property_Address__PostalCode__s);
        logAssert('Country', KJ_Tool_TestDataFactory.DEFAULT_COUNTRY, testCustomerProperty1.Property_Address__CountryCode__s);

        logAssert('Property Sector', 'Commercial', testCustomerProperty1.Property_Sector__c);
    }

    // HVAC Units
    @isTest 
    static void test_CreateTest_HVAC_Unit(){
        // Test Runtime
        Test.startTest();
        HVAC_Unit__c test_HVAC_Unit1 = KJ_Tool_TestDataFactory.createTest_HVAC_Unit();
        Test.stopTest();

        // Assertions
        System.debug('\nCREATE TEST CUSTOMER PROPERTY\n');
        Assert.isNotNull(test_HVAC_Unit1);

        logAssert('Unit Birthdate', KJ_Tool_TestDataFactory.DEFAULT_DATE, test_HVAC_Unit1.Unit_Birthdate__c);
        logAssert('Unit Type', 'Split System', test_HVAC_Unit1.Unit_Type__c);
        logAssert('Fuel Type', 'Gas', test_HVAC_Unit1.Fuel_Type__c);

        logAssert('Condenser Model Number', KJ_Tool_TestDataFactory.DEFAULT_ID_NUMBER, test_HVAC_Unit1.Condenser_Model_Number__c);
    }

    // Memberships
    @isTest 
    static void test_CreateTestMembership(){
        // Test Runtime
        Test.startTest();
        Membership__c testMembership1 = KJ_Tool_TestDataFactory.createTestMembership();
        Test.stopTest();

        // Assertions
        System.debug('\nCREATE TEST MEMBERSHIP\n');
        Assert.isNotNull(testMembership1);

        logAssert('Membership Start Date', KJ_Tool_TestDataFactory.DEFAULT_DATE, testMembership1.Membership_Start_Date__c);
        logAssert('Membership Expiration Date', KJ_Tool_TestDataFactory.DEFAULT_DATE, testMembership1.Membership_Expiration_Date__c);
    }
}