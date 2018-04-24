package com.psh.java8.rambda;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Arrays;
import java.util.function.BiFunction;

@SpringBootTest
public class RambdaBasicTest {

	/**
	 * 기본 람다 표현식
	 *
	 * @throws Exception
     */
	@Test
	public void rambdaComparatorTest() throws Exception {

		System.out.println("[Start] rambdaComparatorTest");

		String[] words = new String[] {"a", "aa", "aaaa", "aaa"};

		System.out.println("[Before] " + words[0] + ", " + words[3]);
		Arrays.sort( words, (o1, o2) -> Integer.compare(o1.length(), o2.length()) );
		System.out.println("[After] " + words[0] + ", " + words[3]);

	}


	/**
	 * BiFunction 클래스 사용
	 *
	 * @throws Exception
     */
	@Test
	public void rambdaBiFunctionTest() throws Exception {

		System.out.println("[Start] rambdaBiFunctionTest");

		String x = "aaa";
		String y = "abbb";
		int result;

		BiFunction<String, String, Integer> comp = (first, second) -> Integer.compare(first.length(), second.length());
		result = comp.apply(x, y);

		System.out.println("[Result] result : " + result);
		Assert.assertNotNull(result);

	}

}
