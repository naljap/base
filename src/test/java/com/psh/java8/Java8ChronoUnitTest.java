package com.psh.java8;

import org.junit.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

@SpringBootTest
public class Java8ChronoUnitTest {

	/**
	 * Java 8 to replace the integer values used in old API to represent day, month, etc
	 *
	 * @throws Exception
     */
	@Test
	public void test() throws Exception {

		Java8ChronoUnitTest java8tester = new Java8ChronoUnitTest();
		java8tester.testChromoUnits();

	}

	public void testChromoUnits() {
		//Get the current date
		LocalDate today = LocalDate.now();
		System.out.println("Current date: " + today);

		//add 1 day to the current date
		LocalDate nextDay = today.plus(1, ChronoUnit.DAYS);
		System.out.println("Next day: " + nextDay);

		//add 1 week to the current date
		LocalDate nextWeek = today.plus(1, ChronoUnit.WEEKS);
		System.out.println("Next week: " + nextWeek);

		//add 1 month to the current date
		LocalDate nextMonth = today.plus(1, ChronoUnit.MONTHS);
		System.out.println("Next month: " + nextMonth);

		//add 1 year to the current date
		LocalDate nextYear = today.plus(1, ChronoUnit.YEARS);
		System.out.println("Next year: " + nextYear);

		//add 10 years to the current date
		LocalDate nextDecade = today.plus(1, ChronoUnit.DECADES);
		System.out.println("Date after ten year: " + nextDecade);
	}

}
