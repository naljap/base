package com.psh.common.controller;

import com.psh.common.domain.User;
import com.psh.common.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class UserController {

    @Autowired
    UserService userService;
    
    @RequestMapping(value = "api/user", method = RequestMethod.GET)
    List<User> getUsers() {
        List<User> user = userService.findAll();
        return user;
    }

    @RequestMapping(value = "api/user/{userid}", method = RequestMethod.GET)
    User getUser(@PathVariable String userid) {
        User user = userService.findOne(userid);
        return user;
    }
    
    @RequestMapping(value = "api/root/user/{userid}", method = RequestMethod.PUT)
    User putUser(@PathVariable String userid, @RequestBody User user) {
        user.setUserid(userid);
        return userService.update(user);
    }
    
    @RequestMapping(value = "api/root/user/{userid}/role/{role}", method = RequestMethod.PUT)
    User putUserRole(@PathVariable("userid") String userid, @PathVariable("role") String role) {
        User user = userService.findOne(userid);
        user.setRole(role);
        return userService.update(user);
    }

    @RequestMapping(value = "api/root/user/{userid}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    void deleteUser(@PathVariable String userid) {
        userService.delete(userid);
    }
}