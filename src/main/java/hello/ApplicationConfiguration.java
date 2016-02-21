package hello;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.orm.jpa.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EntityScan(basePackages = {
        "hello"
})
@EnableJpaRepositories(basePackages = {
        "hello"
})
public class ApplicationConfiguration {

    public static void main(String[] args) {
        SpringApplication.run(ApplicationConfiguration.class, args);
    }

}