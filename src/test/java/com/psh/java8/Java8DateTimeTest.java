package com.psh.java8;

import org.junit.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.*;
import java.util.Date;

@SpringBootTest
public class Java8DateTimeTest {

	/**
	 * LocalDate/LocalTime and LocalDateTime classes simplify the development where timezones are not required
	 *
	 *
	 * toInstant() method is added to the original Date and Calendar objects, which can be used to convert them to the new Date-Time API.
	 * Use an ofInstant(Insant,ZoneId) method to get a LocalDateTime or ZonedDateTime object
	 *
	 * @throws Exception
     */
	@Test
	public void test() throws Exception {

		Java8DateTimeTest java8tester = new Java8DateTimeTest();

		// Local Test
		java8tester.testLocalDateTime();

		// Zoned Test
		java8tester.testZonedDateTime();

		// Backward Compatibility
		java8tester.testBackwardCompatability();

	}

	public void testLocalDateTime() {

		// Get the current date and time
		LocalDateTime currentTime = LocalDateTime.now();
		System.out.println("Current DateTime: " + currentTime);

		LocalDate date1 = currentTime.toLocalDate();
		System.out.println("date1: " + date1);

		Month month = currentTime.getMonth();
		int day = currentTime.getDayOfMonth();
		int seconds = currentTime.getSecond();
		DayOfWeek dayOfWeek = currentTime.getDayOfWeek();

		System.out.println("Month: " + month +", day: " + day +", seconds: " + seconds + ", dayOfWeek: " + dayOfWeek);

		LocalDateTime date2 = currentTime.withDayOfMonth(10).withYear(2012);
		System.out.println("date2: " + date2);

		//12 december 2014
		LocalDate date3 = LocalDate.of(2014, Month.DECEMBER, 12);
		System.out.println("date3: " + date3);

		//22 hour 15 minutes
		LocalTime date4 = LocalTime.of(22, 15);
		System.out.println("date4: " + date4);

		//parse a string
		LocalTime date5 = LocalTime.parse("20:15:30");
		System.out.println("date5: " + date5);
	}

	public void testZonedDateTime() {

		// Get the currentTime date and time
		ZonedDateTime currentTime = ZonedDateTime.now();
		System.out.println("currentTime: " + currentTime);

		Month month = currentTime.getMonth();
		int day = currentTime.getDayOfMonth();
		int seconds = currentTime.getSecond();
		DayOfWeek dayOfWeek = currentTime.getDayOfWeek();

		System.out.println("Month: " + month +", day: " + day +", seconds: " + seconds + ", dayOfWeek: " + dayOfWeek);

		ZonedDateTime date2 = ZonedDateTime.parse("2007-12-03T10:15:30+05:30[Asia/Karachi]");
		System.out.println("date2: " + date2);


		ZoneId id = ZoneId.of("Europe/Paris");
		System.out.println("ZoneId: " + id);

		ZoneId currentZone = ZoneId.systemDefault();
		System.out.println("CurrentZone: " + currentZone);
	}

	public void testBackwardCompatability() {
		//Get the current date
		Date currentDate = new Date();
		System.out.println("Current date: " + currentDate);

		//Get the instant of current date in terms of milliseconds
		Instant now = currentDate.toInstant();
		ZoneId currentZone = ZoneId.systemDefault();

		LocalDateTime localDateTime = LocalDateTime.ofInstant(now, currentZone);
		System.out.println("Local date: " + localDateTime);

		ZonedDateTime zonedDateTime = ZonedDateTime.ofInstant(now, currentZone);
		System.out.println("Zoned date: " + zonedDateTime);
	}

}
