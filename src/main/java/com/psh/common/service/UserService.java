package com.psh.common.service;

import com.psh.common.domain.User;
import com.psh.common.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserService {

    @Autowired
    UserRepository userRepository;
    
    public List<User> findAll() {
        return userRepository.findAllOrderByName();
    }
    
    public User findOne(String userid) {
        return userRepository.findOne(userid);
    }

    public User create(User user) {
        return userRepository.save(user);
    }

    public User update(User user) {
        return userRepository.save(user);
    }

    public void delete(String userid) {
    	userRepository.delete(userid);
    }
}