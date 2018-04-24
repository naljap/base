package com.psh.java8.rambda;

import org.junit.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class Java8DefaultMethodTest {

	/**
	 * 3. default method
	 * 	 new concept of default method implementation in interfaces. This capability is added for backward compatibility so that old interfaces can be used to leverage the lambda expression capability of Java 8.
	 * 	 Java 8 introduces default method so that List/Collection interface can have a default implementation of forEach method
	 *
	 * @throws Exception
     */
	@Test
	public void test() throws Exception {

		System.out.println("multiple implements 시 solution 1");
		Vehicle vehicle = new Car();
		vehicle.print();

		System.out.println("multiple implements 시 solution 2");
		Vehicle vehicle2 = new Car2();
		vehicle2.print();

	}

	interface Vehicle {

		default void print() {
			System.out.println("I am a vehicle!");
		}

		static void blowHorn() {
			System.out.println("Blowing horn!!!");
		}
	}

	interface FourWheeler {

		default void print() {
			System.out.println("I am a four wheeler!");
		}
	}

	/**
	 * multiple implements 시 solution 1 : super keyword로 구분한다
	 */
	public class Car implements Vehicle, FourWheeler {

		public void print() {
			Vehicle.super.print();
			FourWheeler.super.print();
			Vehicle.blowHorn();
			System.out.println("I am a car!");
		}
	}

	/**
	 * multiple implements 시 solution 2 : overriding
	 */
	class Car2 implements Vehicle, FourWheeler {

		public void print() {
			System.out.println("I am a car2!");
		}
	}

}
