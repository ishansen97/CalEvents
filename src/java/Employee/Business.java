package Employee;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Business extends Time {

    public Business() {
	super();
    }

    // Function is called to display operating business hours (index.jsp)
    public static String getBusinessHours() throws ClassNotFoundException, SQLException {

	//Creating a new Time object
	Time time = new Time();
	time.getOpeningTime();
	time.getClosingTime();

	// Setting date format to be displayed as operating hours
	SimpleDateFormat timeFormat = new SimpleDateFormat("hh:mm a");

	// Getting values form time class(Parent) and formatting format accordingly
	String businessOpensAt = timeFormat.format(openingTime);
	String businessClosesAt = timeFormat.format(closingTime);

	String operatingHours = businessOpensAt + " to " + businessClosesAt;

	return operatingHours;

    }
    
    // Function will execute after operating business hours are over. This is to logout any user from using the system after operating hours.
    public static boolean setAutoLogOut() throws ClassNotFoundException, SQLException {

	Time time = new Time();
	String newClosingTime = time.getClosingTime().replace(":", "");

	Date date = new Date();
	SimpleDateFormat timeFormat = new SimpleDateFormat("HHmmss");

	int newClosingTimeInteger = Integer.parseInt(newClosingTime);
	int currentTime = Integer.parseInt(timeFormat.format(date));

	int signOutTime = newClosingTimeInteger - currentTime;

	return signOutTime <= 0;
    }

    // Function is called at login to see if operating hours are in tact. This function checks whether the current time is before or after the operating business hours.  
    public static boolean isOpenForBusiness() throws ClassNotFoundException, SQLException {

	Time time = new Time();
	String businessOpeningTime = time.getOpeningTime().replace(":", "");
	String businessClosingTime = time.getClosingTime().replace(":", "");

	Date date = new Date();
	SimpleDateFormat timeFormat = new SimpleDateFormat("HHmmss");

	int openingTimeTnteger = Integer.parseInt(businessOpeningTime);
	int openingTimeInteger = Integer.parseInt(businessClosingTime);
	int currentTime = Integer.parseInt(timeFormat.format(date));

	int businessOpens = openingTimeTnteger - currentTime;
	int businessCloses = openingTimeInteger - currentTime;

	return businessOpens < 0 && businessCloses > 0;
    }

}
