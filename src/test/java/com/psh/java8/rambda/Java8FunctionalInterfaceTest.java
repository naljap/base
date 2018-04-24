package com.psh.java8.rambda;

import org.junit.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Arrays;
import java.util.List;
import java.util.function.Predicate;

@SpringBootTest
public class Java8FunctionalInterfaceTest {

	/**
	 * 3. characteristics of a lambda expression.
	 * 	 Optional type declaration − No need to declare the type of a parameter. The compiler can inference the same from the value of the parameter.
	 * 	 Optional parenthesis around parameter − No need to declare a single parameter in parenthesis. For multiple parameters, parentheses are required.
	 * 	 Optional curly braces − No need to use curly braces in expression body if the body contains a single statement.
	 * 	 Optional return keyword − The compiler automatically returns the value if the body has a single expression to return the value. Curly braces are required to indicate that expression returns a value.
	 *
	 * @throws Exception
     */
	@Test
	public void test() throws Exception {

		List<Integer> list = Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9);

		// Predicate<Integer> predicate = n -> true
		// n is passed as parameter to test method of Predicate interface
		// test method will always return true no matter what value n has.

		System.out.println("Print all numbers:");

		//pass n as parameter
		eval(list, n->true);

		// Predicate<Integer> predicate1 = n -> n%2 == 0
		// n is passed as parameter to test method of Predicate interface
		// test method will return true if n%2 comes to be zero

		System.out.println("Print even numbers:");
		eval(list, n-> n%2 == 0 );

		// Predicate<Integer> predicate2 = n -> n > 3
		// n is passed as parameter to test method of Predicate interface
		// test method will return true if n is greater than 3.

		System.out.println("Print numbers greater than 3:");
		eval(list, n-> n > 3 );

	}

	public static void eval(List<Integer> list, Predicate<Integer> predicate) {

		for(Integer n: list) {

			if(predicate.test(n)) {
				System.out.println(n + " ");
			}
		}
	}

}
