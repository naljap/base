package com.psh.java8;

import org.junit.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.Period;
import java.time.temporal.ChronoUnit;

@SpringBootTest
public class Java8PeriodDurationTest {

	/**
	 * two specialized classes are introduced to deal with the time differences.
	 *
	 * @throws Exception
     */
	@Test
	public void test() throws Exception {

		Java8PeriodDurationTest java8tester = new Java8PeriodDurationTest();
		java8tester.testPeriod();
		java8tester.testDuration();

	}

	public void testPeriod() {
		//Get the current date
		LocalDate date1 = LocalDate.now();
		System.out.println("Current date: " + date1);

		//add 1 month to the current date
		LocalDate date2 = date1.plus(1, ChronoUnit.MONTHS);
		System.out.println("Next month: " + date2);

		Period period = Period.between(date2, date1);
		System.out.println("Period: " + period);
	}

	public void testDuration() {
		LocalTime time1 = LocalTime.now();
		Duration twoHours = Duration.ofHours(2);

		LocalTime time2 = time1.plus(twoHours);
		Duration duration = Duration.between(time1, time2);

		System.out.println("Duration: " + duration.toString());
	}

}
