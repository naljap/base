package com.psh.java8.rambda;

import org.junit.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class Java8RambdaExpressionsTest {

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

		Java8RambdaExpressionsTest tester = new Java8RambdaExpressionsTest();

		//with type declaration
		MathOperation addition = (int a, int b) -> a + b;

		//with out type declaration
		MathOperation subtraction = (a, b) -> a - b;

		//with return statement along with curly braces
		MathOperation multiplication = (int a, int b) -> { return a * b; }; // MY : curly brace를 사용하면 return 해야 함

		//without return statement and without curly braces
		MathOperation division = (int a, int b) -> a / b;

		System.out.println("10 + 5 = " + tester.operate(10, 5, addition));
		System.out.println("10 - 5 = " + tester.operate(10, 5, subtraction));
		System.out.println("10 x 5 = " + tester.operate(10, 5, multiplication));
		System.out.println("10 / 5 = " + tester.operate(10, 5, division));

		//without parenthesis
		GreetingService greetService1 = message ->
				System.out.println("Hello " + message);

		//with parenthesis
		GreetingService greetService2 = (message) ->
				System.out.println("Hello " + message);

		greetService1.sayMessage("Mahesh");
		greetService2.sayMessage("Suresh");

	}

	interface MathOperation {
		int operation(int a, int b);
	}

	interface GreetingService {
		void sayMessage(String message);
	}

	private int operate(int a, int b, MathOperation mathOperation) {
		return mathOperation.operation(a, b);
	}

}
