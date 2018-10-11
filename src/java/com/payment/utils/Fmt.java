/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.payment.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.TimeZone;
import java.util.Date;

/**
 *
 * @author admin
 */
public class Fmt {

    private static SimpleDateFormat shortDate;
    private static SimpleDateFormat longDate;
    private static SimpleDateFormat detailedDate;

    public final static String SHORT_ISO_FMT = "yyyy-MM-dd";
    public final static String SHORT_DATE_FMT = "dd/MM/yyyy";
    public final static String LONG_DATE_FMT = "MMMM dd, yyyy";
    public final static String DETAILED_DATE_FMT = "YYYY-MM-dd, hh:mm:ss";

    private static SimpleDateFormat getDateFormat(String format) {
        SimpleDateFormat fmt = new SimpleDateFormat(format, Locale.getDefault());
        fmt.setTimeZone(TimeZone.getDefault());
        return fmt;
    }

    private static SimpleDateFormat getShortISOFmt() {
        return shortDate == null ? getDateFormat(SHORT_ISO_FMT) : shortDate;
    }

    private static SimpleDateFormat getShortDateFmt() {
        return shortDate == null ? getDateFormat(SHORT_DATE_FMT) : shortDate;
    }

    private static SimpleDateFormat getLongDateFmt() {
        return longDate == null ? getDateFormat(LONG_DATE_FMT) : longDate;
    }

    private static SimpleDateFormat getDetailedDateFmt() {
        return detailedDate == null ? getDateFormat(DETAILED_DATE_FMT) : detailedDate;
    }

    public static String toISODate(Date date) {
        return (date == null) ? "" : getShortISOFmt().format(date);
    }

    public static String toShortDate(Date date) {
        return (date == null) ? "" : getShortDateFmt().format(date);
    }

    public static String toLongDate(Date date) {
        return (date == null) ? "" : getLongDateFmt().format(date);
    }

    public static String toDetailedDate(Date date) {
        return (date == null) ? "" : getDetailedDateFmt().format(date);
    }

    public static String toTitleCase(String input) {
        StringBuilder titleCase = new StringBuilder();
        boolean nextTitleCase = true;

        for (char c : input.toCharArray()) {
            if (Character.isSpaceChar(c)) {
                nextTitleCase = true;
            } else if (nextTitleCase) {
                c = Character.toTitleCase(c);
                nextTitleCase = false;
            }

            titleCase.append(c);
        }

        return titleCase.toString();
    }

    public static String toDec(double val) {
        return String.format("%.2f", val);
    }

    public static String nullIfBlank(String str) {
        return str == "" ? null : str;
    }

}
