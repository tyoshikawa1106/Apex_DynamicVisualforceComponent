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
public with sharing class DynamicComponentSampleController {
	
	public Account account {get; set;}
	
	/*
	 * DynamicComponentSampleController
	 */
	public DynamicComponentSampleController() {
		this.account = new Account();
	}
	
	/*
	 * getDynamicPageBlock
	 */
	public Component.Apex.PageBlock  getDynamicPageBlock() {
		
		// PageBlock
		Component.Apex.PageBlock dynamicPageBlock = getPageBlock();
		
		// Add PageBlockSecion
		Component.Apex.PageBlockSection dynamicPageBlockSection = getPageBlockSection();
		dynamicPageBlock.childComponents.add(dynamicPageBlockSection);
		
		// Add InputField
		Component.Apex.InputField dynamicAccountName = getAccountName();
		dynamicPageBlockSection.childComponents.add(dynamicAccountName);
		
		// Add InputField
		Component.Apex.InputField dynamicAccountNumber = getAccountNumber();
		dynamicPageBlockSection.childComponents.add(dynamicAccountNumber);
		
		// Add InputText
		Component.Apex.InputText dynamicInputText = getAccountSite();
		dynamicPageBlockSection.childComponents.add(dynamicInputText);
		
		// Add PageBlockButtons
		Component.Apex.PageBlockButtons dynamicPageBlockButtons = getPageBlockButtons();
		dynamicPageBlock.childComponents.add(dynamicPageBlockButtons);
		
		// Add CommandButton
		Component.Apex.CommandButton saveButton = getCommandButton();		
		dynamicPageBlockButtons.childComponents.add(saveButton);
		
		return dynamicPageBlock;
	}
	
	/*
	 * getPageBlock
	 */
	private Component.Apex.PageBlock getPageBlock() {
		return new Component.Apex.PageBlock(
			 title    = 'Account Block'
			,id       = 'AccountBlock_Id'
			,mode     = 'edit'
			,tabStyle = 'Account'
		);
	}
	
	/*
	 * getPageBlockSection
	 */
	private Component.Apex.PageBlockSection getPageBlockSection() {
		return new Component.Apex.PageBlockSection(
			 title       = 'Account Section'
			,id          = 'AccountSection_Id'
			,collapsible = false
		);
	}
	
	/*
	 * getAccountName
	 */
	private Component.Apex.InputField getAccountName() {
		Component.Apex.InputField dynamicAccountName = new Component.Apex.InputField();
		dynamicAccountName.expressions.value = '{!account.Name}';
		dynamicAccountName.id                = 'AccountName_Id';
		return dynamicAccountName;
	}
	
	/*
	 * getAccountNumber
	 */
	private Component.Apex.InputField getAccountNumber() {
		Component.Apex.InputField dynamicAccountNumber = new Component.Apex.InputField();
		dynamicAccountNumber.expressions.value = '{!account.AccountNumber}';
		dynamicAccountNumber.id                = 'AccountNumber_Id';
		return dynamicAccountNumber;
	}
	
	/*
	 * getAccountSite
	 */
	private Component.Apex.InputText getAccountSite() {
		Component.Apex.InputText dynamicInputText = new Component.Apex.InputText();
		dynamicInputText.expressions.label = '{!$ObjectType.Account.Fields.Site.Label}';
		dynamicInputText.expressions.value = '{!account.Site}';
		dynamicInputText.id                = 'AccountSite_Id';
		return dynamicInputText;
	}
	
	/*
	 * getPageBlockButtons
	 */
	private Component.Apex.PageBlockButtons getPageBlockButtons() {
		return new Component.Apex.PageBlockButtons(
			location = 'bottom'
		);
	}
	
	/*
	 * getCommandButton
	 */
	private Component.Apex.CommandButton getCommandButton() {
		Component.Apex.CommandButton saveButton = new Component.Apex.CommandButton();
		saveButton.value = 'Save';
		saveButton.expressions.action = '{!doSave}';
		
		Set<String> rereders = new Set<String>{'form'};
		saveButton.rerender = rereders;
		return saveButton;
	}
	
	/*
	 * doSave
	 */
	public void doSave() {
		upsert this.Account;
		ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Save!! : ' + this.Account.Name));
	}
}