/* 
*   File: KJ_Tool_Formatter.cls
*   Authors: Slate Thompson (Slate@kintyjones.com)
*   Created: 4/1/2026
*   Description: This class is built to format various data into string format

*/

public with sharing class KJ_Tool_Formatter {
    // -- Constants -------------------------------------------------------------------------------
    public static final String HORIZONTAL_DELIMITER = ';  ';
    public static final String VERTICAL_DELIMITER = '\n========================================\n';

    // -- Member Methods --------------------------------------------------------------------------
    public static String format(Object formatTarget){
        String result = '';

        if (formatTarget == null){
            result = null;
            return result;
        }
        if (formatTarget instanceof KJ_Tool_LogEntry){
            result = formatLogEntry((KJ_Tool_LogEntry) formatTarget);
        }

        return result;
    }

    private static String formatLogEntry(KJ_Tool_LogEntry logEntry){
        String result;
        result = '\n\n\nL O G   E N T R Y' + VERTICAL_DELIMITER;

        // formatting level
        KJ_Tool_LogEntry.Level logEntryLevel = logEntry.getLevel();
        result += 'Level: ';
        
        switch on logEntryLevel{
            when ERROR { result += 'ERROR'; }
            when WARN { result += 'WARN'; }
            when INFO { result += 'INFO'; }
            when DEBUG { result += 'DEBUG'; }
            when else { result += 'UNSPECIFIED'; }
        }

        result += HORIZONTAL_DELIMITER;


        // formatting context
        String logEntryContext = logEntry.getContext(); 
        result += 'Context: ';

        if(logEntryContext == null){
            result += 'UNSPECIFIED';
        } 
        else{
            result += logEntryContext;
        }

        result += HORIZONTAL_DELIMITER;
    
        // formatting timestamp
        Datetime logEntryTimestamp = logEntry.getTimestamp();
        result += 'Timestamp: ';

        if(logEntryTimestamp == null){
            result += 'UNSPECIFIED';
        } 
        else{
            result += logEntryTimestamp.format();
        }
        result += HORIZONTAL_DELIMITER + '\n\N'; //end of line 1 of log entry string

        // formatting message / data
        String logEntryMessage = logEntry.getMessage();
        Object logEntryData = logEntry.getData();

        if(logEntryMessage != null){
            result += 'Message:\n' + logEntryMessage;
            if(logEntryData != null){
                result += '\n';
            }
        }

        if(logEntryData != null){
            result += 'Data: \n' + format(logEntryData);
        }

        result += VERTICAL_DELIMITER;

        return result;
    }
}