/* 
*   File: KJ_Tool_LogEntry.cls
*   Authors: Slate Thompson (Slate@kintyjones.com)
*   Created: 4/1/2026
*   Description: This class is built to structure the data of log entries

*/
public with sharing class KJ_Tool_LogEntry {
    //*-- Constants -------------------------------------------------------------------------------
    public enum Level {
        DEBUG,
        INFO,
        WARN,
        ERROR
    }

    public static final String DEFAULT_CONTEXT = 'No Context';
    public static final Level DEFAULT_LEVEL = Level.DEBUG;

    //*-- Member Variables ------------------------------------------------------------------------
    private Level level;            
    private String context;
    private Datetime timestamp;
    private String message;
    private Object data;

    //*-- Constructors ----------------------------------------------------------------------------
    public KJ_Tool_LogEntry(Level initLevel, String initContext, Datetime initTimestamp, String initMessage, Object initData) {
        initLogEntry(
            initLevel,
            initContext,
            initTimestamp,
            initMessage,
            initData
        );
    }

    public KJ_Tool_LogEntry(Level initLevel, String initContext, String initMessage, Object initData) {
        initLogEntry(
            initLevel, 
            initContext, 
            System.now(), 
            initMessage, 
            initData
        );
    }

    public KJ_Tool_LogEntry(Level initLevel, String initMessage, Object initData) {
        initLogEntry(
            initLevel, 
            DEFAULT_CONTEXT, 
            System.now(), 
            initMessage, 
            initData
        );
    }

    public KJ_Tool_LogEntry(Level initLevel, String initMessage) {
        initLogEntry(
            initLevel, 
            DEFAULT_CONTEXT, 
            System.now(), 
            initMessage, 
            null
        );
    }

    public KJ_Tool_LogEntry(Level initLevel, Object initData) {
        initLogEntry(
            initLevel, 
            DEFAULT_CONTEXT, 
            System.now(), 
            null, 
            initData
        );
    }


    public KJ_Tool_LogEntry(String initMessage, Object initData) {
        initLogEntry(
            DEFAULT_LEVEL, 
            DEFAULT_CONTEXT, 
            System.now(), 
            initMessage, 
            initData
        );
    }

    public KJ_Tool_LogEntry(String initMessage) {
        initLogEntry(
            DEFAULT_LEVEL, 
            DEFAULT_CONTEXT, 
            System.now(), 
            initMessage, 
            null
        );
    }

    public KJ_Tool_LogEntry(Object initData) {
        initLogEntry(
            DEFAULT_LEVEL, 
            DEFAULT_CONTEXT, 
            System.now(), 
            null, 
            initData
        );
    }

    //*-- Member Functions ------------------------------------------------------------------------
    // Constructor base method
    private void initLogEntry(Level initLevel, String initContext, Datetime initTimestamp, String initMessage, Object initData){
        level = initLevel;
        context = initContext;
        timestamp = initTimestamp;
        message = initMessage;
        data = initData;
    }

    // Getters
    public Level getLevel()         { return level; } 
    public String getContext()      { return context; } 
    public Datetime getTimestamp()  { return timestamp; } 
    public String getMessage()      { return message; } 
    public Object getData()         { return data; } 

    // Method to map custom logEntry level enum to native log level enum and vice versa
    public static LoggingLevel mapLogLevel(KJ_Tool_LogEntry.Level logEntryLevel){
        switch on logEntryLevel {
            when ERROR { return LoggingLevel.ERROR; }
            when WARN { return LoggingLevel.WARN; }
            when INFO { return LoggingLevel.INFO; }
            when else { return LoggingLevel.DEBUG; }
        }
    }
    public static KJ_Tool_LogEntry.Level mapLogLevel(LoggingLevel logLevel){
        switch on logLevel {
            when ERROR { return KJ_Tool_LogEntry.Level.ERROR; }
            when WARN { return KJ_Tool_LogEntry.Level.WARN; }
            when INFO { return KJ_Tool_LogEntry.Level.INFO; }
            when else { return KJ_Tool_LogEntry.Level.DEBUG; }
        }
    }
}