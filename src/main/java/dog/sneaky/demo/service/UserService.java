package dog.sneaky.demo.service;


import dog.sneaky.demo.userinterface.controller.dto.UserDTO;

public interface UserService {
    UserDTO listsUser(UserDTO userDTO);
    int create();
}
