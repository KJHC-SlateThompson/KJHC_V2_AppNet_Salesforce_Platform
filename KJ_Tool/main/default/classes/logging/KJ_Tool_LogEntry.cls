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
            when ERROR  { Level.ERROR; }
            when WARN   { Level.WARN; }
            when INFO   { Level.INFO; }
            when else   { Level.DEBUG; }
        }
    }
    public static Level mapToLogEntryLevel(KJ_Tool_Exception.Level eLevel){
        switch on eLevel {
            when KJ_Tool_Exception.Level.LOW    { return Level.WARN; }
            when KJ_Tool_Exception.Level.HIGH   { return Level.ERROR; }
            when KJ_Tool_Exception.Level.FATAL  { return Level.ERROR; }
            when else                           { return KJ_Tool_LogEntry.Level.ERROR; }
        }
    }
    public static LoggingLevel mapToLoggingLevel(Level logEntryLevel){
        switch on logEntryLevel {
            when Level.ERROR    { return LoggingLevel.ERROR; }
            when Level.INFO     { return LoggingLevel.INFO; }
            when Level.WARN     { return LoggingLevel.WARN; }
            when else           { return LoggingLevel.DEBUG; }
        }
    }


    public static final String DEFAULT_MESSAGE = 'NO MESSAGE PROVIDED';
    public static final KJ_Tool_Origin DEFAULT_ORIGIN = KJ_Tool_Origin.fromApex('KJ_Tool_LogEntry','DEFAULT_ORIGIN');

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
        origin = initOrigin;
        timestamp = initTimestamp;
        message = initMessage;
    }

    // Getters
    public Level getLevel()             { return level; } 
    public KJ_Tool_Origin getOrigin()   { return origin; } 
    public Datetime getTimestamp()      { return timestamp; } 
    public String getMessage()          { return message; } 

}