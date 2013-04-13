/*
 * Dynamic Visualforce Component
 * © 2013 Force.com Developer
 * ----------------------------------------
 * @createdDate      : 2013/01/01
 * @createdName      : TAIKI,YOSHIKAWA
 * ----------------------------------------
 * @lastModifiedDate : 2013/01/01
 * @lastModifiedName : TAIKI,YOSHIKAWA
 * ----------------------------------------
 */
@isTest
private class DynamicComponentSampleControllerTest {
	
	/*
	 * DynamicComponentSampleControllerTest
	 */
    static testMethod void DynamicComponentSampleControllerTest() {
        DynamicComponentSampleController cls = new DynamicComponentSampleController();
    }
    
    /*
	 * getDynamicPageBlockTest
	 */
    static testMethod void getDynamicPageBlockTest() {
        DynamicComponentSampleController cls = new DynamicComponentSampleController();
        cls.getDynamicPageBlock();
    }
    
    /*
	 * doSaveTest
	 */
    static testMethod void doSaveTest() {
        DynamicComponentSampleController cls = new DynamicComponentSampleController();
        cls.account.Name = 'Account Name';
        cls.account.AccountNumber = '0000';
        cls.doSave();
    }
}