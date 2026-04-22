/* 
*   File: KJ_Tool_Exception.cls
*   Authors: Slate Thompson (Slate@kintyjones.com)
*   Created: 4/13/2026
*   Description: This class acts as the base layer to describe an exception within the framework
*/

public with sharing class KJ_Tool_Exception extends Exception{
    //*-- Constants -------------------------------------------------------------------------------
    public enum Code {
        TEST_EXCEPTION,
    }

    public enum Level {
        LOW,
        HIGH,
        FATAL
    }

    //*-- Member Variables ------------------------------------------------------------------------
    public Code             code        { get; private set; }
    public Level            level       { get; private set; }
    public String           message     { get; private set; }
    public KJ_Tool_Origin   origin      { get; private set; }

    //*-- Member Methods --------------------------------------------------------------------------
    // factory methods
    private static KJ_Tool_Exception build(Code newCode, Level newLevel, String newMessage, KJ_Tool_Origin newOrigin){
        KJ_Tool_Exception newException = new KJ_Tool_Exception();

        newException.code = newCode;
        newException.level = newLevel;
        newException.message = newMessage;
        newException.origin = newOrigin;

        return newException;
    }

    public static KJ_Tool_Exception low(Code code, String message, KJ_Tool_Origin origin){
        return build(code, Level.LOW, message, origin);
    }
    public static KJ_Tool_Exception low(Code code, String message){
        return low(code, message, null);
    }

    public static KJ_Tool_Exception high(Code code, String message, KJ_Tool_Origin origin){
        return build(code, Level.HIGH, message, origin);
    }
    public static KJ_Tool_Exception high(Code code, String message){
        return high(code, message, null);
    }

    public static KJ_Tool_Exception fatal(Code code, String message, KJ_Tool_Origin origin){
        return build(code, level.FATAL, message, origin);
    }
    public static KJ_Tool_Exception fatal(Code code, String message){
        return fatal(code, message, null);
    }

    // Setters
    public override void setMessage(String newMessage){
        message = newMessage;
    }
    public void setOrigin(KJ_Tool_Origin newOrigin){
        origin = newOrigin;
    }
}