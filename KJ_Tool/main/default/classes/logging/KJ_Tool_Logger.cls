/* 
*   File: KJ_Tool_Logger.cls
*   Authors: Slate Thompson (Slate@kintyjones.com)
*   Created: 4/1/2026
*   Description: This class is built to allow for easy logging to terminal from other classes

*/
public with sharing class KJ_Tool_Logger {
    //*-- Member Methods --------------------------------------------------------------------------
    // Level based logging methods
    public static void debug(String context, String message, Object data){
        KJ_Tool_LogEntry logEntry = new KJ_Tool_LogEntry(
            KJ_Tool_LogEntry.Level.DEBUG,
            context,
            message,
            data
        );
        log(logEntry);
    }
    public static void debug(String message, Object data){
        debug(null, message, data);
    }
    public static void debug(String context, String message){
        debug(context, message, null);
    }
    public static void debug(String message){
        debug(null, message, null);
    }
    public static void debug(Object data){
        debug(null, null, data);
    }

    public static void info(String context, String message, Object data){
        KJ_Tool_LogEntry logEntry = new KJ_Tool_LogEntry(
            KJ_Tool_LogEntry.Level.INFO,
            context,
            message,
            data
        );
        log(logEntry);
    }
    public static void info(String message, Object data){
        info(null, message, data);
    }
    public static void info(String context, String message){
        info(context, message, null);
    }
    public static void info(String message){
        info(null, message, null);
    }
    public static void info(Object data){
        info(null, null, data);
    }

    public static void warn(String context, String message, Object data){
        KJ_Tool_LogEntry logEntry = new KJ_Tool_LogEntry(
            KJ_Tool_LogEntry.Level.WARN,
            context,
            message,
            data
        );
        log(logEntry);
    }
    public static void warn(String message, Object data){
        warn(null, message, data);
    }
    public static void warn(String context, String message){
        warn(context, message, null);
    }
    public static void warn(String message){
        warn(null, message, null);
    }
    public static void warn(Object data){
        warn(null, null, data);
    }

    public static void error(String context, String message, Object data){
        KJ_Tool_LogEntry logEntry = new KJ_Tool_LogEntry(
            KJ_Tool_LogEntry.Level.DEBUG,
            context,
            message,
            data
        );
        log(logEntry);
    }
    public static void error(String message, Object data){
        error(null, message, data);
    }
    public static void error(String context, String message){
        error(context, message, null);
    } 
    public static void error(String message){
        error(null, message, null);
    }
    public static void error(Object data){
        error(null, null, data);
    }



    // Universal logging method
    private static void log(KJ_Tool_LogEntry logEntry){
        String logEntryOutputString = KJ_Tool_Formatter.format(logEntry); // will translate log entry to string using method here
        LoggingLevel logEntryLevel = KJ_Tool_LogEntry.mapLogLevel(logEntry.getLevel());

        System.debug(logEntryLevel, logEntryOutputString);
    }

}