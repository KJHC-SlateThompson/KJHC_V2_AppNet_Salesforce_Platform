/* 
*   File: KJ_Tool_Result.cls
*   Authors: Slate Thompson (Slate@kintyjones.com)
*   Created: 4/22/2026
*   Description: This class is built to provide a universal format for returning results

*/
public with sharing class KJ_Tool_Result {
    //*-- Member Variables ------------------------------------------------------------------------
    public Boolean  isSuccess   { get; private set; }
    public String   message     { get; private set; }

    public List<KJ_Tool_Exception>  exceptions  { get; private set; }
    public Boolean                  hasFatals   { get; private set; }
    public Boolean                  hasWarnings { get; private set; }

    //*-- Member Methods --------------------------------------------------------------------------
    public void addExcepetion(KJ_Tool_Exception e){

    }
}