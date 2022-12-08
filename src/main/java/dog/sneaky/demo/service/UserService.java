package dog.sneaky.demo.service;


import dog.sneaky.demo.data.eneity.CustomUser;
import dog.sneaky.demo.userinterface.controller.dto.UserDTO;

public interface UserService {
    UserDTO listsUser(UserDTO userDTO);
    int create();

    int createUser(CustomUser customUser);
}
