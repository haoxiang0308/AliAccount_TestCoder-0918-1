import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FlowerShopController {

    @GetMapping("/flowers")
    public String getFlowers() {
        return "Welcome to the Flower Shop! Here are our beautiful flowers.";
    }
}