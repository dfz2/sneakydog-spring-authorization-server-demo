package dog.sneaky.demo.services;


import dog.sneaky.demo.controllers.controller.dto.UserDTO;
import dog.sneaky.demo.data.eneity.CustomUser;

public interface UserService {
    UserDTO listsUser(UserDTO userDTO);
    int create();

    int createUser(CustomUser customUser);
}
