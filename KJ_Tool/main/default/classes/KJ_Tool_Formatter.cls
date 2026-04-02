/* 
*   File: KJ_Tool_Formatter.cls
*   Authors: Slate Thompson (Slate@kintyjones.com)
*   Created: 4/1/2026
*   Description: This class is built to format various data into string format

*/

public with sharing class KJ_Tool_Formatter {

    // -- Member Methods --------------------------------------------------------------------------
    public static String format(Object formatTarget){
        String result = '';

        if (formatTarget == null){
            result = null;
        }
        if (formatTarget instanceof KJ_Tool_LogEntry){
            result = formatLogEntry((KJ_Tool_LogEntry) formatTarget);
        }

        return result;
    }

    private static String formatLogEntry(KJ_Tool_LogEntry logEntry){

        // Building formatted log entry string
        String result = '';

        // formatting line 1/header of result string
        switch on logEntry.getLevel() {
            when ERROR { result += 'ERROR | '; }
            when WARN { result += 'WARN | '; }
            when INFO { result += 'INFO | '; }
            when else { result += 'DEBUG | '; }
        }

        result += logEntry.getContext() + ' | ';
        result += logEntry.getTimestamp().format() + '\n';

        // Formatting Message / Data
        if(logEntry.getMessage() != null){
            result += logEntry.getMessage() + '\n';
        }
        if(logEntry.getData() != null){
            result += format(logEntry.getData()) + '\n';
        }

        return result;
    }
}