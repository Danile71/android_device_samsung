package org.davis.inputdisabler;

/*
 * Created by Dāvis Mālnieks on 04/10/2015
 * (m) Danil_e71
 */

public final class Constants {
    private Constants() {

    }
    //touchscreen
    public static final String TS_PATH = "/sys/class/input/input3/enabled";
    //keys
    public static final String TK_PATH = "/sys/class/input/input1/enabled";

	// Doze intent

	public static final String ACTION_DOZE_PULSE_STARTING = "android.intent.action.DOZE_PULSE_STARTING";
}
