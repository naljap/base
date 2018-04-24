package com.psh.java8.rambda;

import org.junit.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

@SpringBootTest
public class Java8MethodReferenceTest {

	/**
	 * 3. method reference : help to point to methods by their names. A method reference is described using "::" symbol.
	 * 	- types of methods
	 *	Static methods
	 *	Instance methods
	 *	Constructors using new operator (TreeSet::new)
	 *
	 * @throws Exception
     */
	@Test
	public void test() throws Exception {

		List names = new ArrayList();

		names.add("Mahesh");
		names.add("Suresh");
		names.add("Ramesh");
		names.add("Naresh");
		names.add("Kalpesh");

		names.forEach(System.out::println);

	}

}
