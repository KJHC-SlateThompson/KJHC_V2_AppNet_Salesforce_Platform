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
    public static final Level DEFAULT_LEVEL = Level.DEBUG;

    public static Level mapToLogEntryLevel(LoggingLevel logLevel){
        switch on logLevel {
            when ERROR  { return Level.ERROR; }
            when WARN   { return Level.WARN; }
            when INFO   { return Level.INFO; }
            when else   { return Level.DEBUG; }
        }
    }
    public static Level mapToLogEntryLevel(KJ_Tool_Exception.Level eLevel){
        switch on eLevel {
            when LOW    { return Level.WARN; }
            when HIGH   { return Level.ERROR; }
            when FATAL  { return Level.ERROR; }
            when else   { return KJ_Tool_LogEntry.Level.ERROR; }
        }
    }
    public static LoggingLevel mapToLoggingLevel(Level logEntryLevel){
        switch on logEntryLevel {
            when ERROR    { return LoggingLevel.ERROR; }
            when INFO     { return LoggingLevel.INFO; }
            when WARN     { return LoggingLevel.WARN; }
            when else     { return LoggingLevel.DEBUG; }
        }
    }


    private static final String DEFAULT_MESSAGE = 'NO MESSAGE PROVIDED';
    private static final KJ_Tool_Origin DEFAULT_ORIGIN = KJ_Tool_Origin.fromUnspecified();

    //*-- Member Variables ------------------------------------------------------------------------
    private Level level;            
    private KJ_Tool_Origin origin;
    private Datetime timestamp;
    private String message;

    //*-- Member Functions ------------------------------------------------------------------------
    // Constructors
    public KJ_Tool_LogEntry(Level initLevel, KJ_Tool_Origin initOrigin, Datetime initTimestamp, String initMessage) {
        initLogEntry(
            initLevel,
            initOrigin,
            initTimestamp,
            initMessage
        );
    }
    public KJ_Tool_LogEntry(Level initLevel, KJ_Tool_Origin initOrigin, String initMessage) {
        initLogEntry(
            initLevel, 
            initOrigin, 
            System.now(), 
            initMessage
        );
    }
    public KJ_Tool_LogEntry(Level initLevel, String initMessage) {
        initLogEntry(
            initLevel, 
            DEFAULT_ORIGIN, 
            System.now(), 
            initMessage
        );
    }
    public KJ_Tool_LogEntry(Level initLevel) {
        initLogEntry(
            initLevel, 
            DEFAULT_ORIGIN, 
            System.now(), 
            DEFAULT_MESSAGE
        );
    }
    public KJ_Tool_LogEntry(String initMessage) {
        initLogEntry(
            DEFAULT_LEVEL, 
            DEFAULT_ORIGIN, 
            System.now(), 
            initMessage
        );
    }

    public KJ_Tool_LogEntry() {
        initLogEntry(
            DEFAULT_LEVEL, 
            DEFAULT_ORIGIN, 
            System.now(), 
            DEFAULT_MESSAGE
        );
    }

    // Constructor base method
    private void initLogEntry(Level initLevel, KJ_Tool_Origin initOrigin, Datetime initTimestamp, String initMessage){
        level = initLevel;
        
        // Null check when assigning origin
        if(origin != null){
            origin = initOrigin;
        } else {
            origin = DEFAULT_ORIGIN;
        }

        timestamp = initTimestamp;
        message = initMessage;
    }

    // Getters
    public Level getLevel()             { return level; } 
    public KJ_Tool_Origin getOrigin()   { return origin; } 
    public Datetime getTimestamp()      { return timestamp; } 
    public String getMessage()          { return message; } 

}