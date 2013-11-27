/**
 * Dynamic Visualforce Component
 * © 2013 Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class DynamicComponentSampleControllerTest {
    
    /**
     * DynamicComponentSampleControllerTest
     */
    static testMethod void DynamicComponentSampleControllerTest() {
        
        Test.startTest();
        
        DynamicComponentSampleController cls = new DynamicComponentSampleController();
        
        Test.stopTest();
    }
    
    /**
     * getDynamicPageBlockTest
     */
    static testMethod void getDynamicPageBlockTest() {
        
        Test.startTest();
        
        DynamicComponentSampleController cls = new DynamicComponentSampleController();
        cls.getDynamicPageBlock();
        
        Test.stopTest();
    }
    
    /**
     * doSaveTest
     */
    static testMethod void doSaveTest() {
        
        Test.startTest();
        
        DynamicComponentSampleController cls = new DynamicComponentSampleController();
        cls.account.Name = 'Account Name';
        cls.account.AccountNumber = '0000';
        cls.doSave();
        
        Test.stopTest();
    }
}