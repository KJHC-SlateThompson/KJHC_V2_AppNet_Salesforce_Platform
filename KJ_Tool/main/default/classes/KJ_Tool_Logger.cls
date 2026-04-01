/* 
*   File: KJ_Tool_Logger.cls
*   Version: [0.1.0 - Pre-alpha]
*   Authors: Slate Thompson (Slate@kintyjones.com)
*   Created: 4/1/2026
*   Description: This class is built to allow for easy logging to terminal from other classes

*/
public with sharing class KJ_Tool_Logger {

    // -- Member Methods --------------------------------------------------------------------------
    // Level based logging methods
    public static void debug(){

    }
    public static void info(){

    }
    public static void warn(){

    }
    public static void error(){

    }

    // Universal logging method
    public static void log(KJ_Tool_LogEntry logEntry){
        String logOutputString;
        Syste
    }
    public static void log(KJ_Tool_LogEntry.Level level, String context, Datetime timestamp, String message, Object data){
        KJ_Tool_LogEntry logEntry(level, context, timestamp, message, data);
        log(logEntry);
    } 
}