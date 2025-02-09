package helpers;

import com.github.javafaker.Faker;

public class DataGenerator {
    public static String getRandomEmailId(){
    Faker faker = new Faker();
    String email = faker.name().firstName().toLowerCase() + faker.random().nextInt(0,100) + "test.com";
    return email;
    }
    
    public static String getRandomName(){
        Faker faker = new Faker();
        String randomName = faker.name().username();
        return randomName;
    }
}