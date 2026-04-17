/* 
*   File: KJ_Tool_Formatter.cls
*   Authors: Slate Thompson (Slate@kintyjones.com)
*   Created: 4/1/2026
*   Description: This class is built to format various data into string format

*/

public with sharing class KJ_Tool_Formatter {
    //*-- Constants -------------------------------------------------------------------------------
    public static final String HORIZONTAL_DELIMITER = '; ';
    public static final String VERTICAL_DELIMITER = '\n===============================================================================================\n';

    //*-- Member Methods --------------------------------------------------------------------------
    //* toString()
    // origin to string
    public static String toString (KJ_Tool_Origin targetOrigin){
        switch on targetOrigin.sourceType{
            when APEX   { return (targetOrigin.fileName + ': ' + targetOrigin.className + '.' + targetOrigin.methodName); }
            when RECORD { return (targetOrigin.objectName + ': ' + targetOrigin.recordId); }
            when else   { return 'UNSPECIFIED'; }
        }
    }
    // log entry to string
    public static String toString(KJ_Tool_LogEntry logEntry){
        String result;
        result = '\n\n\nL O G   E N T R Y' + VERTICAL_DELIMITER;


        result += 'Level: ';
        result += toString(logEntry.getLevel());
        result += HORIZONTAL_DELIMITER;
 

        result += 'Origin: ';
        result += toString(logEntry.getOrigin());
        result += HORIZONTAL_DELIMITER;
    

        result += 'Timestamp: ';
        Datetime logEntryTimestamp = logEntry.getTimestamp();
        if(logEntryTimestamp != null){
            result += logEntryTimestamp.format();
        } 
        else{
            result += 'UNSPECIFIED';
        }
        result += HORIZONTAL_DELIMITER + '\n\n'; //end of line 1 of log entry string


        result += 'Message: \n';
        String logEntryMessage = logEntry.getMessage();
        if(logEntryMessage != null){
            result += logEntryMessage;
        } 
        else {
            result += 'UNSPECIFIED';
        }
        result += VERTICAL_DELIMITER;


        return result;
    }
    public static String toString(KJ_Tool_LogEntry.Level targetLevel){
        switch on targetLevel{
            when ERROR  { return 'ERROR'; }
            when WARN   { return 'WARN'; }
            when INFO   { return 'INFO'; }
            when DEBUG  { return 'DEBUG'; }
            when else   { return 'UNSPECIFIED'; }
        }
    }
    // Exception to string
    public static String toString(KJ_Tool_Exception e){
        String result;
        result = 'EXCEPTION:\n';
        
        result += 'Code: ' + toString(e.code) + '\n';
        result += 'Level: ' + toString(e.level) + '\n';
        result += 'Origin: (' + toString(e.origin) + ')\n';
        result += 'Message: \n' + e.message + '\n';

        return result;
    }
     public static String toString(KJ_Tool_Exception.Code targetCode){
        switch on targetCode{
            when TEST_EXCEPTION { return 'TEST_EXCEPTION'; }
            when else           { return 'UNSPECIFIED'; }
        }
    }
     public static String toString(KJ_Tool_Exception.Level targetLevel){
        switch on targetLevel{
            when LOW    { return 'LOW'; }
            when HIGH   { return 'HIGH'; }
            when FATAL  { return 'FATAL'; }
            when else   { return 'UNSPECIFIED'; }
        }
    }

    //* toLogEntry()
    public static KJ_Tool_LogEntry toLogEntry(KJ_Tool_Exception e){
        KJ_Tool_LogEntry result = new KJ_Tool_LogEntry(
            KJ_Tool_LogEntry.mapToLogEntryLevel(e.level),
            e.origin,
            toString(e)
        );

        return result;
    }
}