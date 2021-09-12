
package utilities;



import com.github.javafaker.Faker;

import java.util.HashMap;
import java.util.Map;

public class SpartanDataGenerator {

    public static Map<String,Object> createSpartan(){
        Faker faker=new Faker();
        String name = faker.name().firstName();
        String gender = faker.demographic().sex();
        long phone = Long.parseLong(faker.numerify("##########"));
        Map<String,Object> spartan=new HashMap<>();
        spartan.put("name",name);
        spartan.put("gender",gender);
        spartan.put("phone", phone);


        return spartan;

    }
}