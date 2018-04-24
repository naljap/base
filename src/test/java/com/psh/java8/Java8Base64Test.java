package com.psh.java8;

import org.junit.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.UUID;

@SpringBootTest
public class Java8Base64Test {

	/**
	 * Java 8 now has inbuilt encoder and decoder for Base64 encoding
	 *
	 * @throws Exception
     */
	@Test
	public void test() throws Exception {

		Java8Base64Test java8Tester = new Java8Base64Test();
		java8Tester.testBase64();

	}

	public void testBase64() {

		String input = "TutorialsPoint?java8";

		try {

			System.out.println("Original String: " + input);

			// Encode using basic encoder
			String base64encodedString = Base64.getEncoder().encodeToString(input.getBytes("utf-8"));
			System.out.println("Base64 Encoded String (Basic) :" + base64encodedString);

			// Decode
			byte[] base64decodedBytes = Base64.getDecoder().decode(base64encodedString);
			System.out.println("Base64 Decoded String: " + new String(base64decodedBytes, "utf-8"));

			// Encode using url encoder
			base64encodedString = Base64.getUrlEncoder().encodeToString(input.getBytes("utf-8"));
			System.out.println("Base64 Encoded String (URL) :" + base64encodedString);

			// Decode
			base64decodedBytes = Base64.getUrlDecoder().decode(base64encodedString);
			System.out.println("Base64 Decoded String: " + new String(base64decodedBytes, "utf-8"));


			// Encode using mime encoder
			StringBuilder stringBuilder = new StringBuilder();

			for (int i = 0; i < 10; ++i) {
				stringBuilder.append(UUID.randomUUID().toString());
			}

			byte[] mimeBytes = stringBuilder.toString().getBytes("utf-8");
			String mimeEncodedString = Base64.getMimeEncoder().encodeToString(mimeBytes);
			System.out.println("Base64 Encoded String (MIME) :" + mimeEncodedString);

			// Decode
			base64decodedBytes = Base64.getMimeDecoder().decode(mimeEncodedString);
			System.out.println("Base64 Decoded String: " + new String(base64decodedBytes, "utf-8"));

		} catch(UnsupportedEncodingException e) {
			System.out.println("Error :" + e.getMessage());
		}

	}

}
