package com.psh.poc;

import org.junit.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

@SpringBootTest
public class ListRemoveTest {

	/**
	 * Java 8 now has inbuilt encoder and decoder for Base64 encoding
	 *
	 * @throws Exception
     */
	@Test
	public void test() throws Exception {

		ListRemoveTest tester = new ListRemoveTest();
		tester.testListRemove();

	}

	public void testListRemove() {

		List<String> historyList = new ArrayList<>();
		historyList.add("a");
		historyList.add("b");
		historyList.add("c");
		historyList.add("d");
		historyList.add("e");

		System.out.println("historyList size : " + historyList.size());

		for (int i = 0; i < historyList.size(); i++) {
			String history = historyList.get(i);
			for (int j = 0; j < historyList.size(); j++) {
					historyList.remove(history);
			}
		}
	}

}
