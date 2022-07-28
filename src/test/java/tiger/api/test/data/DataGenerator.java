package tiger.api.test.data;

import com.github.javafaker.Faker;

public class DataGenerator {
// Gena Zykov
	public static String getEmail() {
		Faker faker = new Faker();
		return faker.name().firstName() + faker.name().lastName() + "@gmail.com";

	}
// Change get method phoneNumber
	public static String getPhoneNumber() {
		Faker faker = new Faker();
		return faker.phoneNumber().cellPhone();

	}

	public static String getFirstName() {
		Faker faker = new Faker();
		return faker.name().firstName();
				
	}
	//change method getLastName
	public static String getLastName() {
		Faker faker = new Faker();
		return faker.name().lastName();
		
				
	}
	
	public static String getDob() {
		Faker faker = new Faker();
	
		return faker.date().birthday().toString();
	}
	
	
	public static void main(String[] args) {
		System.out.println(getEmail());
		System.out.println(getFirstName());
		System.out.println(getLastName());
	}
	
	
	
}
