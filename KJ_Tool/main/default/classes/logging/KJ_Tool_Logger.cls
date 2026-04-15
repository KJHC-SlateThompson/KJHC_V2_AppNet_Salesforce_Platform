/* 
*   File: KJ_Tool_Logger.cls
*   Authors: Slate Thompson (Slate@kintyjones.com)
*   Created: 4/1/2026
*   Description: This class is built to allow for easy logging to terminal from other classes

*/
public with sharing class KJ_Tool_Logger {
    //*-- Member Methods --------------------------------------------------------------------------
    // Level based logging methods
    public static void debug(KJ_Tool_Origin origin, String message){
        KJ_Tool_LogEntry logEntry = new KJ_Tool_LogEntry(
            KJ_Tool_LogEntry.Level.DEBUG,
            origin,
            message
        );
        log(logEntry);
    }
    public static void debug(String message){
        debug(null, message);
    }

    public static void info(KJ_Tool_Origin origin, String message){
        KJ_Tool_LogEntry logEntry = new KJ_Tool_LogEntry(
            KJ_Tool_LogEntry.Level.INFO,
            origin,
            message
        );
        log(logEntry);
    }
    public static void info(String message){
        info(null, message);
    }

    public static void warn(KJ_Tool_Origin origin, String message){
        KJ_Tool_LogEntry logEntry = new KJ_Tool_LogEntry(
            KJ_Tool_LogEntry.Level.WARN,
            origin,
            message
        );
        log(logEntry);
    }
    public static void warn(String message){
        warn(null, message);
    }
    public static void warn(KJ_Tool_Exception e){
        warn(e.origin, KJ_Tool_Formatter.toString(e));
    }

    public static void error(KJ_Tool_Origin origin, String message){
        KJ_Tool_LogEntry logEntry = new KJ_Tool_LogEntry(
            KJ_Tool_LogEntry.Level.DEBUG,
            origin,
            message
        );
        log(logEntry);
    }
    public static void error(String message){
        error(null, message);
    }
    public static void error(KJ_Tool_Exception e){
        error(e.origin, KJ_Tool_Formatter.toString(e));
    }


    // Universal logging method
    public static void log(KJ_Tool_LogEntry logEntry){
        String logEntryOutputString = KJ_Tool_Formatter.toString(logEntry); // will translate log entry to string using method here
        LoggingLevel logEntryLevel = KJ_Tool_LogEntry.mapToLoggingLevel(logEntry.getLevel());

        System.debug(logEntryLevel, logEntryOutputString);
    }

}