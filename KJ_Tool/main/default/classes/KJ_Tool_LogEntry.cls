/* 
*   File: KJ_Tool_LogEntry.cls
*   Version: [0.1.0 - Pre-alpha]
*   Authors: Slate Thompson (Slate@kintyjones.com)
*   Created: 4/1/2026
*   Description: This class is built to structure the data of log entries

*/
public with sharing class KJ_Tool_LogEntry {
    // -- Constants -------------------------------------------------------------------------------
    public enum Level {
        DEBUG,
        INFO,
        WARN,
        ERROR
    }

    public static final String DEFAULT_CONTEXT = 'No Context';
    public static final Level DEFAULT_LEVEL = Level.DEBUG;

    // -- Member Variables ------------------------------------------------------------------------
    Level level;            
    String context;
    Datetime timestamp;
    String message;
    Object data;

    // -- Constructors ----------------------------------------------------------------------------
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

    // -- Member Functions ------------------------------------------------------------------------
    private static void initLogEntry(Level initLevel, String initContext, Datetime initTimestamp, String initMessage, Object initData){
        level = initLevel;
        context = initContext;
        timestamp = initTimestamp;
        message = initMessage;
        data = initData;
    }
}